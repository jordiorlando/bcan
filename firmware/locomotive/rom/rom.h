#ifndef ROM_H
#define ROM_H

#include <stdlib.h>
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/spi.h>
#include <libopencm3/stm32/gpio.h>

#define ROM_READ_INSTRUCTION 0x03
#define ROM_WRITE_ENABLE_INSTRUCTION 0x06
#define ROM_WRITE_DISABLE_INSTRUCTION 0x07
#define ROM_WRITE_INSTRUCTION 0x02
#define ROM_MAX_ENTRIES 256
#define ROM_MAX_FUNCTIONS 128
#define ROM_DATA_START 1
#define ROM_ENTRY_WIDTH 4

typedef uint32_t rom_mapping;
typedef void(* rom_func)(uint8_t data);

void rom_init(void);
void rom_function_add(int idx, rom_func f);
void rom_reset(void);
void rom_add(rom_mapping m);
void rom_execute(uint16_t id, uint8_t dot, uint8_t td);

#endif