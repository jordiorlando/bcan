#include <libopencm3/cm3/nvic.h>
#include <libopencm3/cm3/systick.h>
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>
#include <libopencm3/stm32/usart.h>

#include "locomotive.h"
#include "rcc_config/rcc_config.h"
#include "led/led.h"
#include "beacon/beacon.h"
#include "motor/motor.h"
#include "tof/tof.h"

#define TX_PIN PA2
#define RX_PIN PA3

#define ID_0 0xca53
#define ID_1 0xa257
#define ID_2 0x5e72
#define ID_3 0x3f44
#define ID_4 0x92e0
#define ID_5 0x463c
#define ID_6 0x5c5d
#define ID_7 0x0de0
#define ID_8 0x1a32
#define ID_9 0x547d

#define DOT_FORWARD 1
#define DOT_REVERSE 2
#define DOT_EITHER  3

#define DIR_FORWARD 1
#define DIR_REVERSE 2
#define DIR_EITHER  3

#define INSTR_F0        0
#define INSTR_F1        1
#define INSTR_F2        2
#define INSTR_F3        3
#define INSTR_F4        4
#define INSTR_F5        5
#define INSTR_F6        6
#define INSTR_F7        7
#define INSTR_F8        8
#define INSTR_F9        9
#define INSTR_F10       10
#define INSTR_F11       11
#define INSTR_F12       12
#define INSTR_F13       13
#define INSTR_F14       14
#define INSTR_F15       15
#define INSTR_F16       16
#define INSTR_F17       17
#define INSTR_F18       18
#define INSTR_F19       19
#define INSTR_F20       20
#define INSTR_F21       21
#define INSTR_F22       22
#define INSTR_F23       23
#define INSTR_F24       24
#define INSTR_F25       25
#define INSTR_F26       26
#define INSTR_F27       27
#define INSTR_F28       28
#define INSTR_SPEED     29
#define INSTR_DIRECTION 30
#define INSTR_CUSTOM    31

#define DATA_REVERSE_DIR 0
#define DATA_FORWARD_DIR 1
#define DATA_REVERSE_DOT 2
#define DATA_FORWARD_DOT 3
#define DATA_CHANGE_DIR  4

#define NUM_MAPPINGS 16

#define TOF_TRIGGER_DISTANCE 50


typedef struct {
	uint16_t id : 16;
	uint8_t dot : 2;
	uint8_t dir : 2;
	uint8_t instr : 5;
	uint8_t data : 7;
} mapping_t;

const mapping_t mappings[NUM_MAPPINGS] = {
	{
		.id    = ID_0,
		.dot   = DIR_EITHER,
		.dir   = DIR_EITHER,
		.instr = INSTR_SPEED,
		.data  = 127
	}
};

char print_buffer[50];

/* Number of milliseconds since reset (overflows every 49 days). */
volatile uint32_t system_millis;


void sys_tick_handler(void) {
	system_millis++;
}

static void rcc_setup(void) {
	/* Enable system clock at 168MHz. */
	rcc_clock_setup_hse_3v3(&rcc_hse_16mhz_2v7_to_3v6[RCC_CLOCK_3V3_168MHZ]);
}

static void gpio_setup(void) {
	/* Enable GPIOA clock. */
	rcc_periph_clock_enable(RCC_GPIOA);
	/* Enable GPIOB clock. */
	rcc_periph_clock_enable(RCC_GPIOB);
	/* Enable GPIOC clock. */
	rcc_periph_clock_enable(RCC_GPIOC);
}

static void systick_setup(void) {
	/* Enable 1ms system tick interrupt rate. */
	systick_set_frequency(1000, rcc_ahb_frequency);
	systick_clear();
	systick_counter_enable();
	systick_interrupt_enable();
}

static void usart_setup(void) {
	/* Setup GPIO pins for USART2 transmit. */
	gpio_mode_setup(PORT(TX_PIN), GPIO_MODE_AF, GPIO_PUPD_NONE, PIN(TX_PIN));

	/* Setup USART2 TX pin as alternate function. */
	gpio_set_af(PORT(TX_PIN), GPIO_AF7, PIN(TX_PIN));

	/* Enable clocks for USART2. */
	rcc_periph_clock_enable(RCC_USART2);

	/* Setup USART2 parameters. */
	usart_set_baudrate(USART2, 38400);
	usart_set_databits(USART2, 8);
	usart_set_stopbits(USART2, USART_STOPBITS_1);
	usart_set_mode(USART2, USART_MODE_TX);
	usart_set_parity(USART2, USART_PARITY_NONE);
	usart_set_flow_control(USART2, USART_FLOWCONTROL_NONE);

	/* Finally enable the USART. */
	usart_enable(USART2);
}

void print(char *str) {
	uint8_t i = 0;
	while (str[i] != '\0') {
		usart_send_blocking(USART2, str[i]);
		i++;
	}
}

void println(char *str) {
	print(str);
	usart_send_blocking(USART2, '\n');
}

int main(void) {
	rcc_setup();
	gpio_setup();
	systick_setup();
	usart_setup();

	led_setup(LED_FRONT);
	led_setup(LED_REAR);
	beacon_setup();
	motor_setup();
	tof_setup();

	while (1) {
		motor_update();

		if (tof_distance() <= TOF_TRIGGER_DISTANCE) {
			motor_stop();
		} else {
			motor_start();

			if (beacon_available()) {
				beacon_t beacon = beacon_parse();
				uint8_t dot = motor_get_direction() ^ beacon.side ^ 1;
				uint8_t dir = motor_get_direction();

				sprintf(print_buffer, "0x%04x", beacon.id);
				println(print_buffer);

				/* Find all matching mappings. */
				for (uint8_t i = 0; i < NUM_MAPPINGS; i++) {
					if ((beacon.id == mappings[i].id) &&
							(dot & mappings[i].dot) &&
							(dir & mappings[i].dir)) {
						uint8_t data = mappings[i].data;

						switch (mappings[i].instr) {
							/* Turn on LED. */
							case INSTR_F0:
								if (data == 0) {
									led_on(LED_FRONT);
								} else if (data == 1) {
									led_on(LED_REAR);
								}
								break;
							/* Turn off LED. */
							case INSTR_F1:
								if (data == 0) {
									led_off(LED_FRONT);
								} else if (data == 1) {
									led_off(LED_REAR);
								}
								break;
							/* Toggle LED. */
							case INSTR_F2:
								if (data == 0) {
									led_toggle(LED_FRONT);
								} else if (data == 1) {
									led_toggle(LED_REAR);
								}
								break;
							case INSTR_F3:
							case INSTR_F4:
							case INSTR_F5:
							case INSTR_F6:
							case INSTR_F7:
							case INSTR_F8:
							case INSTR_F9:
							case INSTR_F10:
							case INSTR_F11:
							case INSTR_F12:
							case INSTR_F13:
							case INSTR_F14:
							case INSTR_F15:
							case INSTR_F16:
							case INSTR_F17:
							case INSTR_F18:
							case INSTR_F19:
							case INSTR_F20:
							case INSTR_F21:
							case INSTR_F22:
							case INSTR_F23:
							case INSTR_F24:
							case INSTR_F25:
							case INSTR_F26:
							case INSTR_F27:
							case INSTR_F28:
								break;
							case INSTR_SPEED:
								motor_set_speed(data);
								break;
							case INSTR_DIRECTION:
								if (data == DATA_REVERSE_DIR) {
									motor_set_direction(MOTOR_REVERSE);
								} else if (data == DATA_FORWARD_DIR) {
									motor_set_direction(MOTOR_FORWARD);
								} else if (((data == DATA_REVERSE_DOT) && (dot == DOT_FORWARD)) ||
													 ((data == DATA_FORWARD_DOT) && (dot == DOT_REVERSE)) ||
														(data == DATA_CHANGE_DIR)) {
									motor_set_direction(dir ^ (MOTOR_FORWARD | MOTOR_REVERSE));
								}
								break;
							case INSTR_CUSTOM:
							default:
								break;
						}
					}
				}
			}
		}

		if (system_millis % 500 == 0) {
			sprintf(print_buffer, "Track Voltage: %d0mV", motor_vtrack());
			println(print_buffer);
		}
	}

	return 0;
}
