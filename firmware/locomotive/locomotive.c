#include <stdlib.h>

#include <libopencm3/stm32/flash.h>
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>
#include <libopencm3/usb/usbd.h>
#include <libopencm3/usb/msc.h>

#include "evq/evq.h"

const struct rcc_clock_scale rcc_hse_16mhz_2v7_3v6[RCC_CLOCK_3V3_END] = {
	{ /* 48MHz */
		.pllm = 8,
		.plln = 96,
		.pllp = 4,
		.pllq = 4,
		.pllr = 0,
		.hpre = RCC_CFGR_HPRE_DIV_NONE,
		.ppre1 = RCC_CFGR_PPRE_DIV_2,
		.ppre2 = RCC_CFGR_PPRE_DIV_NONE,
		.power_save = 1,
		.flash_config = FLASH_ACR_DCE | FLASH_ACR_ICE | FLASH_ACR_LATENCY_2WS,
		.ahb_frequency  = 48000000,
		.apb1_frequency = 24000000,
		.apb2_frequency = 48000000,
	},
	{ /* 84MHz */
		.pllm = 8,
		.plln = 168,
		.pllp = 4,
		.pllq = 7,
		.pllr = 0,
		.hpre = RCC_CFGR_HPRE_DIV_NONE,
		.ppre1 = RCC_CFGR_PPRE_DIV_2,
		.ppre2 = RCC_CFGR_PPRE_DIV_NONE,
		.power_save = 1,
		.flash_config = FLASH_ACR_DCE | FLASH_ACR_ICE | FLASH_ACR_LATENCY_3WS,
		.ahb_frequency  = 84000000,
		.apb1_frequency = 42000000,
		.apb2_frequency = 84000000,
	},
	{ /* 120MHz */
		.pllm = 8,
		.plln = 120,
		.pllp = 2,
		.pllq = 5,
		.pllr = 0,
		.hpre = RCC_CFGR_HPRE_DIV_NONE,
		.ppre1 = RCC_CFGR_PPRE_DIV_4,
		.ppre2 = RCC_CFGR_PPRE_DIV_2,
		.power_save = 1,
		.flash_config = FLASH_ACR_DCE | FLASH_ACR_ICE | FLASH_ACR_LATENCY_4WS,
		.ahb_frequency  = 120000000,
		.apb1_frequency = 30000000,
		.apb2_frequency = 60000000,
	},
	{ /* 168MHz */
		.pllm = 8,
		.plln = 168,
		.pllp = 2,
		.pllq = 7,
		.pllr = 0,
		.hpre = RCC_CFGR_HPRE_DIV_NONE,
		.ppre1 = RCC_CFGR_PPRE_DIV_4,
		.ppre2 = RCC_CFGR_PPRE_DIV_2,
		.flash_config = FLASH_ACR_DCE | FLASH_ACR_ICE | FLASH_ACR_LATENCY_6WS,
		.ahb_frequency  = 168000000,
		.apb1_frequency = 42000000,
		.apb2_frequency = 84000000,
	},
};

int main(void) {
	rcc_clock_setup_hse_3v3(&rcc_hse_16mhz_2v7_3v6[RCC_CLOCK_3V3_168MHZ]);
}
