#ifndef MOTOR_H
#define MOTOR_H

#include "../locomotive.h"
#include <libopencm3/cm3/nvic.h>
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>
#include <libopencm3/stm32/timer.h>
#include <libopencm3/stm32/adc.h>

#define MOTOR_STOP    0
#define MOTOR_ESTOP   1

#define MOTOR_FORWARD 1
#define MOTOR_REVERSE 2


void motor_setup(void);
void motor_update(void);
void motor_stop(void);
void motor_estop(void);
void motor_start(void);
void motor_set_speed(uint8_t speed);
void motor_set_direction(uint8_t direction);
uint8_t motor_get_speed(void);
uint8_t motor_get_direction(void);
uint16_t motor_vtrack(void);

#endif
