OPENCM3_DIR = libopencm3
BINARY = locomotive

DIRS = . led beacon tof tof/api
OBJS = led/led.o beacon/beacon.o tof/tof.o tof/api/vl6180x_i2c.o tof/api/vl6180x_api.o

LDSCRIPT = stm32f405rg.ld

include libopencm3.target.mk
