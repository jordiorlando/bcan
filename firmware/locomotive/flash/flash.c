#include "flash.h"

#define NSS_PIN  PB12
#define SCK_PIN  PB13
#define MISO_PIN PB14
#define MOSI_PIN PB15

int flash_num_entries;
flash_mapping flash_mappings[FLASH_MAX_ENTRIES];
flash_func flash_functions[FLASH_MAX_FUNCTIONS];


char print_data[1000];

static void flash_placeholder_func(uint8_t data) {
	(void)data;
}

static void flash_cs_low(void) {
	gpio_clear(PORT(NSS_PIN), PIN(NSS_PIN));
}

static void flash_cs_high(void) {
	gpio_set(PORT(NSS_PIN), PIN(NSS_PIN));
}

static void flash_gpio_setup(void) {
	/* Set SPI pins to 'alternate function floating'. */
	gpio_mode_setup(PORT(SCK_PIN), GPIO_MODE_AF, GPIO_PUPD_PULLDOWN,
		PIN(SCK_PIN) | PIN(MISO_PIN) | PIN(MOSI_PIN));
	gpio_set_output_options(PORT(SCK_PIN), GPIO_OTYPE_PP, GPIO_OSPEED_25MHZ,
		PIN(MISO_PIN) | PIN(MOSI_PIN));

	/* Set SPI pins to alternate function 5. */
	gpio_set_af(PORT(SCK_PIN), GPIO_AF5,
		PIN(SCK_PIN) | PIN(MISO_PIN) | PIN(MOSI_PIN));

	/* Chip select line */
	gpio_mode_setup(PORT(NSS_PIN), GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, PIN(NSS_PIN));
}

static void flash_spi_setup(void) {
	rcc_periph_clock_enable(RCC_SPI2);

	spi_init_master(SPI2, 1000000, SPI_CR1_CPOL_CLK_TO_0_WHEN_IDLE,
		SPI_CR1_CPHA_CLK_TRANSITION_1, SPI_CR1_DFF_8BIT,
		SPI_CR1_MSBFIRST);

	SPI_CR1(SPI2) |= SPI_CR1_SSM;
	flash_cs_high();
}

void flash_setup(void) {
	flash_gpio_setup();
	flash_spi_setup();
}

void flash_load(void) {
	// Get number of entries
	flash_cs_low();
	spi_send(SPI2, FLASH_READ_INSTRUCTION);
	flash_cs_high();

	spi_send(SPI2, 0x00);
	spi_send(SPI2, 0x00);

	flash_num_entries = spi_read(SPI2);
	if (flash_num_entries > FLASH_MAX_ENTRIES) {
		flash_num_entries = FLASH_MAX_ENTRIES;
	}

	// Read and Save Entries
	for (uint8_t i = 0; i < flash_num_entries; i++) {
		uint16_t base_addr = (uint16_t)((i * FLASH_ENTRY_WIDTH) + FLASH_DATA_START);
		int parts[4];
		for (uint8_t j = 0; j < 4; j++) {
			uint16_t part_addr = base_addr + j;
			flash_cs_low();
			spi_send(SPI2, FLASH_READ_INSTRUCTION);
			flash_cs_high();
			spi_send(SPI2, (part_addr & 0xff00) >> 8);
			spi_send(SPI2, (part_addr & 0x00ff));
			parts[j] = spi_read(SPI2);
		}
		flash_mappings[i] = (parts[0] << 24) + (parts[1] << 16) + (parts[2] << 8) + (parts[3] << 0);
	}

	// Initalize flash_functions to placeholder function
	for (uint8_t i = 0; i < FLASH_MAX_FUNCTIONS; i++) {
		flash_functions[i] = flash_placeholder_func;
	}
}

void flash_function_add(int idx, flash_func f) {
	flash_functions[idx] = f;
}

static void flash_update_num_entries(uint8_t num_entries) {
	flash_cs_low();
	spi_send(SPI2, FLASH_WRITE_ENABLE_INSTRUCTION);
	flash_cs_high();
	// need small delay here?
	// spi_send(SPI2, 0x00);
	flash_cs_low();
	spi_send(SPI2, FLASH_WRITE_INSTRUCTION);
	spi_send(SPI2, 0x00);
	spi_send(SPI2, 0x00);
	spi_send(SPI2, num_entries);
	flash_cs_high();

	flash_num_entries = num_entries;
}

void flash_reset(void) {
	flash_update_num_entries(0);
}

void flash_add(flash_mapping m) {
	// Update number of entries number of entries
	flash_cs_low();
	spi_send(SPI2, FLASH_READ_INSTRUCTION);
	flash_cs_high();
	spi_send(SPI2, 0x00);
	spi_send(SPI2, 0x00);
	uint8_t new_num_entries = spi_read(SPI2)+1;
	flash_update_num_entries(new_num_entries);
	uint16_t addr = (new_num_entries*FLASH_ENTRY_WIDTH)+FLASH_DATA_START;

	// Write new mapping
	flash_cs_low();
	spi_send(SPI2, FLASH_WRITE_ENABLE_INSTRUCTION);
	flash_cs_high();
	// need small delay here?
	// spi_send(SPI2, 0x00);
	flash_cs_low();
	spi_send(SPI2, FLASH_WRITE_INSTRUCTION);
	spi_send(SPI2, (addr & 0xff00) >> 8);
	spi_send(SPI2, (addr & 0x00ff));
	spi_send(SPI2, (m & 0xff000000) >> 24);
	spi_send(SPI2, (m & 0x00ff0000) >> 16);
	spi_send(SPI2, (m & 0x0000ff00) >> 8);
	spi_send(SPI2, (m & 0x000000ff) >> 0);
	flash_cs_high();
}

void flash_execute(uint16_t id, uint8_t dot, uint8_t dir) {
	flash_mapping mapping_id = (((uint32_t)id << 4) + ((uint32_t)(dot & 0x3) << 2) + ((uint32_t)(dir & 0x3) << 0)) << 12;

	sprintf(print_data, "mapping_id %08lx", (uint32_t)mapping_id);
	println(print_data);

	for (uint8_t i = 0; i < flash_num_entries; i++) {
		sprintf(print_data, "flash_mappings[i] & 0xfffff000 %08lx", (uint32_t)(flash_mappings[i] & 0xfffff000));
		println(print_data);

		if (mapping_id == (flash_mappings[i] & 0xfffff000)) {
			uint8_t function_id = (flash_mappings[i] & 0x00000fc0) >> 6;
			uint8_t function_data = flash_mappings[i] & 0x0000003f;
			flash_functions[function_id](function_data);
		}
	}
}
