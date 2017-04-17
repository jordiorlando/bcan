#include "flash.h"

int flash_num_entries;
flash_mapping flash_mappings_list[FLASH_MAX_ENTRIES];
flash_func flash_functions_list[FLASH_MAX_FUNCTIONS];

static void flash_placeholder_func(uint8_t data){
	(void)data;
}

static void flash_cs_low(void){
	gpio_clear(GPIOB, GPIO12);
}

static void flash_cs_high(void){
	gpio_set(GPIOB, GPIO12);
}

static void flash_gpio_init(void){
	/* Enable the GPIO ports whose pins we are using */
	rcc_periph_clock_enable(RCC_GPIOB);

	gpio_mode_setup(GPIOB, GPIO_MODE_AF, GPIO_PUPD_PULLDOWN,
			GPIO13 | GPIO14 | GPIO15);
	gpio_set_af(GPIOB, GPIO_AF5, GPIO13 | GPIO14 | GPIO15);
	gpio_set_output_options(GPIOB, GPIO_OTYPE_PP, GPIO_OSPEED_25MHZ,
				GPIO14 | GPIO15);

	/* Chip select line */
	gpio_mode_setup(GPIOB, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, GPIO12);
	flash_cs_high();

	rcc_periph_clock_enable(RCC_SPI2);
}

static void flash_spi_init(void){
	spi_init_master(SPI2, 1000000, SPI_CR1_CPOL_CLK_TO_0_WHEN_IDLE,
		SPI_CR1_CPHA_CLK_TRANSITION_1, SPI_CR1_DFF_8BIT,
		SPI_CR1_MSBFIRST);
}

void flash_setup(void){
	flash_gpio_init();
	flash_spi_init();

	// Get number of entries
	flash_cs_low();
	spi_send(SPI2, FLASH_READ_INSTRUCTION);
	flash_cs_high();
	spi_send(SPI2, 0x00);
	spi_send(SPI2, 0x00);
	flash_num_entries = spi_read(SPI2);
	if(flash_num_entries > FLASH_MAX_ENTRIES){
		flash_num_entries = FLASH_MAX_ENTRIES;
	}

	// Read and Save Entries
	int i;
	for(i = 0; i < flash_num_entries; i++){
		uint16_t base_addr = (uint16_t)((i*FLASH_ENTRY_WIDTH)+FLASH_DATA_START);
		int parts[4];
		int j;
		for(j = 0; j < 4; j++){
			uint16_t part_addr = base_addr + j;
			flash_cs_low();
			spi_send(SPI2, FLASH_READ_INSTRUCTION);
			flash_cs_high();
			spi_send(SPI2, (part_addr & 0xff00) >> 8);
			spi_send(SPI2, (part_addr & 0x00ff));
			parts[j] = spi_read(SPI2);
		}
		flash_mappings_list[i] = (parts[0] << 24) + (parts[1] << 16) + (parts[2] << 8) + (parts[3] << 0);
	}

	// Initalize flash_functions_list to placeholder function
	for(i = 0; i < FLASH_MAX_FUNCTIONS; i++){
		flash_functions_list[i] = flash_placeholder_func;
	}

}

void flash_function_add(int idx, flash_func f){
	flash_functions_list[idx] = f;
}

static void flash_update_num_entries(uint8_t num_entries){
	flash_cs_low();
	spi_send(SPI2, FLASH_WRITE_ENABLE_INSTRUCTION);
	flash_cs_high();
	// need small delay here?
	flash_cs_low();
	spi_send(SPI2, FLASH_WRITE_INSTRUCTION);
	spi_send(SPI2, 0x00);
	spi_send(SPI2, 0x00);
	spi_send(SPI2, num_entries);
	flash_cs_high();

	flash_num_entries = num_entries;
}

void flash_reset(void){
	flash_update_num_entries(0);
}

void flash_add(flash_mapping m){
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

void flash_execute(uint16_t id, uint8_t dot, uint8_t td){
	flash_mapping mapping_id = (((int)id << 4) + ((int)(dot & 0x3) << 2) + ((int)(td & 0x3) << 0)) << 12;
	int i;
	for(i = 0; i < flash_num_entries; i++){
		if(mapping_id == (flash_mappings_list[i] & 0xfffff000)){
			int function_id = (flash_mappings_list[i] & 0x00000fc0) >> 6;
			uint8_t function_data = flash_mappings_list[i] & 0x0000003f;
			flash_functions_list[function_id](function_data);
		}
	}
}
