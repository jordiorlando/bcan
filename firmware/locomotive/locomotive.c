#include <libopencm3/cm3/nvic.h>
#include <libopencm3/cm3/systick.h>
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>
#include <libopencm3/stm32/usart.h>

#include "locomotive.h"
#include "rcc_config/rcc_config.h"
#include "led/led.h"
#include "beacon/beacon.h"
#include "tof/tof.h"
#include "flash/flash.h"

#define TX_PIN PA2
#define RX_PIN PA3
#define TOF_TRIGGER_DISTANCE 50


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

static void print_id(uint16_t id) {
	print("0x");

	for (int8_t i = 12; i >= 0; i -= 4) {
		uint8_t digit = (id >> i) & 0x0F;
		usart_send_blocking(USART2, digit + ((digit < 0x0a) ? 48 : 87));
	}

	usart_send_blocking(USART2, '\n');
}

static void blink_data(uint8_t unused) {
	led_blink(LED_FRONT);
	(void)unused;
}

int main(void) {
	rcc_setup();
	gpio_setup();
	systick_setup();
	usart_setup();

	led_setup(LED_FRONT);
	led_setup(LED_REAR);
	beacon_setup();
	tof_setup();
	flash_setup();

	flash_reset();
	flash_add(0x00000000);
	flash_load();
	flash_function_add(0, blink_data);

	uint32_t millis_since_op = 0;
	uint32_t last_exec = system_millis;

	while (1) {
		if (beacon_available()) {
			print_id(beacon_parse());
			led_blink(LED_REAR);
		}

		if (tof_distance() <= TOF_TRIGGER_DISTANCE) {
			led_on(LED_FRONT);
		} else {
			led_off(LED_FRONT);
		}

		if (millis_since_op > 1000) {
			flash_execute(0, 0, 0);
			last_exec = system_millis;
		}

		millis_since_op = system_millis - last_exec;
	}

	return 0;
}
