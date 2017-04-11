#include <stdlib.h>

#include <libopencm3/cm3/nvic.h>
#include <libopencm3/cm3/systick.h>
#include <libopencm3/stm32/rcc.h>

#include "rcc_config/rcc_config.h"
#include "blink/blink.h"
#include "tof/tof.h"

#define CLOCK_CONFIG rcc_hse_8mhz_2v7_to_3v6[RCC_CLOCK_3V3_168MHZ]


/* Number of milliseconds since reset (overflows every 49 days). */
volatile uint32_t system_millis;


static void rcc_setup(void) {
	/* Enable system clock at 168MHz. */
	rcc_clock_setup_hse_3v3(&CLOCK_CONFIG);
}

static void systick_setup(void) {
	/* Enable 1ms system tick interrupt rate. */
	systick_set_frequency(1000, rcc_ahb_frequency);
	systick_clear();
	systick_counter_enable();
	systick_interrupt_enable();
}

void sys_tick_handler(void) {
	system_millis++;
}

int main(void) {
	rcc_setup();
	systick_setup();
	blink_setup();
	tof_setup();

	while (1){
		if (tof_should_stop()) {
			gpio_clear(GPIOC, GPIO12);
		} else {
			gpio_set(GPIOC, GPIO12);
		}
	}

	return 0;
}
