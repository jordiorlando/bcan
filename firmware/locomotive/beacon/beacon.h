#ifndef BEACON_H
#define BEACON_H

#include <stdlib.h>
#include <stdbool.h>

#include <libopencm3/cm3/nvic.h>
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>
#include <libopencm3/stm32/exti.h>
#include <libopencm3/stm32/timer.h>

void beacon_setup(void);
bool beacon_available(void);
uint16_t beacon_parse(void);

#endif
