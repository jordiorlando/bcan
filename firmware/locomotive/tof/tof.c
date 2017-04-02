#include "tof.h"

VL6180xDev_t tof_dev;
VL6180x_RangeData_t tof_range;

void tof_setup(void){
	//i2c setup - see section 27.3.3 of reference manual(p.848)
	i2c_reset(I2C1);
	i2c_peripheral_disable(I2C1);
	rcc_periph_clock_enable(RCC_I2C1);
	i2c_set_standard_mode(I2C1);
	i2c_set_clock_frequency(I2C1, I2C_CR2_FREQ_2MHZ);
	i2c_set_ccr(I2C1, 20); //2MHz(peripheral clock) / 100kHz(bus frequency) = 20
	i2c_set_trise(I2C1, 1); //120ns rise time means <1 2Mhz cycle
	i2c_peripheral_enable(I2C1);

	//vl6180x setup
	VL6180x_WaitDeviceBooted(tof_dev); //blocks up to 400us
    VL6180x_InitData(tof_dev);
    VL6180x_Prepare(tof_dev);
    VL6180x_RangeStartSingleShot(tof_dev); //kick off ranging measurement 
}

int VL6180x_I2CWrite(VL6180xDev_t dev, uint8_t  *buff, uint8_t len){
    i2c_transfer7(I2C1, (uint8_t)dev, buff, len, NULL, 0);
    return 0;
}

int VL6180x_I2CRead(VL6180xDev_t dev, uint8_t *buff, uint8_t len){
	i2c_transfer7(I2C1, (uint8_t)dev, NULL, 0, buff, len);
	return 0;
}

bool tof_should_stop(void){
	if(VL6180x_RangeGetMeasurementIfReady(tof_dev, &tof_range) == NOT_READY){
		return false;
	}
	VL6180x_RangeStartSingleShot(tof_dev);
	return tof_range.range_mm <= TOF_TRIGGER_DISTANCE_MM;
}
