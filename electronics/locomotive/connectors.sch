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
Sheet 3 5
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
L CONN_01X08 J5
U 1 1 58D2C0C9
P 4500 4250
F 0 "J5" H 4500 4700 50  0000 C CNN
F 1 "TRAIN" V 4600 4250 50  0000 C CNN
F 2 "" H 4500 4250 50  0001 C CNN
F 3 "" H 4500 4250 50  0001 C CNN
	1    4500 4250
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X05 J1
U 1 1 58D2CFA7
P 3550 3300
F 0 "J1" H 3550 3600 50  0000 C CNN
F 1 "JTAG" H 3550 3000 50  0000 C CNN
F 2 "" H 3550 2100 50  0001 C CNN
F 3 "" H 3550 2100 50  0001 C CNN
	1    3550 3300
	1    0    0    -1  
$EndComp
$Comp
L +2V8 #PWR030
U 1 1 58D2D77C
P 3200 3000
F 0 "#PWR030" H 3200 2850 50  0001 C CNN
F 1 "+2V8" H 3200 3140 50  0000 C CNN
F 2 "" H 3200 3000 50  0001 C CNN
F 3 "" H 3200 3000 50  0001 C CNN
	1    3200 3000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR031
U 1 1 58D2D794
P 3200 3600
F 0 "#PWR031" H 3200 3350 50  0001 C CNN
F 1 "GND" H 3200 3450 50  0000 C CNN
F 2 "" H 3200 3600 50  0001 C CNN
F 3 "" H 3200 3600 50  0001 C CNN
	1    3200 3600
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X04 J6
U 1 1 58D2DA24
P 2500 4450
F 0 "J6" H 2500 4700 50  0000 C CNN
F 1 "IR" V 2600 4450 50  0000 C CNN
F 2 "" H 2500 4450 50  0001 C CNN
F 3 "" H 2500 4450 50  0001 C CNN
	1    2500 4450
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X04 J7
U 1 1 58D2DAD7
P 3500 4450
F 0 "J7" H 3500 4700 50  0000 C CNN
F 1 "TOF" V 3600 4450 50  0000 C CNN
F 2 "" H 3500 4450 50  0001 C CNN
F 3 "" H 3500 4450 50  0001 C CNN
	1    3500 4450
	1    0    0    -1  
$EndComp
Text HLabel 3800 3100 2    60   Output ~ 0
JTAG_TMS
Text HLabel 3800 3200 2    60   Output ~ 0
JTAG_TCK
Text HLabel 3800 3300 2    60   Input ~ 0
JTAG_TDO
Text HLabel 3800 3400 2    60   Output ~ 0
JTAG_TDI
Text HLabel 3800 3500 2    60   Output ~ 0
JTAG_RST
Text HLabel 2300 3200 0    60   BiDi ~ 0
USB_D-
Text HLabel 2300 3300 0    60   BiDi ~ 0
USB_D+
$Comp
L GND #PWR032
U 1 1 58D0EAD8
P 2200 3600
F 0 "#PWR032" H 2200 3350 50  0001 C CNN
F 1 "GND" H 2200 3450 50  0000 C CNN
F 2 "" H 2200 3600 50  0001 C CNN
F 3 "" H 2200 3600 50  0001 C CNN
	1    2200 3600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR033
U 1 1 58D0EB2D
P 2200 4700
F 0 "#PWR033" H 2200 4450 50  0001 C CNN
F 1 "GND" H 2200 4550 50  0000 C CNN
F 2 "" H 2200 4700 50  0001 C CNN
F 3 "" H 2200 4700 50  0001 C CNN
	1    2200 4700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR034
U 1 1 58D0EB7E
P 3200 4700
F 0 "#PWR034" H 3200 4450 50  0001 C CNN
F 1 "GND" H 3200 4550 50  0000 C CNN
F 2 "" H 3200 4700 50  0001 C CNN
F 3 "" H 3200 4700 50  0001 C CNN
	1    3200 4700
	1    0    0    -1  
$EndComp
$Comp
L +2V8 #PWR035
U 1 1 58D0EC64
P 3200 4200
F 0 "#PWR035" H 3200 4050 50  0001 C CNN
F 1 "+2V8" H 3200 4340 50  0000 C CNN
F 2 "" H 3200 4200 50  0001 C CNN
F 3 "" H 3200 4200 50  0001 C CNN
	1    3200 4200
	1    0    0    -1  
$EndComp
$Comp
L +2V8 #PWR036
U 1 1 58D0EC83
P 2200 4200
F 0 "#PWR036" H 2200 4050 50  0001 C CNN
F 1 "+2V8" H 2200 4340 50  0000 C CNN
F 2 "" H 2200 4200 50  0001 C CNN
F 3 "" H 2200 4200 50  0001 C CNN
	1    2200 4200
	1    0    0    -1  
$EndComp
Text HLabel 3300 4500 0    60   BiDi ~ 0
I2C2_SCL
Text HLabel 3300 4400 0    60   BiDi ~ 0
I2C2_SDA
Text HLabel 2300 4400 0    60   Output ~ 0
IR_R
Text HLabel 2300 4500 0    60   Output ~ 0
IR_L
Text HLabel 4300 3900 0    60   Input ~ 0
MOT+
Text HLabel 4300 4000 0    60   UnSpc ~ 0
RAIL_R
Text HLabel 4300 4500 0    60   UnSpc ~ 0
RAIL_L
Text HLabel 4300 4600 0    60   Input ~ 0
MOT-
Text HLabel 4300 4200 0    60   Output ~ 0
I
$Comp
L +2V8 #PWR037
U 1 1 58D4A0D2
P 1200 3000
F 0 "#PWR037" H 1200 2850 50  0001 C CNN
F 1 "+2V8" H 1200 3140 50  0000 C CNN
F 2 "" H 1200 3000 50  0001 C CNN
F 3 "" H 1200 3000 50  0001 C CNN
	1    1200 3000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR038
U 1 1 58D4A0D8
P 1200 3600
F 0 "#PWR038" H 1200 3350 50  0001 C CNN
F 1 "GND" H 1200 3450 50  0000 C CNN
F 2 "" H 1200 3600 50  0001 C CNN
F 3 "" H 1200 3600 50  0001 C CNN
	1    1200 3600
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR039
U 1 1 58D4A0E0
P 1000 3000
F 0 "#PWR039" H 1000 2850 50  0001 C CNN
F 1 "+5V" H 1000 3140 50  0000 C CNN
F 2 "" H 1000 3000 50  0001 C CNN
F 3 "" H 1000 3000 50  0001 C CNN
	1    1000 3000
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR040
U 1 1 58D4A0E6
P 1400 3000
F 0 "#PWR040" H 1400 2850 50  0001 C CNN
F 1 "VCC" H 1400 3150 50  0000 C CNN
F 2 "" H 1400 3000 50  0001 C CNN
F 3 "" H 1400 3000 50  0001 C CNN
	1    1400 3000
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR041
U 1 1 58D4B9AC
P 2200 3000
F 0 "#PWR041" H 2200 2850 50  0001 C CNN
F 1 "+5V" H 2200 3140 50  0000 C CNN
F 2 "" H 2200 3000 50  0001 C CNN
F 3 "" H 2200 3000 50  0001 C CNN
	1    2200 3000
	1    0    0    -1  
$EndComp
Text Notes 4700 3950 0    60   ~ 0
M+
Text Notes 4700 4050 0    60   ~ 0
T+
Text Notes 4700 4150 0    60   ~ 0
R-
Text Notes 4700 4250 0    60   ~ 0
I_0
Text Notes 4700 4450 0    60   ~ 0
F-
Text Notes 4700 4550 0    60   ~ 0
T-
Wire Wire Line
	2200 3500 2200 3600
Wire Wire Line
	2300 3500 2200 3500
Wire Wire Line
	2200 3100 2200 3000
Wire Wire Line
	2300 3100 2200 3100
Wire Wire Line
	3200 4300 3200 4200
Wire Wire Line
	3300 4300 3200 4300
Wire Wire Line
	2200 4300 2200 4200
Wire Wire Line
	2300 4300 2200 4300
Wire Wire Line
	3200 4600 3200 4700
Wire Wire Line
	3300 4600 3200 4600
Wire Wire Line
	2200 4600 2200 4700
Wire Wire Line
	2300 4600 2200 4600
Wire Wire Line
	3200 3100 3300 3100
Connection ~ 3200 3300
Wire Wire Line
	3300 3200 3200 3200
Connection ~ 3200 3400
Wire Wire Line
	3300 3300 3200 3300
Connection ~ 3200 3500
Wire Wire Line
	3200 3400 3300 3400
Wire Wire Line
	3200 3200 3200 3600
Wire Wire Line
	3200 3500 3300 3500
Wire Wire Line
	3200 3000 3200 3100
Text Notes 4700 4650 0    60   ~ 0
M-
Text HLabel 2300 3400 0    60   Output ~ 0
USB_ID
Text HLabel 4300 4100 0    60   Input ~ 0
RVRS-
Text HLabel 4300 4400 0    60   Input ~ 0
FRWD-
Text GLabel 1200 3600 1    60   UnSpc ~ 0
GND
Text GLabel 1200 3000 3    60   UnSpc ~ 0
2V8
Text GLabel 1400 3000 3    60   UnSpc ~ 0
VCC
Text GLabel 1000 3000 3    60   UnSpc ~ 0
5V
$Comp
L USB_OTG J2
U 1 1 58D37984
P 2600 3300
F 0 "J2" H 2925 3175 50  0000 C CNN
F 1 "USB_OTG" H 2600 3500 50  0000 C CNN
F 2 "" V 2550 3200 50  0001 C CNN
F 3 "" V 2550 3200 50  0001 C CNN
	1    2600 3300
	0    1    1    0   
$EndComp
$Comp
L GND #PWR042
U 1 1 58D37A7C
P 2700 3700
F 0 "#PWR042" H 2700 3450 50  0001 C CNN
F 1 "GND" H 2700 3550 50  0000 C CNN
F 2 "" H 2700 3700 50  0001 C CNN
F 3 "" H 2700 3700 50  0001 C CNN
	1    2700 3700
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X32 J3
U 1 1 58D444F6
P 7400 3850
F 0 "J3" H 7400 5500 50  0000 C CNN
F 1 "CONN_01X32" V 7500 3850 50  0000 C CNN
F 2 "" H 7400 3850 50  0001 C CNN
F 3 "" H 7400 3850 50  0001 C CNN
	1    7400 3850
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X32 J4
U 1 1 58D44731
P 9900 3850
F 0 "J4" H 9900 5500 50  0000 C CNN
F 1 "CONN_01X32" V 10000 3850 50  0000 C CNN
F 2 "" H 9900 3850 50  0001 C CNN
F 3 "" H 9900 3850 50  0001 C CNN
	1    9900 3850
	1    0    0    -1  
$EndComp
Text HLabel 3400 6000 2    60   BiDi ~ 0
PC[0..15]
Entry Wire Line
	3000 7300 3100 7400
Entry Wire Line
	3000 7200 3100 7300
Entry Wire Line
	3000 7100 3100 7200
Entry Wire Line
	3000 7000 3100 7100
Entry Wire Line
	3000 6900 3100 7000
Entry Wire Line
	3000 6800 3100 6900
Entry Wire Line
	3000 6700 3100 6800
Entry Wire Line
	3000 6600 3100 6700
Entry Wire Line
	3000 6500 3100 6600
Entry Wire Line
	3000 6400 3100 6500
Entry Wire Line
	3000 6300 3100 6400
Entry Wire Line
	3000 6200 3100 6300
Entry Wire Line
	3000 6100 3100 6200
Entry Wire Line
	3000 7500 3100 7600
Entry Wire Line
	3000 7600 3100 7700
Entry Wire Line
	3000 7400 3100 7500
Entry Wire Line
	600  6100 700  6200
Entry Wire Line
	600  6200 700  6300
Entry Wire Line
	600  6300 700  6400
Entry Wire Line
	600  6400 700  6500
Entry Wire Line
	600  6500 700  6600
Entry Wire Line
	600  6600 700  6700
Entry Wire Line
	600  6700 700  6800
Entry Wire Line
	600  6800 700  6900
Text Label 700  7700 0    60   ~ 0
PA15
Text Label 700  7600 0    60   ~ 0
PA14
Text Label 700  7500 0    60   ~ 0
PA13
Text Label 700  7400 0    60   ~ 0
PA12
Text Label 700  7300 0    60   ~ 0
PA11
Text Label 700  7200 0    60   ~ 0
PA10
Text Label 700  7100 0    60   ~ 0
PA9
Entry Wire Line
	600  6900 700  7000
Entry Wire Line
	600  7000 700  7100
Entry Wire Line
	600  7100 700  7200
Entry Wire Line
	600  7200 700  7300
Entry Wire Line
	600  7300 700  7400
Entry Wire Line
	600  7400 700  7500
Entry Wire Line
	600  7500 700  7600
Entry Wire Line
	600  7600 700  7700
Text HLabel 1000 6000 2    60   BiDi ~ 0
PA[0..15]
Text Label 1900 7700 0    60   ~ 0
PB15
Text Label 1900 7600 0    60   ~ 0
PB14
Text Label 1900 7500 0    60   ~ 0
PB13
Text Label 1900 7400 0    60   ~ 0
PB12
Text Label 1900 7300 0    60   ~ 0
PB11
Text Label 1900 7200 0    60   ~ 0
PB10
Text Label 1900 7100 0    60   ~ 0
PB9
Text Label 1900 7000 0    60   ~ 0
PB8
Text Label 1900 6200 0    60   ~ 0
PB0
Text Label 1900 6300 0    60   ~ 0
PB1
Text Label 1900 6400 0    60   ~ 0
PB2
Text Label 1900 6500 0    60   ~ 0
PB3
Entry Wire Line
	1800 6100 1900 6200
Entry Wire Line
	1800 6200 1900 6300
Entry Wire Line
	1800 6300 1900 6400
Entry Wire Line
	1800 6400 1900 6500
Entry Wire Line
	1800 6500 1900 6600
Entry Wire Line
	1800 6600 1900 6700
Entry Wire Line
	1800 6700 1900 6800
Entry Wire Line
	1800 6800 1900 6900
Entry Wire Line
	1800 6900 1900 7000
Entry Wire Line
	1800 7000 1900 7100
Entry Wire Line
	1800 7100 1900 7200
Entry Wire Line
	1800 7200 1900 7300
Entry Wire Line
	1800 7300 1900 7400
Entry Wire Line
	1800 7400 1900 7500
Entry Wire Line
	1800 7500 1900 7600
Entry Wire Line
	1800 7600 1900 7700
Text HLabel 2200 6000 2    60   BiDi ~ 0
PB[0..15]
Text Label 3100 6200 0    60   ~ 0
PC0
Text Label 3100 6300 0    60   ~ 0
PC1
Text Label 3100 6400 0    60   ~ 0
PC2
Text Label 3100 6500 0    60   ~ 0
PC3
Text Label 3100 6600 0    60   ~ 0
PC4
Text Label 3100 6700 0    60   ~ 0
PC5
Text Label 3100 6800 0    60   ~ 0
PC6
Text Label 3100 6900 0    60   ~ 0
PC7
Text Label 3100 7000 0    60   ~ 0
PC8
Text Label 3100 7100 0    60   ~ 0
PC9
Text Label 3100 7200 0    60   ~ 0
PC10
Text Label 3100 7300 0    60   ~ 0
PC11
Text Label 3100 7400 0    60   ~ 0
PC12
Text Label 3100 7500 0    60   ~ 0
PC13
Text Label 3100 7600 0    60   ~ 0
PC14
Text Label 3100 7700 0    60   ~ 0
PC15
Text Label 1900 6600 0    60   ~ 0
PB4
Text Label 1900 6700 0    60   ~ 0
PB5
Text Label 1900 6800 0    60   ~ 0
PB6
Text Label 1900 6900 0    60   ~ 0
PB7
Text Label 700  7000 0    60   ~ 0
PA8
Text Label 700  6900 0    60   ~ 0
PA7
Text Label 700  6800 0    60   ~ 0
PA6
Text Label 700  6700 0    60   ~ 0
PA5
Text Label 700  6600 0    60   ~ 0
PA4
Text Label 700  6500 0    60   ~ 0
PA3
Text Label 700  6400 0    60   ~ 0
PA2
Text Label 700  6300 0    60   ~ 0
PA1
Text Label 700  6200 0    60   ~ 0
PA0
Wire Bus Line
	3000 6000 3000 7600
Wire Wire Line
	1000 7100 700  7100
Wire Wire Line
	1000 7200 700  7200
Wire Wire Line
	1000 7300 700  7300
Wire Wire Line
	1000 7700 700  7700
Wire Wire Line
	1000 7400 700  7400
Wire Wire Line
	1000 7500 700  7500
Wire Wire Line
	1000 7600 700  7600
Wire Bus Line
	600  6000 600  7600
Wire Wire Line
	2200 6200 1900 6200
Wire Wire Line
	2200 6300 1900 6300
Wire Wire Line
	2200 6400 1900 6400
Wire Wire Line
	2200 6500 1900 6500
Wire Wire Line
	2200 7000 1900 7000
Wire Wire Line
	2200 7100 1900 7100
Wire Wire Line
	2200 7200 1900 7200
Wire Wire Line
	2200 7300 1900 7300
Wire Wire Line
	2200 7400 1900 7400
Wire Wire Line
	2200 7500 1900 7500
Wire Wire Line
	2200 7600 1900 7600
Wire Wire Line
	2200 7700 1900 7700
Wire Bus Line
	1800 6000 1800 7600
Wire Wire Line
	3400 6300 3100 6300
Wire Wire Line
	3400 6200 3100 6200
Wire Wire Line
	3100 6400 3400 6400
Wire Wire Line
	3100 6500 3400 6500
Wire Wire Line
	3400 6600 3100 6600
Wire Wire Line
	3400 6700 3100 6700
Wire Wire Line
	3400 6800 3100 6800
Wire Wire Line
	3400 6900 3100 6900
Wire Wire Line
	3400 7000 3100 7000
Wire Wire Line
	3400 7100 3100 7100
Wire Wire Line
	3400 7200 3100 7200
Wire Wire Line
	3400 7300 3100 7300
Wire Wire Line
	3400 7400 3100 7400
Wire Wire Line
	3100 7500 3400 7500
Wire Wire Line
	3400 7600 3100 7600
Wire Wire Line
	3400 7700 3100 7700
Wire Wire Line
	1900 6900 2200 6900
Wire Wire Line
	1900 6800 2200 6800
Wire Wire Line
	1900 6700 2200 6700
Wire Wire Line
	1900 6600 2200 6600
Wire Wire Line
	700  7000 1000 7000
Wire Wire Line
	1000 6300 700  6300
Wire Wire Line
	1000 6400 700  6400
Wire Wire Line
	1000 6500 700  6500
Wire Wire Line
	1000 6900 700  6900
Wire Wire Line
	1000 6600 700  6600
Wire Wire Line
	1000 6700 700  6700
Wire Wire Line
	1000 6800 700  6800
Wire Wire Line
	700  6200 1000 6200
Wire Bus Line
	2200 6000 1800 6000
Wire Bus Line
	1000 6000 600  6000
Wire Bus Line
	3400 6000 3000 6000
Wire Notes Line
	500  5900 5100 5900
Wire Notes Line
	5100 5900 5100 7800
Text HLabel 4600 6000 2    60   BiDi ~ 0
PD2
Wire Wire Line
	4600 6400 4200 6400
Text Label 4300 6400 0    60   ~ 0
PD2
Wire Wire Line
	4200 6400 4200 6000
Wire Wire Line
	4200 6000 4600 6000
$EndSCHEMATC