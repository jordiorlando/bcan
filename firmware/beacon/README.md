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
Build the firmware into an Intel hex file
```sh
$ make clean
$ make all ID=0xaNewID
```

## Flashing
Flash the Intel hex file using avrdude
```sh
$ make program
```
