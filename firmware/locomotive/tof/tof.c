#include "tof.h"

VL6180xDev_t tof_dev = TOF_SLAVE_ADDR;
VL6180x_RangeData_t tof_range;
bool is_triggered = false;

static void tof_gpio_setup(void) {
	/* Enable GPIOB clock. */
	rcc_periph_clock_enable(RCC_GPIOB);

	/* Set PB10 and PB11 to 'alternate function floating'. */
	gpio_mode_setup(GPIOB, GPIO_MODE_AF, GPIO_PUPD_NONE, GPIO10 | GPIO11);
	gpio_set_output_options(GPIOB, GPIO_OTYPE_OD, GPIO_OSPEED_2MHZ, GPIO10 | GPIO11);

	/* Set PB10 and PB11 to alternate function 4. */
	gpio_set_af(GPIOB, GPIO_AF4, GPIO10 | GPIO11);
}

//i2c setup - see section 27.3.3 of reference manual(p.848)
static void tof_i2c_setup(void) {
	rcc_periph_clock_enable(RCC_I2C2);
	i2c_reset(I2C2);
	i2c_peripheral_disable(I2C2);
	i2c_set_standard_mode(I2C2);
	// i2c_enable_ack(I2C2);
	i2c_set_clock_frequency(I2C2, I2C_CR2_FREQ_2MHZ);
	i2c_set_ccr(I2C2, 10); //2MHz(peripheral clock) / (100kHz(bus frequency) * 2) = 10
	i2c_set_trise(I2C2, 3); //120ns rise time means <1 2Mhz cycle
	i2c_peripheral_enable(I2C2);
}

void tof_setup(void){
	tof_gpio_setup();
	tof_i2c_setup();

	//vl6180x setup
	VL6180x_WaitDeviceBooted(tof_dev); //blocks up to 400us
	VL6180x_InitData(tof_dev);
	VL6180x_Prepare(tof_dev);
	VL6180x_RangeStartSingleShot(tof_dev); //kick off ranging measurement
}

int VL6180x_I2CWrite(VL6180xDev_t dev, uint8_t  *buff, uint8_t len){
	i2c_transfer7(I2C2, dev, buff, len, NULL, 0);
	return 0;
}

int VL6180x_I2CRead(VL6180xDev_t dev, uint8_t *buff, uint8_t len){
	i2c_transfer7(I2C2, dev, NULL, 0, buff, len);
	return 0;
}

bool tof_should_stop(void){
	if (VL6180x_RangeGetMeasurementIfReady(tof_dev, &tof_range) != NOT_READY){
		VL6180x_RangeStartSingleShot(tof_dev);
		is_triggered = tof_range.range_mm <= TOF_TRIGGER_DISTANCE_MM;
	}

	return is_triggered;
}
