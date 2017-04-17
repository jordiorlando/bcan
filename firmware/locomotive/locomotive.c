#include <libopencm3/cm3/nvic.h>
#include <libopencm3/cm3/systick.h>
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>

#include "locomotive.h"
#include "rcc_config/rcc_config.h"
#include "led/led.h"
#include "beacon/beacon.h"
#include "tof/tof.h"

#define TOF_TRIGGER_DISTANCE 50

/* Number of milliseconds since reset (overflows every 49 days). */
volatile uint32_t system_millis;

void sys_tick_handler(void) {
	system_millis++;
}

static void rcc_setup(void) {
	/* Enable system clock at 168MHz. */
	rcc_clock_setup_hse_3v3(&rcc_hse_16mhz_2v7_to_3v6[RCC_CLOCK_3V3_168MHZ]);
}

static void gpio_setup(void) {
	/* Enable GPIOA clock. */
	rcc_periph_clock_enable(RCC_GPIOA);
	/* Enable GPIOB clock. */
	rcc_periph_clock_enable(RCC_GPIOB);
	/* Enable GPIOC clock. */
	rcc_periph_clock_enable(RCC_GPIOC);
}

static void systick_setup(void) {
	/* Enable 1ms system tick interrupt rate. */
	systick_set_frequency(1000, rcc_ahb_frequency);
	systick_clear();
	systick_counter_enable();
	systick_interrupt_enable();
}

int main(void) {
	rcc_setup();
	gpio_setup();
	systick_setup();

	led_setup(LED_FRONT);
	led_setup(LED_REAR);
	beacon_setup();
	tof_setup();

	while (1) {
		if (beacon_available()) {
			beacon_parse();
			led_blink(LED_REAR);
		}

		if (tof_distance() <= TOF_TRIGGER_DISTANCE) {
			led_on(LED_FRONT);
		} else {
			led_off(LED_FRONT);
		}
	}

	return 0;
}
