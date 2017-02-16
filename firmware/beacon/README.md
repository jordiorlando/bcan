# Beacon Firmware
This firmware is responsible for continuously broadcasting a unique ID via a modulated IR LED.

## Prerequisites
- avr-gcc
- avr-libc
- avr-binutils
- avrdude

## Burn fuses
Calculate fuses using the [fuse calculator](http://www.engbedded.com/fusecalc/) to not divide internal oscillator by 8.
```sh
$ avrdude -p t45 -c avrisp2 -U lfuse:w:0xe2:m -U hfuse:w:0xdf:m -U efuse:w:0xff:m
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
