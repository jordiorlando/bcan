#include <stdlib.h>

#include <stdint.h>
#include <stdbool.h>
#include <math.h>

#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>
#include <libopencm3/usb/usbd.h>
#include <libopencm3/usb/msc.h>

#define PERIOD 960

volatile uint32_t beaconID = 0;
volatile uint32_t lastEdge = 0;
volatile bool completeID = false;
volatile bool readingID = false;

uint8_t dir;

int main(void) {
  return 0;
}

void pcInterrupt(uint8_t input, uint8_t side) {
  input = ~input;
  uint32_t now = micros();
  uint32_t length = now - lastEdge;

  if (!readingID && input && length > PERIOD * 6) {
    readingID = true;
  }

  if (completeID) {
    uint8_t dot = 1 << ((dir ^ side) & 0x01);
    for (uint16_t i = 0; i < numMappings; i++) {
      if (beaconID == mappings[i].id && (dot & mappings[i].dot) && (dir & mappings[i].dir)) {
        doFunction(mappings[i].instruction, mappings[i].data);
      }
    }
  }

  lastEdge = now;
}
