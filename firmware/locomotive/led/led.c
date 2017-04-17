#include "led.h"

void led_setup(pin_type pin) {
	/* Set the pin to 'output push-pull'. */
	gpio_mode_setup(PORT(pin), GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, PIN(pin));

	/* Turn off the LED. */
	led_off(pin);
}

void led_on(pin_type pin) {
	/* Turn on the LED. */
	gpio_set(PORT(pin), PIN(pin));
}

void led_off(pin_type pin) {
	/* Turn off the LED. */
	gpio_clear(PORT(pin), PIN(pin));
}

void led_blink(pin_type pin) {
	/* Blink the LED. */
	gpio_toggle(PORT(pin), PIN(pin));
}
