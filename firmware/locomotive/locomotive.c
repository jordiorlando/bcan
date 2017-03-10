#include <stdlib.h>

#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>
#include <libopencm3/stm32/exti.h>
#include <libopencm3/cm3/nvic.h>
#include <libopencm3/cm3/systick.h>

#include "rcc_config/rcc_config.h"
#include "evq/evq.h"

#define CLOCK_CONFIG rcc_hse_8mhz_2v7_to_3v6[RCC_CLOCK_3V3_168MHZ]


/* Number of milliseconds since reset (overflows every 49 days). */
volatile uint32_t system_millis;

/* GPIO Port A state */
volatile uint16_t exti_gpioa_state;


static void clock_setup(void) {
	/* Enable system clock at 168MHz. */
	rcc_clock_setup_hse_3v3(&CLOCK_CONFIG);
}

static void systick_setup(void) {
	/* Clock rate / 1000 to get 1ms interrupt rate. */
	systick_set_reload(CLOCK_CONFIG.ahb_frequency / 1000);
	systick_set_clocksource(STK_CSR_CLKSOURCE_AHB);
	systick_counter_enable();
	systick_interrupt_enable();
}

void sys_tick_handler(void) {
	system_millis++;
}

static void gpio_setup(void) {
	/* Enable GPIOA clock. */
	rcc_periph_clock_enable(RCC_GPIOA);
	/* Enable GPIOC clock. */
	rcc_periph_clock_enable(RCC_GPIOC);

	/* Set PA0 to 'input floating'. */
	gpio_mode_setup(GPIOA, GPIO_MODE_INPUT, GPIO_PUPD_NONE, GPIO0);
	/* Set PC12 to 'output push-pull'. */
	gpio_mode_setup(GPIOC, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, GPIO12);
}

static void exti_setup(void) {
	/* Enable EXTI0 interrupt. */
	nvic_enable_irq(NVIC_EXTI0_IRQ);

	/* Configure the EXTI subsystem. */
	exti_select_source(EXTI0, GPIOA);
	exti_set_trigger(EXTI0, EXTI_TRIGGER_BOTH);
	exti_enable_request(EXTI0);
}

void exti0_isr(void) {
	exti_gpioa_state = gpio_port_read(GPIOA);

	/* Turn on LED (PC12, active low) when button (PA0, active low) is pressed. */
	if (exti_gpioa_state & GPIO0) {
		gpio_set(GPIOC, GPIO12);
	} else {
		gpio_clear(GPIOC, GPIO12);
	}

	exti_reset_request(EXTI0);
}

static void sleep_ms(uint32_t delay) {
	uint32_t wake = system_millis + delay;
	while (system_millis <= wake);
}

int main(void) {
	int i;

	clock_setup();
	systick_setup();
	gpio_setup();
	exti_setup();

	/* Turn off the LED. */
	gpio_set(GPIOC, GPIO12);

	/* Blink the on-board LED. */
	while (1) {
	#ifdef BLINK
		gpio_toggle(GPIOC, GPIO12);
		sleep_ms(500);
	#endif
	}

	return 0;
}
