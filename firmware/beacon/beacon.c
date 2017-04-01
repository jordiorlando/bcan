//============================================================================//
//                               Atmel ATtiny45                               //
//                                   __   __                                  //
//                                  |  \_/  |                                 //
//          (PCINT5/~RST/ADC0) PB5 =|1     8|= VCC                            //
//         (PCINT3/~OC1B/ADC3) PB3 =|2     7|= PB2 (SCK/ADC1/INT0/PCINT2)     //
//          (PCINT4/OC1B/ADC2) PB4 =|3     6|= PB1 (MISO/OC0B/OC1A/PCINT1)    //
//                             GND =|4     5|= PB0 (MOSI/OC0A/~OC1A/PCINT0)   //
//                                  |_______|                                 //
//============================================================================//

#include <stdint.h>
#include <avr/io.h>
#include <util/delay.h>

#define LED_PIN 1     // PB1
#define CARRIER 38000 // Carrier frequency - 38kHz
#define PERIOD  10    // One period = 960us = 96us * 10

// Delay for some multiple of 96 microseconds (max for _delay_us() at 8MHz)
static void delay(uint8_t n) {
  for (uint8_t i = 0; i < n; i++) {
    _delay_us(96);
  }
}

// Enable PWM on PB1
static void pwm_on(uint8_t n) {
  // Compare Match Output B mode
  //    COM0B = 10: clear/set OC0B on compare match (non-inverted)
  TCCR0A |= _BV(COM0B1);
  delay(n);
}

// Disable PWM on PB1
static void pwm_off(uint8_t n) {
  // Compare Match Output B mode
  //    COM0B = 00: disconnect OC0B
  TCCR0A &= ~_BV(COM0B1);
  delay(n);
}

int main(void) {
  // Set PB1 as an output (function OC0B), and all others as inputs
  DDRB  =  _BV(LED_PIN);
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
    pwm_on(PERIOD * 3);
    pwm_off(PERIOD);

    // Transmit the unique ID using manchester code, MSB first
    // 0 - rising edge
    // 1 - falling edge
    for (int8_t i = LENGTH - 1; i >= 0; i--) {
      uint32_t bit = (ID >> i) & 1;
      for (uint8_t clk = 0; clk <= 1; clk++) {
        if (clk ^ bit) {
          pwm_on(PERIOD / 2);
        } else {
          pwm_off(PERIOD / 2);
        }
      }
    }

    // End of message
    pwm_off(PERIOD * 4);
  }

  return 0;
}
