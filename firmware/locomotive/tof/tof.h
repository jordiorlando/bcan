#ifndef TOF_H
#define TOF_H
#define VL6180x_SINGLE_DEVICE_DRIVER 1
#include <stdbool.h>
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/i2c.h>
// #include "api/vl6180x_params.h"
#include "api/vl6180x_i2c.h"
#include "api/vl6180x_api.h"

#define TOF_SLAVE_ADDR 0x29
#define TOF_TRIGGER_DISTANCE_MM 50

void tof_setup(void);
bool tof_should_stop(void);

#endif
