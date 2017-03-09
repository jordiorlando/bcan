#include <stdlib.h>

#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>
#include <libopencm3/cm3/nvic.h>
#include <libopencm3/cm3/systick.h>

#include "rcc_config/rcc_config.h"
#include "evq/evq.h"

#define CLOCK_CONFIG rcc_hse_8mhz_2v7_to_3v6[RCC_CLOCK_3V3_168MHZ]


/* Number of milliseconds since reset (overflows every 49 days). */
volatile uint32_t system_millis;

void sys_tick_handler(void) {
	system_millis++;
}

static void clock_setup(void) {
	/* Enable system clock at 168MHz. */
	rcc_clock_setup_hse_3v3(&CLOCK_CONFIG);

	/* Enable GPIOC clock. */
	rcc_periph_clock_enable(RCC_GPIOC);
}

static void gpio_setup(void) {
	/* Set GPIO12 (in GPIO port C) to 'output push-pull'. */
	gpio_mode_setup(GPIOC, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, GPIO12);
}

static void systick_setup(void) {
	/* Clock rate / 1000 to get 1ms interrupt rate. */
	systick_set_reload(CLOCK_CONFIG.ahb_frequency / 1000);
	systick_set_clocksource(STK_CSR_CLKSOURCE_AHB);
	systick_counter_enable();
	systick_interrupt_enable();
}

static void sleep_ms(uint32_t delay) {
	uint32_t wake = system_millis + delay;
	while (system_millis <= wake);
}

int main(void) {
	int i;

	clock_setup();
	gpio_setup();
	systick_setup();

	gpio_set(GPIOC, GPIO12);

	/* Blink the LED (PC12) on the board. */
	while (1) {
		gpio_toggle(GPIOC, GPIO12);
		sleep_ms(500);
	}

	return 0;
}
