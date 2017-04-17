#ifndef BEACON_H
#define BEACON_H

#include "../locomotive.h"
#include <libopencm3/cm3/nvic.h>
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>
#include <libopencm3/stm32/timer.h>

/* CC4NP: Capture/compare 4 complementary output polarity */
#define TIM_CCER_CC4NP (1 << 15)

// #define BEACON_FAST_PARSE


void beacon_setup(void);
bool beacon_available(void);
uint16_t beacon_parse(void);

#endif
