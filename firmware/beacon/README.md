# Beacon Firmware
This firmware is responsible for continuously broadcasting a unique ID via a modulated IR LED.

## Prerequisites
- avr-gcc
- avr-libc
- avr-binutils
- avrdude

## One-Time Setup
Burn fuses to not divide the internal oscillator by 8.
Values obtained via [fuse calculator](http://www.engbedded.com/fusecalc/).
```sh
$ make fuses
```

## Building
Build the firmware into an Intel hex file.
The ID should be a 4-digit hexadecimal number with an equal number of '0's and '1's.
```sh
$ make clean
$ make all ID=0xdec0
```

## Flashing
Flash the Intel hex file using avrdude.
```sh
$ make program
```
