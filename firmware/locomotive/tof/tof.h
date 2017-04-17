#ifndef TOF_H
#define TOF_H

#include "../locomotive.h"
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/i2c.h>
#include <libopencm3/stm32/gpio.h>

#define VL6180x_SINGLE_DEVICE_DRIVER 1
#include "api/vl6180x_i2c.h"
#include "api/vl6180x_api.h"


void tof_setup(void);
int32_t tof_distance(void);

#endif
