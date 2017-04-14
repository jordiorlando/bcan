#ifndef BEACON_TEST_H
#define BEACON_TEST_H

#include <stdlib.h>
#include <stdbool.h>

#include <libopencm3/cm3/nvic.h>
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>
#include <libopencm3/stm32/timer.h>

#include "beacon.h"

void beacon_test_setup(void);
uint16_t beacon_test(uint16_t id);

#endif
