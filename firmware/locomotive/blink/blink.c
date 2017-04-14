#include "blink.h"

void blink_setup(void) {
	/* Enable GPIOA clock. */
	// rcc_periph_clock_enable(RCC_GPIOA);
	/* Enable GPIOC clock. */
	rcc_periph_clock_enable(RCC_GPIOC);

	/* Set PA0 to 'input floating'. */
	// gpio_mode_setup(GPIOA, GPIO_MODE_INPUT, GPIO_PUPD_NONE, GPIO0);
	/* Set PC12 to 'output push-pull'. */
	gpio_mode_setup(GPIOC, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, GPIO12);

	/* Turn off the LED. */
	gpio_set(GPIOC, GPIO12);
}

void blink(void) {
  /* Blink the on-board LED. */
  gpio_toggle(GPIOC, GPIO12);
}

void blink_on(void) {
	/* Turn on the on-board LED. */
  gpio_clear(GPIOC, GPIO12);
}

void blink_off(void) {
	/* Turn off the on-board LED. */
  gpio_set(GPIOC, GPIO12);
}
