#include "motor.h"

/* Voltage corresponding with maximum speed. Typically 12V at the motor. */
#define V_MAX_SPEED     12
/* Max track voltage for voltage divider = 16.1V */
#define V_DIVIDER_MAX   16
/* Frequency of PWM output. Higher values tend to be smoother (e.g. 10kHz). */
#define PWM_FREQUENCY   10000
/* 42MHz */
#define TIMER_FREQUENCY 42000000
/* PWM/timer frequencies must be chosen such that this does not exceed 65536. */
#define TIMER_PERIOD    (TIMER_FREQUENCY / PWM_FREQUENCY - 1)
/* Product of max speed (126) and this must not exceed 4294967295 (2^32 - 1). */
#define MULTIPLIER      (TIMER_PERIOD * V_MAX_SPEED * 65 / (2 * V_DIVIDER_MAX))
/* TIM4 CH3 */
#define A_PIN      PB8
#define A_OC       TIM_OC3
/* TIM4 CH4 */
#define B_PIN      PB9
#define B_OC       TIM_OC4
/* ADC12 */
#define VTRACK_PIN PC2
#define VTRACK_CH  ADC_CHANNEL12
/* ADC13 */
#define VMOTOR_PIN PC3
#define VMOTOR_CH  ADC_CHANNEL13
/* Temperature sensor */
#define TEMP_CH    ADC_CHANNEL16
/* Internal reference voltage */
#define VREF_CH    ADC_CHANNEL17
/* VBat sensor */
#define VBAT_CH    ADC_CHANNEL18
/* ADC channel indices. */
#define VTRACK 0
#define VMOTOR 1
#define TEMP   2
#define VBAT   3
#define GROUP_LENGTH 2


bool is_stopped         = false;
uint8_t speed           = MOTOR_STOP;
uint8_t direction       = MOTOR_FORWARD;
uint8_t regular_group[] = {VTRACK_CH, TEMP_CH}; // VMOTOR_CH, VBAT_CH

volatile uint8_t current_channel = GROUP_LENGTH;
volatile uint16_t channel_readings[GROUP_LENGTH];
volatile uint32_t duty_cycle = 0;


void adc_isr(void) {
	uint16_t voltage = adc_read_regular(ADC1);

	if (channel_readings[current_channel] != voltage) {
		channel_readings[current_channel] = voltage;

		if (!is_stopped && current_channel == VTRACK) {
			/* Target speed in range [0, 126] where 0 is stop/estop & 126 is max speed. */
			uint8_t target = speed ? speed - 1 : 0;

			/* Duty cycle in range [0, TIMER_PERIOD] from target speed & track voltage. */
			duty_cycle = MULTIPLIER * target / voltage;

			char print_buffer[50];
			sprintf(print_buffer, "Duty Cycle: %ld", duty_cycle);
			println(print_buffer);
			duty_cycle = TIMER_PERIOD / 2;

			if (direction == MOTOR_FORWARD) {
				timer_set_oc_value(TIM4, A_OC, duty_cycle);
				timer_set_oc_value(TIM4, B_OC, 0);
			} else {
				timer_set_oc_value(TIM4, A_OC, 0);
				timer_set_oc_value(TIM4, B_OC, duty_cycle);
			}
		}
	}

	current_channel++;
}

static void motor_timer_setup(void) {
	/* Set motor pins to 'alternate function floating'. */
	gpio_mode_setup(PORT(A_PIN), GPIO_MODE_AF, GPIO_PUPD_NONE, PIN(A_PIN));
	gpio_mode_setup(PORT(B_PIN), GPIO_MODE_AF, GPIO_PUPD_NONE, PIN(B_PIN));

	/* Set motor pins to alternate function 2. */
	gpio_set_af(PORT(A_PIN), GPIO_AF2, PIN(A_PIN));
	gpio_set_af(PORT(B_PIN), GPIO_AF2, PIN(B_PIN));

	/* Enable TIM4 clock. */
	rcc_periph_clock_enable(RCC_TIM4);

	/* Enable TIM4 interrupt. */
	// nvic_enable_irq(NVIC_TIM4_IRQ);

	/* Reset TIM3 peripheral to defaults. */
	timer_reset(TIM4);

	/* Set timer mode: no clock divider, edge aligned, direction up. */
	timer_set_mode(TIM4, TIM_CR1_CKD_CK_INT, TIM_CR1_CMS_EDGE, TIM_CR1_DIR_UP);
	timer_set_prescaler(TIM4, (rcc_apb1_frequency / TIMER_FREQUENCY) - 1);

	/* Set output compare mode to PWM mode 1 and enable output compare. */
	timer_set_oc_mode(TIM4, A_OC, TIM_OCM_PWM1);
	timer_set_oc_mode(TIM4, B_OC, TIM_OCM_PWM1);
	timer_enable_oc_output(TIM4, A_OC);
	timer_enable_oc_output(TIM4, B_OC);

	/* Set duty cycle to zero for output channels. */
	timer_set_oc_value(TIM4, A_OC, 0);
	timer_set_oc_value(TIM4, B_OC, 0);
	timer_set_period(TIM4, TIMER_PERIOD);

	/* Enable update interrupt. */
	// timer_enable_irq(TIM4, TIM_DIER_UIE);

	/* Enable counter. */
	timer_enable_counter(TIM4);
}

static void motor_adc_setup(void) {
	/* Set VTrack pin to 'analog floating'. */
	gpio_mode_setup(PORT(VTRACK_PIN), GPIO_MODE_ANALOG, GPIO_PUPD_NONE,
		PIN(VTRACK_PIN));

	/* Enable ADC clock. */
	rcc_periph_clock_enable(RCC_ADC1);

	/* Enable ADC interrupt. */
	nvic_enable_irq(NVIC_ADC_IRQ);

	/* Set ADC clock prescaler. */
	adc_set_clk_prescale(ADC_CCR_ADCPRE_BY2);

	/* Enable scan mode. */
	adc_enable_scan_mode(ADC1);

	/* Enable continuous conversion mode. */
	adc_set_single_conversion_mode(ADC1);
	// adc_set_continuous_conversion_mode(ADC1);

	/* Set sample time for VTrack to 3 cycles. */
	adc_set_sample_time(ADC1, VTRACK_CH, ADC_SMPR_SMP_3CYC);

	/* Set independent mode. */
	adc_set_multi_mode(ADC_CCR_MULTI_INDEPENDENT);

	/* Set regular sequence. */
	adc_set_regular_sequence(ADC1, GROUP_LENGTH, regular_group);

	/* Enable temperature sensor. */
	adc_enable_temperature_sensor();

	/* Enable VBat sensor. */
	// ADC_CCR |= ADC_CCR_VBATE;
	// adc_enable_external_trigger_regular(ADC1, ADC_CR2_EXTSEL_TIM4_CC4, ADC_CR2_EXTEN_RISING_EDGE);

	/* Enable EOC (End-Of-Conversion) interrupt. */
	adc_enable_eoc_interrupt(ADC1);

	/* Enable EOC interrupt after each conversion in the sequence. */
	adc_eoc_after_each(ADC1);

	/* Enable ADC. */
	adc_power_on(ADC1);
}

void motor_setup(void) {
	motor_timer_setup();
	motor_adc_setup();
}

void motor_update(void) {
	if (current_channel == GROUP_LENGTH) {
		current_channel = 0;
		adc_start_conversion_regular(ADC1);
	}
}

void motor_stop(void) {
	if (!is_stopped) {
		is_stopped = true;

		timer_set_oc_value(TIM4, A_OC, 0);
		timer_set_oc_value(TIM4, B_OC, 0);
	}
}

/* TODO: is E-STOP equivalent to STOP? */
void motor_estop(void) {
	if (!is_stopped) {
		is_stopped = true;

		timer_set_oc_value(TIM4, A_OC, TIMER_PERIOD);
		timer_set_oc_value(TIM4, B_OC, TIMER_PERIOD);
	}
}

void motor_start(void) {
	if (is_stopped) {
		is_stopped = false;

		// while (!adc_eoc(ADC1));
		motor_update();
	}
}

void motor_set_speed(uint8_t s) {
	if (s != speed) {
		speed = s;

		if (s == MOTOR_STOP) {
			motor_stop();
		} else if (s == MOTOR_ESTOP) {
			motor_estop();
		} else {
			motor_update();
		}
	}
}

void motor_set_direction(uint8_t d) {
	if (d != direction) {
		direction = d;

		if (d == MOTOR_FORWARD) {
			timer_set_oc_value(TIM4, A_OC, duty_cycle);
			timer_set_oc_value(TIM4, B_OC, 0);
		} else {
			timer_set_oc_value(TIM4, A_OC, 0);
			timer_set_oc_value(TIM4, B_OC, duty_cycle);
		}
	}
}

uint8_t motor_get_speed(void) {
	return speed;
}

uint8_t motor_get_direction(void) {
	return direction;
}

uint16_t motor_vtrack(void) {
	return channel_readings[VTRACK] * V_DIVIDER_MAX / (4095 / 1000);
}
