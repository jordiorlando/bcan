#ifndef FLASH_H
#define FLASH_H

#include <stdlib.h>
#include <stdio.h>

#include "../locomotive.h"
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/spi.h>
#include <libopencm3/stm32/gpio.h>

#define FLASH_READ_INSTRUCTION 0x03
#define FLASH_WRITE_ENABLE_INSTRUCTION 0x06
#define FLASH_WRITE_DISABLE_INSTRUCTION 0x07
#define FLASH_WRITE_INSTRUCTION 0x02
#define FLASH_MAX_ENTRIES 256
#define FLASH_MAX_FUNCTIONS 128
#define FLASH_DATA_START 1
#define FLASH_ENTRY_WIDTH 4

typedef uint32_t flash_mapping;
typedef void(* flash_func)(uint8_t data);


void flash_setup(void);
void flash_load(void);
void flash_function_add(int idx, flash_func f);
void flash_reset(void);
void flash_add(flash_mapping m);
void flash_execute(uint16_t id, uint8_t dot, uint8_t dir);

#endif
