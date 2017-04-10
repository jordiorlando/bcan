#include "beacon.h"

/* Protocol specifications */
#define BIT_PERIOD    960
#define NUM_BITS      16
#define BUFFER_LENGTH ((2 * NUM_BITS) + 2)
/* 1MHz */
#define TIMER_FREQUENCY 1000000
/* TIM3 CH3 */
#define PIN_R GPIO0
#define IC_R  TIM_IC3
/* TIM3 CH4 */
#define PIN_L GPIO1
#define IC_L  TIM_IC4

volatile bool is_reading = false;
volatile bool is_parsed = true;
volatile uint8_t received = 0;
volatile uint16_t buffer[BUFFER_LENGTH];
volatile uint16_t sensor = 0;
volatile uint32_t total = 0;

uint16_t beacon_id = 0x0000;


void tim3_isr(void) {
	uint16_t pin = 0;
	uint16_t pulse_length = 0;

	if (timer_get_flag(TIM3, TIM_SR_CC3IF)) {
		timer_clear_flag(TIM3, TIM_SR_CC3IF);
		pulse_length = TIM3_CCR3;
		pin = PIN_R;
	} else if (timer_get_flag(TIM3, TIM_SR_CC4IF)) {
		timer_clear_flag(TIM3, TIM_SR_CC4IF);
		pulse_length = TIM3_CCR4;
		pin = PIN_L;
	} else if (timer_get_flag(TIM3, TIM_SR_UIF)) {
		/* Timeout has ocurred, prepare for a new beacon. */
		timer_clear_flag(TIM3, TIM_SR_UIF);
		is_reading = false;
		sensor = 0;
		received = 0;
		timer_disable_update_event(TIM3);
		return;
	} else {
		timer_clear_flag(TIM3, 0x1E66);
		return;
	}

	if (!is_reading && (received == 0) && (pin != 0)) {
		/* Reset the counter. */
		timer_set_counter(TIM3, 0x0000);

		if (sensor == 0) {
			/* First edge detected. Enable timeout event. */
			timer_enable_update_event(TIM3);

			/* Store which sensor is receiving. */
			sensor = pin;
		} else {
			/* Second edge detected. Set is_reading flag. */
			is_reading = true;

			/* Reset the total received length. */
			total = 0;
		}
	} else if (is_reading && (pin == sensor)) {
		/* Reset the counter. */
		timer_set_counter(TIM3, 0x0000);

		if (received < BUFFER_LENGTH) {
			/* Store the edge data. */
			buffer[received] = pulse_length | ((received % 2) << 15);
			total += pulse_length;
			received++;
		}

		if ((received == BUFFER_LENGTH) || (total >= ((NUM_BITS + 8) * BIT_PERIOD))) {
			is_parsed = false;
		}
	}
}

static void beacon_gpio_setup(void) {
	/* Enable GPIOB clock. */
	rcc_periph_clock_enable(RCC_GPIOB);
}

static void beacon_timer_setup(void) {
	/* Set PB0 and PB1 to 'alternate function floating'. */
	gpio_mode_setup(GPIOB, GPIO_MODE_AF, GPIO_PUPD_NONE, PIN_R | PIN_L);

	/* Set PB0 and PB1 to alternate function 2. */
	gpio_set_af(GPIOB, GPIO_AF2, PIN_R | PIN_L);

	/* Enable TIM3 clock. */
	rcc_periph_clock_enable(RCC_TIM3);

	/* Enable TIM3 interrupt. */
	nvic_enable_irq(NVIC_TIM3_IRQ);

	/* Reset TIM3 peripheral to defaults. */
	timer_reset(TIM3);

	/* Set timer mode: 2x clock divider, edge aligned, direction up. */
	timer_set_mode(TIM3, TIM_CR1_CKD_CK_INT_MUL_2, TIM_CR1_CMS_EDGE, TIM_CR1_DIR_UP);

	/* Only generate update event on overflow. */
	timer_update_on_overflow(TIM3);

	/* Set the prescaler to have the timer run at the correct frequency. */
	timer_set_prescaler(TIM3, (rcc_apb1_frequency / TIMER_FREQUENCY) - 1);

	/* Count up to 0x7FFF (~32.7ms) before timeout event. */
	timer_set_period(TIM3, 0x7FFF);

	/* Set channel direction and used input. */
	timer_ic_set_input(TIM3, IC_R, TIM_IC_IN_TI3);
	timer_ic_set_input(TIM3, IC_L, TIM_IC_IN_TI4);

	/* Set input capture filter and sampling frequency. */
	timer_ic_set_filter(TIM3, IC_R, TIM_IC_OFF);
	timer_ic_set_filter(TIM3, IC_L, TIM_IC_OFF);

	/* Set input capture polarity to noninverted/both edges. */
	TIM3_CCER |= (TIM_CCER_CC3NP | TIM_CCER_CC3P);
	TIM3_CCER |= (TIM_CCER_CC4NP | TIM_CCER_CC4P);

	/* Enable input capture. */
	timer_ic_enable(TIM3, IC_R);
	timer_ic_enable(TIM3, IC_L);

	/* Enable input capture interrupts. */
	timer_enable_irq(TIM3, TIM_DIER_CC3IE);
	timer_enable_irq(TIM3, TIM_DIER_CC4IE);

	/* Enable update interrupt. */
	timer_enable_irq(TIM3, TIM_DIER_UIE);

	/* Enable counter. */
	timer_enable_counter(TIM3);
}

void beacon_setup(void) {
	beacon_gpio_setup();
	beacon_timer_setup();
}

bool beacon_available(void) {
	return !is_parsed;
}

uint16_t beacon_parse(void) {
	if (is_parsed) {
		return beacon_id;
	}

	uint8_t edges = received;
	uint8_t longest = 0;
	uint8_t bits = 0;
	uint16_t length = 0;

	for (uint8_t i = 1; i < edges; i++) {
		if (buffer[i] > buffer[longest]) {
			longest = i;
			break;
		}
	}

	for (uint8_t i = 0; i < edges; i++) {
		uint16_t pulse = buffer[(longest + i) % edges];
		uint8_t polarity = pulse >> 15;
		pulse &= ~(1 << 15);

		/* Round pulse length to the nearest multiple of BIT_PERIOD/2. */
		pulse += (BIT_PERIOD / 4);
		pulse /= (BIT_PERIOD / 2);
		length += pulse;

		if (((i == 0) && ((polarity != 1) || (pulse != 6))) ||
				((i == 1) && ((polarity != 0) || (pulse < 2) || (pulse > 3)))) {
			/* Malformed start bit. */
			break;
		} else if (length % 2) {
			beacon_id = (beacon_id << 1) | polarity;
			bits++;
		}

		if (bits == NUM_BITS) {
			break;
		}
	}

	is_parsed = true;
	return beacon_id;
}
