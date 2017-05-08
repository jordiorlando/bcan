# Beacon Firmware
This firmware is responsible for continuously broadcasting a unique ID via a modulated IR LED.

## Prerequisites
-   avr-gcc
-   avr-libc
-   avrdude

## Building
Build the firmware into an Intel hex file. The ID should be a 4-digit hexadecimal number.
```sh
$ make clean
$ make all ID=0xbcaf
```

## Flashing
Flash the Intel hex file using avrdude.
```sh
$ make program
```
