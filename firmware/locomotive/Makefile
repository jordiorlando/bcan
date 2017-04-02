OPENCM3_DIR = libopencm3
BINARY = locomotive

DIRS = . blink beacon tof tof/api
OBJS = blink/blink.o beacon/beacon.o tof/tof.o tof/api/vl6180x_i2c.o tof/api/vl6180x_api.o

LDSCRIPT = stm32f405rg.ld

include libopencm3.target.mk
