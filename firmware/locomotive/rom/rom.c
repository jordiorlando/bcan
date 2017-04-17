#include "rom.h"

int rom_num_entries;
rom_mapping rom_mappings_list[ROM_MAX_ENTRIES];
rom_func rom_functions_list[ROM_MAX_FUNCTIONS];

static void rom_placeholder_func(uint8_t data){
	(void)data;
}

static void rom_cs_low(void){
	gpio_clear(GPIOB, GPIO12);
}

static void rom_cs_high(void){
	gpio_set(GPIOB, GPIO12);
}

static void rom_gpio_init(void){
	/* Enable the GPIO ports whose pins we are using */
	rcc_periph_clock_enable(RCC_GPIOB);

	gpio_mode_setup(GPIOB, GPIO_MODE_AF, GPIO_PUPD_PULLDOWN,
			GPIO13 | GPIO14 | GPIO15);
	gpio_set_af(GPIOB, GPIO_AF5, GPIO13 | GPIO14 | GPIO15);
	gpio_set_output_options(GPIOB, GPIO_OTYPE_PP, GPIO_OSPEED_25MHZ,
				GPIO14 | GPIO15);

	/* Chip select line */
	gpio_mode_setup(GPIOB, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, GPIO12);
	rom_cs_high();

	rcc_periph_clock_enable(RCC_SPI2);
}

static void rom_spi_init(void){
	spi_init_master(SPI2, 1000000, SPI_CR1_CPOL_CLK_TO_0_WHEN_IDLE,
		SPI_CR1_CPHA_CLK_TRANSITION_1, SPI_CR1_DFF_8BIT,
		SPI_CR1_MSBFIRST);
}

void rom_init(void){
	rom_gpio_init();
	rom_spi_init();

	// Get number of entries	
	rom_cs_low();
	spi_send(SPI2, ROM_READ_INSTRUCTION);
	rom_cs_high();
	spi_send(SPI2, 0x00);
	spi_send(SPI2, 0x00);
	rom_num_entries = spi_read(SPI2);
	if(rom_num_entries > ROM_MAX_ENTRIES){
		rom_num_entries = ROM_MAX_ENTRIES;
	}

	// Read and Save Entries
	int i;
	for(i = 0; i < rom_num_entries; i++){
		uint16_t base_addr = (uint16_t)((i*ROM_ENTRY_WIDTH)+ROM_DATA_START);
		int parts[4];
		int j;
		for(j = 0; j < 4; j++){
			uint16_t part_addr = base_addr + j;
			rom_cs_low();
			spi_send(SPI2, ROM_READ_INSTRUCTION);
			rom_cs_high();
			spi_send(SPI2, (part_addr & 0xff00) >> 8);
			spi_send(SPI2, (part_addr & 0x00ff));
			parts[j] = spi_read(SPI2);
		}
		rom_mappings_list[i] = (parts[0] << 24) + (parts[1] << 16) + (parts[2] << 8) + (parts[3] << 0);
	}

	// Initalize rom_functions_list to placeholder function
	for(i = 0; i < ROM_MAX_FUNCTIONS; i++){
		rom_functions_list[i] = rom_placeholder_func;
	}

}

void rom_function_add(int idx, rom_func f){
	rom_functions_list[idx] = f;
}

static void rom_update_num_entries(uint8_t num_entries){
	rom_cs_low();
	spi_send(SPI2, ROM_WRITE_ENABLE_INSTRUCTION);
	rom_cs_high();
	// need small delay here?
	rom_cs_low();
	spi_send(SPI2, ROM_WRITE_INSTRUCTION);
	spi_send(SPI2, 0x00);
	spi_send(SPI2, 0x00);
	spi_send(SPI2, num_entries);
	rom_cs_high();

	rom_num_entries = num_entries;
}

void rom_reset(void){
	rom_update_num_entries(0);
}

void rom_add(rom_mapping m){
	// Update number of entries number of entries
	rom_cs_low();
	spi_send(SPI2, ROM_READ_INSTRUCTION);
	rom_cs_high();
	spi_send(SPI2, 0x00);
	spi_send(SPI2, 0x00);
	uint8_t new_num_entries = spi_read(SPI2)+1;
	rom_update_num_entries(new_num_entries);
	uint16_t addr = (new_num_entries*ROM_ENTRY_WIDTH)+ROM_DATA_START;

	// Write new mapping
	rom_cs_low();
	spi_send(SPI2, ROM_WRITE_ENABLE_INSTRUCTION);
	rom_cs_high();
	// need small delay here?
	rom_cs_low();
	spi_send(SPI2, ROM_WRITE_INSTRUCTION);
	spi_send(SPI2, (addr & 0xff00) >> 8);
	spi_send(SPI2, (addr & 0x00ff));
	spi_send(SPI2, (m & 0xff000000) >> 24);
	spi_send(SPI2, (m & 0x00ff0000) >> 16);
	spi_send(SPI2, (m & 0x0000ff00) >> 8);
	spi_send(SPI2, (m & 0x000000ff) >> 0);
	rom_cs_high();	
}

void rom_execute(uint16_t id, uint8_t dot, uint8_t td){
	rom_mapping mapping_id = (((int)id << 4) + ((int)(dot & 0x3) << 2) + ((int)(td & 0x3) << 0)) << 12;
	int i;
	for(i = 0; i < rom_num_entries; i++){
		if(mapping_id == (rom_mappings_list[i] & 0xfffff000)){
			int function_id = (rom_mappings_list[i] & 0x00000fc0) >> 6;
			uint8_t function_data = rom_mappings_list[i] & 0x0000003f;
			rom_functions_list[function_id](function_data);
		}
	}
}