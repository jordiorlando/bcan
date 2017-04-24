#ifndef LED_H
#define LED_H

#include "../locomotive.h"
#include <libopencm3/stm32/gpio.h>

#define LED_FRONT PB7
#define LED_REAR  PB6


void led_setup(pin_type pin);
void led_on(pin_type pin);
void led_off(pin_type pin);
void led_toggle(pin_type pin);
void led_blink(pin_type pin);

#endif
