//============================================================================//
//                               Atmel ATtiny45                               //
//                                                                            //
//                                   __   __                                  //
//                                  |  \_/  |                                 //
//          (PCINT5/~RST/ADC0) PB5 =|1     8|= VCC                            //
//         (PCINT3/~OC1B/ADC3) PB3 =|2     7|= PB2 (SCK/ADC1/INT0/PCINT2)     //
//          (PCINT4/OC1B/ADC2) PB4 =|3     6|= PB1 (MISO/OC0B/OC1A/PCINT1)    //
//                             GND =|4     5|= PB0 (MOSI/OC0A/~OC1A/PCINT0)   //
//                                  |_______|                                 //
//                                                                            //
//============================================================================//



#include "header.h"

int main(void) {
  // Set PB1 as an output (function OC0B), and all others as inputs
  DDRB = _BV(LED_PIN);
  // Drive PB1 low, and enable pull-ups for all others (saves power)
  PORTB = ~_BV(LED_PIN);

  // Set the Timer/Counter Control Registers for Timer/Counter 0
  //
  // Compare Match Output A mode
  //    COM0A = 00: disconnect OC0A
  // Compare Match Output B mode
  //    COM0B = 00: disconnect OC0B
  // Waveform Generation Mode
  //    WGM0 = 101: phase correct PWM with OCRA as top (Mode 5)
  // Clock Select
  //    CS20 = 001: no prescaling
  TCCR0A = _BV(WGM00);
  TCCR0B = _BV(WGM02) | _BV(CS00);

  // Set the Output Compare Registers for Timer/Counter 0
  // The modulation frequency will be F_CPU/OCR0A/2
  //
  // Output Compare Register A (OCR0A): the top value for the timer
  // Output Compare Register B (OCR0B): set for a 50% duty cycle
  OCR0A = F_CPU / CARRIER / 2;
  OCR0B = OCR0A / 2;

  while (1) {
    // Start of message
    mark(16);
    space(8);

    // 3-byte unique ID
    for (uint8_t i = 0; i < 24; i++) {
      // Send a mark for 562.5us and a space for 562.5us
      mark(1);
      space(1);

      // If the bit is a logical '1', send a space for 1125us more
      if (ID & _BV(i)) {
        delay(2);
      }
    }

    // End of message
    mark(1);
    space(1);
  }

  return 0;
}

// Enable PWM on PB1
void mark(uint8_t n) {
  // Compare Match Output B mode
  //    COM0B = 10: clear/set OC0B on compare match (non-inverted)
  TCCR0A |= _BV(COM0B1);
  delay(n);
}

// Disable PWM on PB1
void space(uint8_t n) {
  // Compare Match Output B mode
  //    COM0B = 00: disconnect OC0B
  TCCR0A &= ~_BV(COM0B1);
  delay(n);
}

// Delay for some multiple of 562.5us
void delay(uint8_t n) {
  for (uint8_t i = 0; i < n; i++) {
    _delay_us(US_MAX);
    _delay_us(US_MAX);
    _delay_us(US_MAX);
    _delay_us(US_MAX);
    _delay_us(US_MAX);
    _delay_us(82.5);
  }
}
