#include "beacon.h"

#define BIT_PERIOD    960
#define NUM_BITS      16
#define BUFFER_LENGTH ((2 * NUM_BITS) + 2)


volatile bool is_reading = false;
volatile uint8_t received = 0;
volatile uint16_t buffer[BUFFER_LENGTH];
volatile uint16_t sensor = 0;
volatile uint32_t total = 0;


static void beacon_gpio_setup(void) {
	/* Set PB0 and PB1 to 'input floating'. */
	gpio_mode_setup(GPIOB, GPIO_MODE_INPUT, GPIO_PUPD_NONE, GPIO0 | GPIO1);

	/* Set PB0 and PB1 alternate function to TIM3 CH3 and CH4. */
	gpio_set_af(GPIOB, GPIO_AF2, GPIO0 | GPIO1);
}

static void beacon_timer_setup(void) {
	/* Enable TIM3 clock. */
	rcc_periph_clock_enable(RCC_TIM3);

	/* Enable TIM3 interrupt. */
	nvic_enable_irq(NVIC_TIM3_IRQ);

	/* Reset TIM3 peripheral to defaults. */
	timer_reset(TIM3);

	/* Set timer mode: 2x clock divider, edge aligned, direction up. */
	timer_set_mode(TIM3, TIM_CR1_CKD_CK_INT_MUL_2, TIM_CR1_CMS_EDGE, TIM_CR1_DIR_UP);

	/* Set the prescaler to have the timer run at 1MHz. */
	timer_set_prescaler(TIM3, rcc_apb1_frequency / 1000000);

	/* Count up to 0x7FFF (~32.7ms) before timeout event. */
	timer_set_period(TIM2, 0x7FFF);

	/* Set channel direction and used input. */
	timer_ic_set_input(TIM3, TIM_IC3, TIM_IC_IN_TI3);
	timer_ic_set_input(TIM3, TIM_IC4, TIM_IC_IN_TI4);

	/* Set input capture polarity to noninverted/both edges. */
	TIM_CCER(TIM3) |= (TIM_CCER_CC3NP | TIM_CCER_CC3P);
	TIM_CCER(TIM3) |= (TIM_CCER_CC4NP | TIM_CCER_CC4P);

	/* Set input capture filter and sampling frequency. */
	timer_ic_set_filter(TIM3, TIM_IC3, TIM_IC_OFF);
	timer_ic_set_filter(TIM3, TIM_IC4, TIM_IC_OFF);

	/* Enable input capture. */
	timer_ic_enable(TIM3, TIM_IC3);
	timer_ic_enable(TIM3, TIM_IC4);

	/* Enable counter. */
	timer_enable_counter(TIM3);

	/* Enable input capture interrupts. */
	timer_enable_irq(TIM3, TIM_DIER_CC3IE);
	timer_enable_irq(TIM3, TIM_DIER_CC4IE);

	/* Enable update interrupt. */
	timer_enable_irq(TIM3, TIM_DIER_CC2IE);
}

void tim3_isr(void) {
	uint16_t pin = 0;
	uint16_t pulse_length = 0;

	if (timer_get_flag(TIM3, TIM_SR_UIF)) {
		/* Timeout has ocurred, prepare for a new beacon. */
		is_reading = false;
		sensor = 0;
		received = 0;
		timer_disable_update_event(TIM3);
		timer_clear_flag(TIM3, TIM_SR_UIF);
	} else if (timer_get_flag(TIM3, TIM_SR_CC3IF)) {
		pin = GPIO0;
		pulse_length = TIM_CCR3(TIM3);
		timer_clear_flag(TIM3, TIM_SR_CC3IF);
	} else if (timer_get_flag(TIM3, TIM_SR_CC4IF)) {
		pin = GPIO1;
		pulse_length = TIM_CCR4(TIM3);
		timer_clear_flag(TIM3, TIM_SR_CC4IF);
	}

	if (!is_reading && (received == 0) && (pin != 0)) {
		/* Reset the counter. */
		timer_set_counter(TIM3, 0);

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
		timer_set_counter(TIM3, 0);

		if (received < BUFFER_LENGTH) {
			/* Store the edge data. */
			if (gpio_get(GPIOB, sensor)) {
				/* Falling edge. */
				buffer[received] = pulse_length | (1 << 15);
			} else {
				/* Rising edge. */
				buffer[received] = pulse_length & ~(1 << 15);
			}

			received++;
			total += pulse_length;
		}
	}
}

void beacon_setup(void) {
	beacon_gpio_setup();
	beacon_timer_setup();
}

bool beacon_available(void) {
	if ((received == BUFFER_LENGTH) || (total >= ((NUM_BITS + 8) * BIT_PERIOD))) {
		return true;
	}

	return false;
}

uint16_t beacon_parse(void) {
	uint8_t longest = 0;
	uint8_t bits = 0;
	uint16_t length     = 0;
	uint16_t beacon_id = 0;

	for (uint8_t i = 1; i < BUFFER_LENGTH; i++) {
		if (buffer[i] > buffer[longest]) {
			longest = i;
			break;
		}
	}

	for (uint8_t i = 0; i < BUFFER_LENGTH; i++) {
		uint16_t pulse = buffer[(longest + i) % BUFFER_LENGTH];
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

	return beacon_id;
}
