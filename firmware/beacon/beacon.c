//============================================================================//
//                               Atmel ATtiny10                               //
//                                   ,----,                                   //
//       (PCINT0/TPIDATA/OC0A) PB0 ==|1  6|== PB3 (~RESET/PCINT3)             //
//                             GND ==|2  5|== VCC                             //
//   (PCINT1/TPICLK/ICP0/OC0B) PB1 ==|3  4|== PB2 (T0/PCINT2/INT0)            //
//                                   '----'                                   //
//============================================================================//

// #define __AVR_ATtiny10__
#define F_CPU   8000000UL // CPU frequency = 8MHz
#define F_PWM   38000     // PWM frequency = 38kHz
#define PERIOD  10        // One period = 960us = 96us * 10
#define LED_PIN 0         // PB0

#include <stdint.h>
#include <avr/io.h>
#include <util/delay.h>


// Delay for some multiple of 96 microseconds (max for _delay_us() at 8MHz)
static void delay(uint8_t n) {
	for (uint8_t i = 0; i < n; i++) {
		_delay_us(96);
	}
}

// Enable PWM on PB0
static void pwm_on(uint8_t n) {
	// Compare Match Output A mode
	//    COM0A = 01: toggle OC0A on compare match
	TCCR0A |= _BV(COM0A0);
	delay(n);
}

// Disable PWM on PB0
static void pwm_off(uint8_t n) {
	// Compare Match Output A mode
	//    COM0A = 00: disconnect OC0A
	TCCR0A &= ~_BV(COM0A0);
	delay(n);
}

int main(void) {
	// Set CPU speed to 8MHz by setting clock prescaler
	// CCP register must first be written with the correct signature - 0xD8
	CCP = 0xD8;
	// Set the clock division factor
	// CLKPS[3:0]: Clock Prescaler Select = 0000 (1)
	CLKPSR = 0;

	// Optionally set a custom oscillator calibration value
	// OSCCAL = oscillator_calibration_value;

	// Set PB0 as an output (function OC0A), and all others as inputs
	DDRB  =  _BV(LED_PIN);
	// Drive PB0 low, and enable pull-ups for all others (saves power)
	PORTB = ~_BV(LED_PIN);

	// Set the Timer/Counter Control Registers for Timer/Counter 0
	//
	// Compare Match Output A mode
	//    COM0A = 00: disconnect OC0A
	// Compare Match Output B mode
	//    COM0B = 00: disconnect OC0B
	// Waveform Generation Mode
	//    WGM0 = 1111: fast PWM with OCR0A as top (Mode 15)
	// Clock Select
	//    CS0 = 001: no prescaling
	TCCR0A = _BV(WGM01) | _BV(WGM00);
	TCCR0B = _BV(WGM03) | _BV(WGM02) | _BV(CS00);

	// Set the Output Compare Registers for Timer/Counter 0
	// Output Compare Register A (OCR0A): top value for timer, 50% duty cycle
	OCR0AL = F_CPU / F_PWM / 2 - 1;

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
