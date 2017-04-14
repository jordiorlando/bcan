#include "beacon_test.h"

#define PERIOD 96

volatile bool is_waiting = false;


void tim2_isr(void) {
	if (timer_get_flag(TIM2, TIM_SR_CC1IF)) {
		timer_clear_flag(TIM2, TIM_SR_CC1IF);
		is_waiting = false;
	}
}

static void delay(uint32_t t) {
	is_waiting = true;
	timer_set_oc_value(TIM2, TIM_OC1, timer_get_counter(TIM2) + t);
	while (is_waiting);
}

static void high(uint16_t t) {
	gpio_clear(GPIOC, GPIO10);
	delay(t);
}

static void low(uint16_t t) {
	gpio_set(GPIOC, GPIO10);
	delay(t);
}

void beacon_test_setup(void) {
	/* Set PC10 to output floating. */
	gpio_mode_setup(GPIOC, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, GPIO10);
	gpio_set(GPIOC, GPIO10);

	/* Enable TIM2 clock. */
	rcc_periph_clock_enable(RCC_TIM2);
	nvic_enable_irq(NVIC_TIM2_IRQ);
	timer_reset(TIM2);
	timer_set_mode(TIM2, TIM_CR1_CKD_CK_INT_MUL_2, TIM_CR1_CMS_EDGE, TIM_CR1_DIR_UP);

	/* Set the prescaler to have the timer run at 100kHz. */
	timer_set_prescaler(TIM2, (rcc_apb1_frequency / 100000) - 1);

	/* Disable preload. */
	// timer_disable_preload(TIM2);
	// timer_continuous_mode(TIM2);

	/* count full range, as we'll update compare value continuously */
	timer_set_period(TIM2, 0xFFFFFFFF);

	/* Counter enable. */
	timer_enable_counter(TIM2);

	/* Enable Channel 1 compare interrupt to recalculate compare values */
	timer_enable_irq(TIM2, TIM_DIER_CC1IE);
}

uint16_t beacon_test(uint16_t id) {
	while (!beacon_available()) {
		high(PERIOD * 3);
		low(PERIOD);

		for (int8_t i = 15; i >= 0; i--) {
			uint32_t bit = (id >> i) & 1;
			for (uint8_t clk = 0; clk <= 1; clk++) {
				if (clk ^ bit) {
					high(PERIOD / 2);
				} else {
					low(PERIOD / 2);
				}
			}
		}

		low(PERIOD * 4);
	}

	return beacon_parse();
}
