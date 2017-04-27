EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:stm32
LIBS:bcan
LIBS:locomotive-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L +2V8 #PWR033
U 1 1 58D4A0D2
P 1200 3000
F 0 "#PWR033" H 1200 2850 50  0001 C CNN
F 1 "+2V8" H 1200 3140 50  0000 C CNN
F 2 "" H 1200 3000 50  0001 C CNN
F 3 "" H 1200 3000 50  0001 C CNN
	1    1200 3000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR034
U 1 1 58D4A0D8
P 1200 3600
F 0 "#PWR034" H 1200 3350 50  0001 C CNN
F 1 "GND" H 1200 3450 50  0000 C CNN
F 2 "" H 1200 3600 50  0001 C CNN
F 3 "" H 1200 3600 50  0001 C CNN
	1    1200 3600
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR035
U 1 1 58D4A0E6
P 1400 3000
F 0 "#PWR035" H 1400 2850 50  0001 C CNN
F 1 "VCC" H 1400 3150 50  0000 C CNN
F 2 "" H 1400 3000 50  0001 C CNN
F 3 "" H 1400 3000 50  0001 C CNN
	1    1400 3000
	1    0    0    -1  
$EndComp
Text GLabel 1200 3600 1    60   UnSpc ~ 0
GND
Text GLabel 1200 3000 3    60   UnSpc ~ 0
2V8
Text GLabel 1400 3000 3    60   UnSpc ~ 0
VCC
$EndSCHEMATC
