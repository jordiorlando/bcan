#ifndef _HEADER_H_
#define _HEADER_H_

#include <stdint.h>
#include <avr/io.h>
#include <util/delay.h>

#define LED_PIN 1
#define CARRIER 38000
#define PULSE   562.5

void mark(uint8_t n);
void space(uint8_t n);
void delay(uint8_t n);

#endif
