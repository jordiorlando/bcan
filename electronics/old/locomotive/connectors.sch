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
Sheet 2 4
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
L CONN_02X05 J1
U 1 1 58D2CFA7
P 4250 3300
F 0 "J1" H 4250 3600 50  0000 C CNN
F 1 "JTAG" H 4250 3000 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x05_Pitch1.27mm_SMD" H 4250 2100 50  0001 C CNN
F 3 "" H 4250 2100 50  0001 C CNN
	1    4250 3300
	1    0    0    -1  
$EndComp
$Comp
L +2V8 #PWR020
U 1 1 58D2D77C
P 3900 3000
F 0 "#PWR020" H 3900 2850 50  0001 C CNN
F 1 "+2V8" H 3900 3140 50  0000 C CNN
F 2 "" H 3900 3000 50  0001 C CNN
F 3 "" H 3900 3000 50  0001 C CNN
	1    3900 3000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR021
U 1 1 58D2D794
P 3900 3700
F 0 "#PWR021" H 3900 3450 50  0001 C CNN
F 1 "GND" H 3900 3550 50  0000 C CNN
F 2 "" H 3900 3700 50  0001 C CNN
F 3 "" H 3900 3700 50  0001 C CNN
	1    3900 3700
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X04 J8
U 1 1 58D2DA24
P 3200 4450
F 0 "J8" H 3200 4700 50  0000 C CNN
F 1 "IR" V 3300 4450 50  0000 C CNN
F 2 "Connectors_JST:JST_GH_SM04B-GHS-TB_04x1.25mm_Angled" H 3200 4450 50  0001 C CNN
F 3 "" H 3200 4450 50  0001 C CNN
	1    3200 4450
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X04 J9
U 1 1 58D2DAD7
P 4200 4450
F 0 "J9" H 4200 4700 50  0000 C CNN
F 1 "TOF" V 4300 4450 50  0000 C CNN
F 2 "Connectors_JST:JST_GH_SM04B-GHS-TB_04x1.25mm_Angled" H 4200 4450 50  0001 C CNN
F 3 "" H 4200 4450 50  0001 C CNN
	1    4200 4450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR022
U 1 1 58D0EAD8
P 2900 3700
F 0 "#PWR022" H 2900 3450 50  0001 C CNN
F 1 "GND" H 2900 3550 50  0000 C CNN
F 2 "" H 2900 3700 50  0001 C CNN
F 3 "" H 2900 3700 50  0001 C CNN
	1    2900 3700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR023
U 1 1 58D0EB2D
P 2900 4700
F 0 "#PWR023" H 2900 4450 50  0001 C CNN
F 1 "GND" H 2900 4550 50  0000 C CNN
F 2 "" H 2900 4700 50  0001 C CNN
F 3 "" H 2900 4700 50  0001 C CNN
	1    2900 4700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR024
U 1 1 58D0EB7E
P 3900 4700
F 0 "#PWR024" H 3900 4450 50  0001 C CNN
F 1 "GND" H 3900 4550 50  0000 C CNN
F 2 "" H 3900 4700 50  0001 C CNN
F 3 "" H 3900 4700 50  0001 C CNN
	1    3900 4700
	1    0    0    -1  
$EndComp
$Comp
L +2V8 #PWR025
U 1 1 58D0EC64
P 3900 4200
F 0 "#PWR025" H 3900 4050 50  0001 C CNN
F 1 "+2V8" H 3900 4340 50  0000 C CNN
F 2 "" H 3900 4200 50  0001 C CNN
F 3 "" H 3900 4200 50  0001 C CNN
	1    3900 4200
	1    0    0    -1  
$EndComp
$Comp
L +2V8 #PWR026
U 1 1 58D0EC83
P 2900 4200
F 0 "#PWR026" H 2900 4050 50  0001 C CNN
F 1 "+2V8" H 2900 4340 50  0000 C CNN
F 2 "" H 2900 4200 50  0001 C CNN
F 3 "" H 2900 4200 50  0001 C CNN
	1    2900 4200
	1    0    0    -1  
$EndComp
Text HLabel 3900 4500 0    60   BiDi ~ 0
I2C2_SCL
Text HLabel 3900 4400 0    60   BiDi ~ 0
I2C2_SDA
Text HLabel 2900 4400 0    60   Output ~ 0
IR_R
Text HLabel 2900 4500 0    60   Output ~ 0
IR_L
Text HLabel 4900 4300 0    60   Input ~ 0
MOT+
Text HLabel 5800 4600 2    60   Input ~ 0
MOT-
Text HLabel 5800 4400 2    60   Output ~ 0
I
$Comp
L +2V8 #PWR027
U 1 1 58D4A0D2
P 1200 3000
F 0 "#PWR027" H 1200 2850 50  0001 C CNN
F 1 "+2V8" H 1200 3140 50  0000 C CNN
F 2 "" H 1200 3000 50  0001 C CNN
F 3 "" H 1200 3000 50  0001 C CNN
	1    1200 3000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR028
U 1 1 58D4A0D8
P 1200 3600
F 0 "#PWR028" H 1200 3350 50  0001 C CNN
F 1 "GND" H 1200 3450 50  0000 C CNN
F 2 "" H 1200 3600 50  0001 C CNN
F 3 "" H 1200 3600 50  0001 C CNN
	1    1200 3600
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR029
U 1 1 58D4A0E6
P 1400 3000
F 0 "#PWR029" H 1400 2850 50  0001 C CNN
F 1 "VCC" H 1400 3150 50  0000 C CNN
F 2 "" H 1400 3000 50  0001 C CNN
F 3 "" H 1400 3000 50  0001 C CNN
	1    1400 3000
	1    0    0    -1  
$EndComp
Text HLabel 4900 4400 0    60   Input ~ 0
RVRS-
Text HLabel 5800 4500 2    60   Input ~ 0
FRWD-
Text GLabel 1200 3600 1    60   UnSpc ~ 0
GND
Text GLabel 1200 3000 3    60   UnSpc ~ 0
2V8
Text GLabel 1400 3000 3    60   UnSpc ~ 0
VCC
$Comp
L USB_OTG J2
U 1 1 58D37984
P 3300 3300
F 0 "J2" H 3625 3175 50  0000 C CNN
F 1 "USB_OTG" H 3300 3500 50  0000 C CNN
F 2 "Connectors_Molex:USB_Micro-B_Molex_47346-0001" V 3250 3200 50  0001 C CNN
F 3 "" V 3250 3200 50  0001 C CNN
	1    3300 3300
	0    1    1    0   
$EndComp
$Comp
L GND #PWR030
U 1 1 58D37A7C
P 3400 3700
F 0 "#PWR030" H 3400 3450 50  0001 C CNN
F 1 "GND" H 3400 3550 50  0000 C CNN
F 2 "" H 3400 3700 50  0001 C CNN
F 3 "" H 3400 3700 50  0001 C CNN
	1    3400 3700
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X16 J3
U 1 1 58D7F76B
P 8300 2650
F 0 "J3" H 8300 3500 50  0000 C CNN
F 1 "PIN[1..16]" V 8400 2650 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x16_Pitch2.00mm" H 8300 2650 50  0001 C CNN
F 3 "" H 8300 2650 50  0001 C CNN
	1    8300 2650
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X16 J4
U 1 1 58D7F828
P 8300 4250
F 0 "J4" H 8300 5100 50  0000 C CNN
F 1 "PIN[17..32]" V 8400 4250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x16_Pitch2.00mm" H 8300 4250 50  0001 C CNN
F 3 "" H 8300 4250 50  0001 C CNN
	1    8300 4250
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X16 J5
U 1 1 58D7F878
P 8900 4250
F 0 "J5" H 8900 5100 50  0000 C CNN
F 1 "PIN[49..64]" V 9000 4250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x16_Pitch2.00mm" H 8900 4250 50  0001 C CNN
F 3 "" H 8900 4250 50  0001 C CNN
	1    8900 4250
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X16 J6
U 1 1 58D7F8C5
P 8900 2650
F 0 "J6" H 8900 3500 50  0000 C CNN
F 1 "PIN[33..48]" V 9000 2650 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x16_Pitch2.00mm" H 8900 2650 50  0001 C CNN
F 3 "" H 8900 2650 50  0001 C CNN
	1    8900 2650
	-1   0    0    1   
$EndComp
Text Label 7800 2000 0    60   ~ 0
PC13
Text Label 7800 2100 0    60   ~ 0
PC14
Text Label 7800 2200 0    60   ~ 0
PC15
Text Label 7800 2500 0    60   ~ 0
NRST
Text Label 7800 2600 0    60   ~ 0
PC0
Text Label 7800 2700 0    60   ~ 0
PC1
Text Label 7800 2800 0    60   ~ 0
PC2
Text Label 7800 2900 0    60   ~ 0
PC3
Text Label 7800 1900 0    60   ~ 0
VBAT
Text Label 7800 3200 0    60   ~ 0
PA0
Text Label 7800 3300 0    60   ~ 0
PA1
Text Label 7800 3400 0    60   ~ 0
PA2
Text Label 7800 3500 0    60   ~ 0
PA3
Text Label 7800 3800 0    60   ~ 0
PA4
Text Label 7800 3900 0    60   ~ 0
PA5
Text Label 7800 4000 0    60   ~ 0
PA6
Text Label 7800 4100 0    60   ~ 0
PA7
Text Label 7800 4400 0    60   ~ 0
PB0
Text Label 7800 4500 0    60   ~ 0
PB1
Text Label 7800 4600 0    60   ~ 0
PB2
Text Label 7800 4700 0    60   ~ 0
PB10
Text Label 7800 4800 0    60   ~ 0
PB11
Text Label 9400 5000 2    60   ~ 0
PB12
Text Label 9400 4900 2    60   ~ 0
PB13
Text Label 9400 4800 2    60   ~ 0
PB14
Text Label 9400 4700 2    60   ~ 0
PB15
Text Label 9400 4600 2    60   ~ 0
PC6
Text Label 9400 4500 2    60   ~ 0
PC7
Text Label 9400 4400 2    60   ~ 0
PC8
Text Label 9400 4300 2    60   ~ 0
PC9
Text Label 9400 4200 2    60   ~ 0
PA8
Text Label 9400 4100 2    60   ~ 0
PA9
Text Label 9400 4000 2    60   ~ 0
PA10
Text Label 9400 3900 2    60   ~ 0
PA11
Text Label 9400 3800 2    60   ~ 0
PA12
Text Label 9400 3700 2    60   ~ 0
PA13
Text Label 9400 3400 2    60   ~ 0
PA14
Text Label 9400 3300 2    60   ~ 0
PA15
Text Label 9400 3200 2    60   ~ 0
PC10
Text Label 9400 3100 2    60   ~ 0
PC11
Text Label 9400 3000 2    60   ~ 0
PC12
Text Label 9400 2900 2    60   ~ 0
PD2
Text Label 9400 2800 2    60   ~ 0
PB3
Text Label 9400 2700 2    60   ~ 0
PB4
Text Label 9400 2600 2    60   ~ 0
PB5
Text Label 9400 2500 2    60   ~ 0
PB6
Text Label 9400 2400 2    60   ~ 0
PB7
Text Label 9400 2300 2    60   ~ 0
BOOT0
Text Label 9400 2200 2    60   ~ 0
PB8
Text Label 9400 2100 2    60   ~ 0
PB9
$Comp
L CONN_02X04 J7
U 1 1 58D85E8E
P 5350 4450
F 0 "J7" H 5350 4700 50  0000 C CNN
F 1 "TRAIN" H 5350 4200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x04_Pitch2.54mm_SMD" H 5350 3250 50  0001 C CNN
F 3 "" H 5350 3250 50  0001 C CNN
	1    5350 4450
	1    0    0    -1  
$EndComp
Text Label 5000 4300 0    60   ~ 0
M+
Text Label 5700 4300 2    60   ~ 0
T+
Text Label 5000 4400 0    60   ~ 0
R-
Text Label 5700 4400 2    60   ~ 0
Io
Text Label 5700 4500 2    60   ~ 0
F-
Text Label 5000 4600 0    60   ~ 0
T-
Text Label 5700 4600 2    60   ~ 0
M-
$Comp
L GND #PWR031
U 1 1 58D9B974
P 7400 3800
F 0 "#PWR031" H 7400 3550 50  0001 C CNN
F 1 "GND" H 7400 3650 50  0000 C CNN
F 2 "" H 7400 3800 50  0001 C CNN
F 3 "" H 7400 3800 50  0001 C CNN
	1    7400 3800
	1    0    0    -1  
$EndComp
$Comp
L +2V8 #PWR032
U 1 1 58D9BBDA
P 9800 3400
F 0 "#PWR032" H 9800 3250 50  0001 C CNN
F 1 "+2V8" H 9800 3540 50  0000 C CNN
F 2 "" H 9800 3400 50  0001 C CNN
F 3 "" H 9800 3400 50  0001 C CNN
	1    9800 3400
	1    0    0    -1  
$EndComp
Text Label 2600 3100 0    60   ~ 0
USB_VBUS
Text Label 2600 3200 0    60   ~ 0
USB_D-
Text Label 2600 3300 0    60   ~ 0
USB_D+
Text Label 2600 3400 0    60   ~ 0
USB_ID
Text Label 4900 3100 2    60   ~ 0
JTAG_TMS
Text Label 4900 3200 2    60   ~ 0
JTAG_TCK
Text Label 4900 3300 2    60   ~ 0
JTAG_TDO
Text Label 4900 3400 2    60   ~ 0
JTAG_TDI
Text Label 4900 3500 2    60   ~ 0
JTAG_RST
Wire Wire Line
	2900 3500 2900 3700
Wire Wire Line
	3000 3500 2900 3500
Wire Wire Line
	3000 3100 2600 3100
Wire Wire Line
	3900 4300 3900 4200
Wire Wire Line
	4000 4300 3900 4300
Wire Wire Line
	2900 4300 2900 4200
Wire Wire Line
	3000 4300 2900 4300
Wire Wire Line
	3900 4600 3900 4700
Wire Wire Line
	4000 4600 3900 4600
Wire Wire Line
	2900 4600 2900 4700
Wire Wire Line
	3000 4600 2900 4600
Wire Wire Line
	3900 3100 4000 3100
Connection ~ 3900 3300
Wire Wire Line
	4000 3200 3900 3200
Connection ~ 3900 3400
Wire Wire Line
	4000 3300 3900 3300
Connection ~ 3900 3500
Wire Wire Line
	3900 3400 4000 3400
Wire Wire Line
	3900 3200 3900 3700
Wire Wire Line
	3900 3500 4000 3500
Wire Wire Line
	3900 3000 3900 3100
Wire Wire Line
	8100 1900 7800 1900
Wire Wire Line
	8100 2000 7800 2000
Wire Wire Line
	8100 2100 7800 2100
Wire Wire Line
	8100 2200 7800 2200
Wire Wire Line
	8100 2300 7800 2300
Wire Wire Line
	8100 2400 7800 2400
Wire Wire Line
	8100 2500 7800 2500
Wire Wire Line
	8100 2600 7800 2600
Wire Wire Line
	8100 2700 7800 2700
Wire Wire Line
	8100 2800 7800 2800
Wire Wire Line
	8100 2900 7800 2900
Wire Wire Line
	8100 3000 7800 3000
Wire Wire Line
	8100 3100 7800 3100
Wire Wire Line
	8100 3200 7800 3200
Wire Wire Line
	8100 3300 7800 3300
Wire Wire Line
	8100 3400 7800 3400
Wire Wire Line
	8100 3500 7800 3500
Wire Wire Line
	8100 3600 7400 3600
Wire Wire Line
	8100 3700 7800 3700
Wire Wire Line
	8100 3800 7800 3800
Wire Wire Line
	8100 3900 7800 3900
Wire Wire Line
	8100 4000 7800 4000
Wire Wire Line
	8100 4100 7800 4100
Wire Wire Line
	8100 4400 7800 4400
Wire Wire Line
	8100 4500 7800 4500
Wire Wire Line
	8100 4600 7800 4600
Wire Wire Line
	8100 4700 7800 4700
Wire Wire Line
	8100 4800 7800 4800
Wire Wire Line
	8100 4900 7800 4900
Wire Wire Line
	8100 5000 7800 5000
Wire Wire Line
	9100 5000 9400 5000
Wire Wire Line
	9100 4900 9400 4900
Wire Wire Line
	9100 4800 9400 4800
Wire Wire Line
	9100 4700 9400 4700
Wire Wire Line
	9100 4600 9400 4600
Wire Wire Line
	9100 4500 9400 4500
Wire Wire Line
	9100 4400 9400 4400
Wire Wire Line
	9100 4300 9400 4300
Wire Wire Line
	9100 4200 9400 4200
Wire Wire Line
	9100 4100 9400 4100
Wire Wire Line
	9100 4000 9400 4000
Wire Wire Line
	9100 3900 9400 3900
Wire Wire Line
	9100 3800 9400 3800
Wire Wire Line
	9100 3700 9400 3700
Wire Wire Line
	9100 3600 9800 3600
Wire Wire Line
	9100 3500 9400 3500
Wire Wire Line
	9100 3400 9400 3400
Wire Wire Line
	9100 3300 9400 3300
Wire Wire Line
	9100 3200 9400 3200
Wire Wire Line
	9100 3100 9400 3100
Wire Wire Line
	9100 3000 9400 3000
Wire Wire Line
	9100 2900 9400 2900
Wire Wire Line
	9100 2800 9400 2800
Wire Wire Line
	9100 2700 9400 2700
Wire Wire Line
	9100 2600 9400 2600
Wire Wire Line
	9100 2500 9400 2500
Wire Wire Line
	9100 2400 9400 2400
Wire Wire Line
	9100 2300 9400 2300
Wire Wire Line
	9100 2200 9400 2200
Wire Wire Line
	9100 2100 9400 2100
Wire Wire Line
	9100 2000 9400 2000
Wire Wire Line
	9100 1900 9400 1900
Wire Wire Line
	5100 4300 4900 4300
Wire Wire Line
	5600 4300 5800 4300
Wire Wire Line
	5100 4500 4900 4500
Wire Wire Line
	5600 4400 5800 4400
Wire Wire Line
	5600 4500 5800 4500
Wire Wire Line
	5100 4400 4900 4400
Wire Wire Line
	5100 4600 4900 4600
Wire Wire Line
	5600 4600 5800 4600
Wire Wire Line
	2600 3200 3000 3200
Wire Wire Line
	2600 3300 3000 3300
Wire Wire Line
	2600 3400 3000 3400
Wire Wire Line
	3900 4400 4000 4400
Wire Wire Line
	3900 4500 4000 4500
Wire Wire Line
	2900 4400 3000 4400
Wire Wire Line
	2900 4500 3000 4500
Wire Wire Line
	4500 3100 4900 3100
Wire Wire Line
	4500 3200 4900 3200
Wire Wire Line
	4500 3300 4900 3300
Wire Wire Line
	4500 3400 4900 3400
Wire Wire Line
	4500 3500 4900 3500
Wire Wire Line
	7400 3600 7400 3800
Wire Wire Line
	9800 3600 9800 3400
Text GLabel 7800 2600 0    60   BiDi ~ 0
PC0
Text GLabel 7800 2700 0    60   BiDi ~ 0
PC1
Text GLabel 7800 2800 0    60   BiDi ~ 0
PC2
Text GLabel 7800 2900 0    60   BiDi ~ 0
PC3
Text GLabel 7800 4200 0    60   BiDi ~ 0
PC4
Text GLabel 7800 4300 0    60   BiDi ~ 0
PC5
Text GLabel 9400 4600 2    60   BiDi ~ 0
PC6
Text GLabel 9400 4500 2    60   BiDi ~ 0
PC7
Text GLabel 9400 4400 2    60   BiDi ~ 0
PC8
Text GLabel 9400 4300 2    60   BiDi ~ 0
PC9
Text GLabel 9400 3200 2    60   BiDi ~ 0
PC10
Text GLabel 9400 3100 2    60   BiDi ~ 0
PC11
Text GLabel 9400 3000 2    60   BiDi ~ 0
PC12
Text GLabel 7800 2000 0    60   BiDi ~ 0
PC13
Text GLabel 7800 2100 0    60   BiDi ~ 0
PC14
Text GLabel 7800 2200 0    60   BiDi ~ 0
PC15
Text GLabel 4900 3500 2    60   BiDi ~ 0
NRST
Wire Wire Line
	8100 4300 7800 4300
Wire Wire Line
	8100 4200 7800 4200
Text Label 7800 4300 0    60   ~ 0
PC5
Text Label 7800 4200 0    60   ~ 0
PC4
Text GLabel 4900 3200 2    60   BiDi ~ 0
PA14
Text GLabel 4900 3300 2    60   BiDi ~ 0
PB3
Text GLabel 4900 3400 2    60   BiDi ~ 0
PA15
Text GLabel 4900 3100 2    60   BiDi ~ 0
PA13
Text GLabel 2600 3100 0    60   BiDi ~ 0
PA9
Text GLabel 2600 3200 0    60   BiDi ~ 0
PA10
Text GLabel 2600 3300 0    60   BiDi ~ 0
PA11
Text GLabel 2600 3400 0    60   BiDi ~ 0
PA12
Text GLabel 7800 3200 0    60   BiDi ~ 0
PA0
Text GLabel 7800 3300 0    60   BiDi ~ 0
PA1
Text GLabel 7800 3400 0    60   BiDi ~ 0
PA2
Text GLabel 7800 3500 0    60   BiDi ~ 0
PA3
Text GLabel 7800 3800 0    60   BiDi ~ 0
PA4
Text GLabel 7800 3900 0    60   BiDi ~ 0
PA5
Text GLabel 7800 4000 0    60   BiDi ~ 0
PA6
Text GLabel 7800 4100 0    60   BiDi ~ 0
PA7
Text GLabel 9400 4200 2    60   BiDi ~ 0
PA8
Text GLabel 9400 4100 2    60   BiDi ~ 0
PA9
Text GLabel 9400 4000 2    60   BiDi ~ 0
PA10
Text GLabel 9400 3900 2    60   BiDi ~ 0
PA11
Text GLabel 9400 3800 2    60   BiDi ~ 0
PA12
Text GLabel 9400 3700 2    60   BiDi ~ 0
PA13
Text GLabel 9400 3400 2    60   BiDi ~ 0
PA14
Text GLabel 9400 3300 2    60   BiDi ~ 0
PA15
Text GLabel 9400 4700 2    60   BiDi ~ 0
PB15
Text GLabel 9400 4800 2    60   BiDi ~ 0
PB14
Text GLabel 9400 4900 2    60   BiDi ~ 0
PB13
Text GLabel 9400 5000 2    60   BiDi ~ 0
PB12
Text GLabel 7800 4800 0    60   BiDi ~ 0
PB11
Text GLabel 7800 4700 0    60   BiDi ~ 0
PB10
Text GLabel 9400 2100 2    60   BiDi ~ 0
PB9
Text GLabel 9400 2200 2    60   BiDi ~ 0
PB8
Text GLabel 9400 2400 2    60   BiDi ~ 0
PB7
Text GLabel 9400 2500 2    60   BiDi ~ 0
PB6
Text GLabel 9400 2600 2    60   BiDi ~ 0
PB5
Text GLabel 9400 2700 2    60   BiDi ~ 0
PB4
Text GLabel 9400 2800 2    60   BiDi ~ 0
PB3
Text GLabel 7800 4600 0    60   BiDi ~ 0
PB2
Text GLabel 7800 4500 0    60   BiDi ~ 0
PB1
Text GLabel 7800 4400 0    60   BiDi ~ 0
PB0
Text GLabel 7800 1900 0    60   UnSpc ~ 0
VBAT
Text GLabel 7800 2500 0    60   BiDi ~ 0
NRST
Text GLabel 9400 2300 2    60   Input ~ 0
BOOT0
Text GLabel 9400 2900 2    60   BiDi ~ 0
PD2
Text GLabel 5800 4300 2    60   UnSpc ~ 0
RAIL_R
Text GLabel 4900 4600 0    60   UnSpc ~ 0
RAIL_L
$EndSCHEMATC
