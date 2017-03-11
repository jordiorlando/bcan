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
LIBS:SPX3819
LIBS:bcan
LIBS:TSOP57238
LIBS:locomotive-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 4600 4400 0    60   Input ~ 0
SDA
Text HLabel 4600 4300 0    60   Input ~ 0
SCL
Text HLabel 4600 3400 0    60   Input ~ 0
2V8
Text HLabel 7100 4400 2    60   Input ~ 0
GND
$Comp
L VL6180X U?
U 1 1 58C369EE
P 5750 3700
F 0 "U?" H 5800 3700 60  0000 C CNN
F 1 "VL6180X" H 5800 3600 60  0000 C CNN
F 2 "" H 5800 3700 60  0001 C CNN
F 3 "" H 5800 3700 60  0001 C CNN
	1    5750 3700
	1    0    0    -1  
$EndComp
$Comp
L R_Small R?
U 1 1 58C370B7
P 4800 3700
F 0 "R?" H 4830 3720 50  0000 L CNN
F 1 "47k" H 4830 3660 50  0000 L CNN
F 2 "" H 4800 3700 50  0001 C CNN
F 3 "" H 4800 3700 50  0001 C CNN
	1    4800 3700
	1    0    0    -1  
$EndComp
$Comp
L R_Small R?
U 1 1 58C370BD
P 5000 3550
F 0 "R?" H 5030 3570 50  0000 L CNN
F 1 "47k" H 5030 3510 50  0000 L CNN
F 2 "" H 5000 3550 50  0001 C CNN
F 3 "" H 5000 3550 50  0001 C CNN
	1    5000 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 3400 4800 3600
Wire Wire Line
	4800 3800 4800 4200
Wire Wire Line
	4800 4200 5200 4200
Wire Wire Line
	5000 3650 5000 3900
Wire Wire Line
	5000 3900 5200 3900
Wire Wire Line
	6550 3400 6550 4300
Wire Wire Line
	6400 4100 6600 4100
Wire Wire Line
	6400 4300 6600 4300
Connection ~ 6550 4100
$Comp
L GND #PWR040
U 1 1 58C379FA
P 6850 4550
F 0 "#PWR040" H 6850 4300 50  0001 C CNN
F 1 "GND" H 6850 4400 50  0000 C CNN
F 2 "" H 6850 4550 50  0001 C CNN
F 3 "" H 6850 4550 50  0001 C CNN
	1    6850 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 3900 6850 3900
Wire Wire Line
	6850 3900 6850 4550
Wire Wire Line
	6850 4400 7100 4400
Connection ~ 6850 4400
Wire Wire Line
	6400 4200 6850 4200
Connection ~ 6850 4200
$Comp
L C_Small C?
U 1 1 58C37BD2
P 6700 4100
F 0 "C?" H 6710 4170 50  0000 L CNN
F 1 "100nF" H 6500 4050 50  0000 L CNN
F 2 "" H 6700 4100 50  0001 C CNN
F 3 "" H 6700 4100 50  0001 C CNN
	1    6700 4100
	0    1    1    0   
$EndComp
$Comp
L C_Small C?
U 1 1 58C37C29
P 6700 4300
F 0 "C?" H 6710 4370 50  0000 L CNN
F 1 "4.7u" H 6750 4250 50  0000 L CNN
F 2 "" H 6700 4300 50  0001 C CNN
F 3 "" H 6700 4300 50  0001 C CNN
	1    6700 4300
	0    1    1    0   
$EndComp
Wire Wire Line
	6800 4100 6850 4100
Connection ~ 6850 4100
Connection ~ 6550 4300
Wire Wire Line
	6800 4300 6850 4300
Connection ~ 6850 4300
Wire Wire Line
	4600 3400 6550 3400
Wire Wire Line
	5000 3450 5000 3400
Connection ~ 5000 3400
Connection ~ 4800 3400
Wire Wire Line
	4600 4300 5200 4300
Wire Wire Line
	4600 4400 5200 4400
$EndSCHEMATC
