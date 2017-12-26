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
Sheet 1 2
Title "Locomotive"
Date "2017-03-30"
Rev "1.0"
Comp "ECE 445"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L GND #PWR01
U 1 1 58ACE876
P 5400 5200
F 0 "#PWR01" H 5400 4950 50  0001 C CNN
F 1 "GND" H 5400 5050 50  0000 C CNN
F 2 "" H 5400 5200 50  0000 C CNN
F 3 "" H 5400 5200 50  0000 C CNN
	1    5400 5200
	1    0    0    -1  
$EndComp
$Comp
L M95512-RDW6TP U2
U 1 1 58D0FC09
P 5000 3800
F 0 "U2" H 4750 4050 60  0000 C CNN
F 1 "M95512-RDW6TP" H 5450 4050 60  0000 C CNN
F 2 "Housings_SSOP:TSSOP-8_4.4x3mm_Pitch0.65mm" H 5000 3800 60  0001 C CNN
F 3 "" H 5000 3800 60  0001 C CNN
	1    5000 3800
	1    0    0    -1  
$EndComp
Text Label 4400 3900 0    60   ~ 0
NSS
Text Label 5600 3700 2    60   ~ 0
SCK
Text Label 5600 3900 2    60   ~ 0
MISO
Text Label 5600 3800 2    60   ~ 0
MOSI
$Comp
L +2V8 #PWR02
U 1 1 58D0FC14
P 5000 3300
F 0 "#PWR02" H 5000 3150 50  0001 C CNN
F 1 "+2V8" H 5000 3440 50  0000 C CNN
F 2 "" H 5000 3300 50  0001 C CNN
F 3 "" H 5000 3300 50  0001 C CNN
	1    5000 3300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 58D0FC1A
P 5000 4100
F 0 "#PWR03" H 5000 3850 50  0001 C CNN
F 1 "GND" H 5000 3950 50  0000 C CNN
F 2 "" H 5000 4100 50  0001 C CNN
F 3 "" H 5000 4100 50  0001 C CNN
	1    5000 4100
	1    0    0    -1  
$EndComp
Text Label 5600 4900 2    60   ~ 0
DCC
$Comp
L R_Small R10
U 1 1 58D3BFC4
P 4300 3550
F 0 "R10" H 4330 3570 50  0000 L CNN
F 1 "10k" H 4330 3510 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" H 4300 3550 50  0001 C CNN
F 3 "" H 4300 3550 50  0001 C CNN
	1    4300 3550
	1    0    0    -1  
$EndComp
$Comp
L R_Small R11
U 1 1 58D3C27D
P 4500 3550
F 0 "R11" H 4530 3570 50  0000 L CNN
F 1 "10k" H 4530 3510 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" H 4500 3550 50  0001 C CNN
F 3 "" H 4500 3550 50  0001 C CNN
	1    4500 3550
	1    0    0    -1  
$EndComp
$Comp
L TLP291 U7
U 1 1 58D8ABF7
P 5000 5000
F 0 "U7" H 4800 5200 50  0000 L CNN
F 1 "TLP293" H 5000 5200 50  0000 L CNN
F 2 "Housings_SSOP:SOP-4_4.4x2.8mm_Pitch1.27mm" H 4800 4800 50  0001 L CIN
F 3 "" H 5000 5000 50  0001 L CNN
	1    5000 5000
	1    0    0    -1  
$EndComp
$Comp
L +2V8 #PWR04
U 1 1 58D9AF11
P 5400 4600
F 0 "#PWR04" H 5400 4450 50  0001 C CNN
F 1 "+2V8" H 5400 4740 50  0000 C CNN
F 2 "" H 5400 4600 50  0001 C CNN
F 3 "" H 5400 4600 50  0001 C CNN
	1    5400 4600
	1    0    0    -1  
$EndComp
Text GLabel 10400 6200 3    60   UnSpc ~ 0
GND
Text GLabel 10400 5600 1    60   UnSpc ~ 0
2V8
$Comp
L GND #PWR05
U 1 1 58DB4339
P 8600 6200
F 0 "#PWR05" H 8600 5950 50  0001 C CNN
F 1 "GND" H 8600 6050 50  0000 C CNN
F 2 "" H 8600 6200 50  0001 C CNN
F 3 "" H 8600 6200 50  0001 C CNN
	1    8600 6200
	1    0    0    -1  
$EndComp
$Comp
L R_Small R12
U 1 1 58DB433F
P 8600 6000
F 0 "R12" H 8630 6020 50  0000 L CNN
F 1 "10k" H 8630 5960 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" H 8600 6000 50  0001 C CNN
F 3 "" H 8600 6000 50  0001 C CNN
	1    8600 6000
	1    0    0    -1  
$EndComp
$Comp
L C_Small C13
U 1 1 58DB4346
P 10400 5900
F 0 "C13" H 10410 5970 50  0000 L CNN
F 1 "2u2" H 10410 5820 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 10400 5900 50  0001 C CNN
F 3 "" H 10400 5900 50  0001 C CNN
	1    10400 5900
	1    0    0    -1  
$EndComp
$Comp
L SPX3819M5 U5
U 1 1 58DB435A
P 9600 5800
F 0 "U5" H 9350 6050 60  0000 C CNN
F 1 "SPX3819M5" H 9700 6050 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5" H 9600 6050 60  0001 C CNN
F 3 "" H 9600 6050 60  0001 C CNN
	1    9600 5800
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR06
U 1 1 58DB4389
P 8600 5600
F 0 "#PWR06" H 8600 5450 50  0001 C CNN
F 1 "+5V" H 8600 5740 50  0000 C CNN
F 2 "" H 8600 5600 50  0001 C CNN
F 3 "" H 8600 5600 50  0001 C CNN
	1    8600 5600
	1    0    0    -1  
$EndComp
$Comp
L D_Small D2
U 1 1 58DB4390
P 8850 5700
F 0 "D2" H 8800 5780 50  0000 L CNN
F 1 "CUS08F30" H 8700 5620 50  0000 L CNN
F 2 "Diodes_SMD:D_SOD-323" V 8850 5700 50  0001 C CNN
F 3 "" V 8850 5700 50  0001 C CNN
	1    8850 5700
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR07
U 1 1 58DB439A
P 10400 4500
F 0 "#PWR07" H 10400 4350 50  0001 C CNN
F 1 "VCC" H 10400 4650 50  0000 C CNN
F 2 "" H 10400 4500 50  0001 C CNN
F 3 "" H 10400 4500 50  0001 C CNN
	1    10400 4500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 58DB43A0
P 10400 5100
F 0 "#PWR08" H 10400 4850 50  0001 C CNN
F 1 "GND" H 10400 4950 50  0000 C CNN
F 2 "" H 10400 5100 50  0001 C CNN
F 3 "" H 10400 5100 50  0001 C CNN
	1    10400 5100
	1    0    0    -1  
$EndComp
$Comp
L D_Bridge_+-AA D1
U 1 1 58DB43A6
P 10400 4800
F 0 "D1" H 10450 5075 50  0000 L CNN
F 1 "CDBHM240L-HF" H 10450 5000 50  0000 L CNN
F 2 "bcan:TO-269AA" H 10400 4800 50  0001 C CNN
F 3 "" H 10400 4800 50  0001 C CNN
	1    10400 4800
	0    -1   -1   0   
$EndComp
$Comp
L VCC #PWR09
U 1 1 58DB43AD
P 9100 5600
F 0 "#PWR09" H 9100 5450 50  0001 C CNN
F 1 "VCC" H 9100 5750 50  0000 C CNN
F 2 "" H 9100 5600 50  0001 C CNN
F 3 "" H 9100 5600 50  0001 C CNN
	1    9100 5600
	1    0    0    -1  
$EndComp
$Comp
L +2V8 #PWR010
U 1 1 58DB43B3
P 10100 5600
F 0 "#PWR010" H 10100 5450 50  0001 C CNN
F 1 "+2V8" H 10100 5740 50  0000 C CNN
F 2 "" H 10100 5600 50  0001 C CNN
F 3 "" H 10100 5600 50  0001 C CNN
	1    10100 5600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR011
U 1 1 58DB43B9
P 10100 6200
F 0 "#PWR011" H 10100 5950 50  0001 C CNN
F 1 "GND" H 10100 6050 50  0000 C CNN
F 2 "" H 10100 6200 50  0001 C CNN
F 3 "" H 10100 6200 50  0001 C CNN
	1    10100 6200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 58DB43BF
P 9600 6200
F 0 "#PWR012" H 9600 5950 50  0001 C CNN
F 1 "GND" H 9600 6050 50  0000 C CNN
F 2 "" H 9600 6200 50  0001 C CNN
F 3 "" H 9600 6200 50  0001 C CNN
	1    9600 6200
	1    0    0    -1  
$EndComp
$Comp
L R_Small R14
U 1 1 58DB43C5
P 10100 6000
F 0 "R14" H 10130 6020 50  0000 L CNN
F 1 "26k1" H 10130 5960 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" H 10100 6000 50  0001 C CNN
F 3 "" H 10100 6000 50  0001 C CNN
	1    10100 6000
	1    0    0    -1  
$EndComp
$Comp
L R_Small R13
U 1 1 58DB43CC
P 10100 5800
F 0 "R13" H 10130 5820 50  0000 L CNN
F 1 "33k2" H 10130 5760 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" H 10100 5800 50  0001 C CNN
F 3 "" H 10100 5800 50  0001 C CNN
	1    10100 5800
	1    0    0    -1  
$EndComp
Text GLabel 10100 4800 0    60   UnSpc ~ 0
RAIL_R
Text GLabel 10700 4800 2    60   UnSpc ~ 0
RAIL_L
$Comp
L R_Small R16
U 1 1 58DB8F64
P 9200 3300
F 0 "R16" H 9230 3320 50  0000 L CNN
F 1 "1k" H 9230 3260 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" H 9200 3300 50  0001 C CNN
F 3 "" H 9200 3300 50  0001 C CNN
	1    9200 3300
	0    1    1    0   
$EndComp
$Comp
L R_Small R15
U 1 1 58DB8F6B
P 9200 1700
F 0 "R15" H 9230 1720 50  0000 L CNN
F 1 "1k" H 9230 1660 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" H 9200 1700 50  0001 C CNN
F 3 "" H 9200 1700 50  0001 C CNN
	1    9200 1700
	0    1    1    0   
$EndComp
$Comp
L R_Small R18
U 1 1 58DB8F74
P 9600 2800
F 0 "R18" H 9630 2820 50  0000 L CNN
F 1 "100" H 9630 2760 50  0000 L CNN
F 2 "Resistors_SMD:R_2512" H 9600 2800 50  0001 C CNN
F 3 "" H 9600 2800 50  0001 C CNN
	1    9600 2800
	1    0    0    -1  
$EndComp
$Comp
L R_Small R17
U 1 1 58DB8F7B
P 9600 1200
F 0 "R17" H 9630 1220 50  0000 L CNN
F 1 "100" H 9630 1160 50  0000 L CNN
F 2 "Resistors_SMD:R_2512" H 9600 1200 50  0001 C CNN
F 3 "" H 9600 1200 50  0001 C CNN
	1    9600 1200
	1    0    0    -1  
$EndComp
$Comp
L Q_NPN_BEC Q2
U 1 1 58DB8F88
P 9500 3300
F 0 "Q2" H 9700 3350 50  0000 L CNN
F 1 "MMBT2222A" H 9700 3250 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 9700 3400 50  0001 C CNN
F 3 "" H 9500 3300 50  0001 C CNN
	1    9500 3300
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR013
U 1 1 58DB8F8F
P 9600 2500
F 0 "#PWR013" H 9600 2350 50  0001 C CNN
F 1 "VCC" H 9600 2650 50  0000 C CNN
F 2 "" H 9600 2500 50  0001 C CNN
F 3 "" H 9600 2500 50  0001 C CNN
	1    9600 2500
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR014
U 1 1 58DB8F95
P 9600 900
F 0 "#PWR014" H 9600 750 50  0001 C CNN
F 1 "VCC" H 9600 1050 50  0000 C CNN
F 2 "" H 9600 900 50  0001 C CNN
F 3 "" H 9600 900 50  0001 C CNN
	1    9600 900 
	1    0    0    -1  
$EndComp
$Comp
L Q_NPN_BEC Q1
U 1 1 58DB8F9B
P 9500 1700
F 0 "Q1" H 9700 1750 50  0000 L CNN
F 1 "MMBT2222A" H 9700 1650 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 9700 1800 50  0001 C CNN
F 3 "" H 9500 1700 50  0001 C CNN
	1    9500 1700
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR015
U 1 1 58DB8FA4
P 10400 2500
F 0 "#PWR015" H 10400 2350 50  0001 C CNN
F 1 "VCC" H 10400 2650 50  0000 C CNN
F 2 "" H 10400 2500 50  0001 C CNN
F 3 "" H 10400 2500 50  0001 C CNN
	1    10400 2500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR016
U 1 1 58DB8FAA
P 10400 1900
F 0 "#PWR016" H 10400 1650 50  0001 C CNN
F 1 "GND" H 10400 1750 50  0000 C CNN
F 2 "" H 10400 1900 50  0001 C CNN
F 3 "" H 10400 1900 50  0001 C CNN
	1    10400 1900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR017
U 1 1 58DB8FB0
P 9600 1900
F 0 "#PWR017" H 9600 1650 50  0001 C CNN
F 1 "GND" H 9600 1750 50  0000 C CNN
F 2 "" H 9600 1900 50  0001 C CNN
F 3 "" H 9600 1900 50  0001 C CNN
	1    9600 1900
	1    0    0    -1  
$EndComp
$Comp
L Q_DUAL_NMOS_PMOS_G1S2G2D2S1D1 Q4
U 1 1 58DB8FD1
P 10300 3300
F 0 "Q4" H 10500 3350 50  0000 L CNN
F 1 "DMG6601LVT" H 10500 3250 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-6" H 10500 3400 50  0001 C CNN
F 3 "" H 10300 3300 50  0001 C CNN
	1    10300 3300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR018
U 1 1 58DB8FD8
P 10400 3500
F 0 "#PWR018" H 10400 3250 50  0001 C CNN
F 1 "GND" H 10400 3350 50  0000 C CNN
F 2 "" H 10400 3500 50  0001 C CNN
F 3 "" H 10400 3500 50  0001 C CNN
	1    10400 3500
	1    0    0    -1  
$EndComp
$Comp
L Q_DUAL_NMOS_PMOS_G1S2G2D2S1D1 Q3
U 1 1 58DB8FE5
P 10300 1700
F 0 "Q3" H 10500 1750 50  0000 L CNN
F 1 "DMG6601LVT" H 10500 1650 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-6" H 10500 1800 50  0001 C CNN
F 3 "" H 10300 1700 50  0001 C CNN
	1    10300 1700
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR019
U 1 1 58DB8FF2
P 10400 900
F 0 "#PWR019" H 10400 750 50  0001 C CNN
F 1 "VCC" H 10400 1050 50  0000 C CNN
F 2 "" H 10400 900 50  0001 C CNN
F 3 "" H 10400 900 50  0001 C CNN
	1    10400 900 
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR020
U 1 1 58DB8FFE
P 9600 3500
F 0 "#PWR020" H 9600 3250 50  0001 C CNN
F 1 "GND" H 9600 3350 50  0000 C CNN
F 2 "" H 9600 3500 50  0001 C CNN
F 3 "" H 9600 3500 50  0001 C CNN
	1    9600 3500
	1    0    0    -1  
$EndComp
Text GLabel 10500 1400 2    60   Output ~ 0
MOT+
Text GLabel 10500 3000 2    60   Output ~ 0
MOT-
Text GLabel 8800 1700 0    60   BiDi ~ 0
PB8
Text GLabel 8800 3300 0    60   BiDi ~ 0
PB9
Text Label 8800 1700 0    60   ~ 0
PWM_A
Text Label 8800 3300 0    60   ~ 0
PWM_B
$Comp
L CONN_02X05 J3
U 1 1 58DBEE2C
P 3350 6100
F 0 "J3" H 3350 6400 50  0000 C CNN
F 1 "JTAG" H 3350 5800 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x05_Pitch1.27mm_SMD" H 3350 4900 50  0001 C CNN
F 3 "" H 3350 4900 50  0001 C CNN
	1    3350 6100
	1    0    0    -1  
$EndComp
$Comp
L +2V8 #PWR021
U 1 1 58DBEE33
P 3000 5800
F 0 "#PWR021" H 3000 5650 50  0001 C CNN
F 1 "+2V8" H 3000 5940 50  0000 C CNN
F 2 "" H 3000 5800 50  0001 C CNN
F 3 "" H 3000 5800 50  0001 C CNN
	1    3000 5800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR022
U 1 1 58DBEE39
P 3000 6500
F 0 "#PWR022" H 3000 6250 50  0001 C CNN
F 1 "GND" H 3000 6350 50  0000 C CNN
F 2 "" H 3000 6500 50  0001 C CNN
F 3 "" H 3000 6500 50  0001 C CNN
	1    3000 6500
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X04 J8
U 1 1 58DBEE3F
P 4900 7250
F 0 "J8" H 4900 7500 50  0000 C CNN
F 1 "IR" V 5000 7250 50  0000 C CNN
F 2 "Connectors_JST:JST_GH_BM04B-GHS-TBT_04x1.25mm_Straight" H 4900 7250 50  0001 C CNN
F 3 "" H 4900 7250 50  0001 C CNN
	1    4900 7250
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X04 J9
U 1 1 58DBEE46
P 6700 7250
F 0 "J9" H 6700 7500 50  0000 C CNN
F 1 "TOF" V 6800 7250 50  0000 C CNN
F 2 "Connectors_JST:JST_GH_SM04B-GHS-TB_04x1.25mm_Angled" H 6700 7250 50  0001 C CNN
F 3 "" H 6700 7250 50  0001 C CNN
	1    6700 7250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR023
U 1 1 58DBEE4D
P 5400 6500
F 0 "#PWR023" H 5400 6250 50  0001 C CNN
F 1 "GND" H 5400 6350 50  0000 C CNN
F 2 "" H 5400 6500 50  0001 C CNN
F 3 "" H 5400 6500 50  0001 C CNN
	1    5400 6500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR024
U 1 1 58DBEE53
P 4600 7500
F 0 "#PWR024" H 4600 7250 50  0001 C CNN
F 1 "GND" H 4600 7350 50  0000 C CNN
F 2 "" H 4600 7500 50  0001 C CNN
F 3 "" H 4600 7500 50  0001 C CNN
	1    4600 7500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR025
U 1 1 58DBEE59
P 6400 7500
F 0 "#PWR025" H 6400 7250 50  0001 C CNN
F 1 "GND" H 6400 7350 50  0000 C CNN
F 2 "" H 6400 7500 50  0001 C CNN
F 3 "" H 6400 7500 50  0001 C CNN
	1    6400 7500
	1    0    0    -1  
$EndComp
$Comp
L +2V8 #PWR026
U 1 1 58DBEE5F
P 6400 7000
F 0 "#PWR026" H 6400 6850 50  0001 C CNN
F 1 "+2V8" H 6400 7140 50  0000 C CNN
F 2 "" H 6400 7000 50  0001 C CNN
F 3 "" H 6400 7000 50  0001 C CNN
	1    6400 7000
	1    0    0    -1  
$EndComp
$Comp
L +2V8 #PWR027
U 1 1 58DBEE65
P 4600 7000
F 0 "#PWR027" H 4600 6850 50  0001 C CNN
F 1 "+2V8" H 4600 7140 50  0000 C CNN
F 2 "" H 4600 7000 50  0001 C CNN
F 3 "" H 4600 7000 50  0001 C CNN
	1    4600 7000
	1    0    0    -1  
$EndComp
$Comp
L USB_OTG J4
U 1 1 58DBEE72
P 5800 6100
F 0 "J4" H 6125 5975 50  0000 C CNN
F 1 "USB_OTG" H 5800 6300 50  0000 C CNN
F 2 "bcan:USB_Micro-B_Amphenol_10118192" V 5750 6000 50  0001 C CNN
F 3 "" V 5750 6000 50  0001 C CNN
	1    5800 6100
	0    1    1    0   
$EndComp
$Comp
L GND #PWR028
U 1 1 58DBEE79
P 5900 6500
F 0 "#PWR028" H 5900 6250 50  0001 C CNN
F 1 "GND" H 5900 6350 50  0000 C CNN
F 2 "" H 5900 6500 50  0001 C CNN
F 3 "" H 5900 6500 50  0001 C CNN
	1    5900 6500
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X04 J7
U 1 1 58DBEE7F
P 3350 7250
F 0 "J7" H 3350 7500 50  0000 C CNN
F 1 "TRAIN" H 3350 7000 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x04_Pitch2.54mm_SMD" H 3350 6050 50  0001 C CNN
F 3 "" H 3350 6050 50  0001 C CNN
	1    3350 7250
	-1   0    0    -1  
$EndComp
Text Label 3000 7100 0    60   ~ 0
M+
Text Label 3700 7100 2    60   ~ 0
T+
Text Label 3000 7200 0    60   ~ 0
R-
Text Label 3700 7200 2    60   ~ 0
Io
Text Label 3700 7300 2    60   ~ 0
F-
Text Label 3000 7400 0    60   ~ 0
T-
Text Label 3700 7400 2    60   ~ 0
M-
Text Label 5100 6000 0    60   ~ 0
USB_D-
Text Label 5100 6100 0    60   ~ 0
USB_D+
Text Label 5100 6200 0    60   ~ 0
USB_ID
Text Label 4000 5900 2    60   ~ 0
JTAG_TMS
Text Label 4000 6000 2    60   ~ 0
JTAG_TCK
Text Label 4000 6100 2    60   ~ 0
JTAG_TDO
Text Label 4000 6200 2    60   ~ 0
JTAG_TDI
Text Label 4000 6300 2    60   ~ 0
JTAG_RST
Text GLabel 4000 6300 2    60   BiDi ~ 0
NRST
Text GLabel 4000 6000 2    60   BiDi ~ 0
PA14
Text GLabel 4000 6100 2    60   BiDi ~ 0
PB3
Text GLabel 4000 6200 2    60   BiDi ~ 0
PA15
Text GLabel 4000 5900 2    60   BiDi ~ 0
PA13
Text GLabel 5100 6000 0    60   BiDi ~ 0
PA10
Text GLabel 5100 6100 0    60   BiDi ~ 0
PA11
Text GLabel 5100 6200 0    60   BiDi ~ 0
PA12
Text GLabel 3700 7100 2    60   UnSpc ~ 0
RAIL_R
Text GLabel 3000 7400 0    60   UnSpc ~ 0
RAIL_L
Text GLabel 3000 7100 0    60   Output ~ 0
MOT+
Text GLabel 3700 7400 2    60   Output ~ 0
MOT-
$Comp
L Q_DUAL_NMOS_PMOS_G1S2G2D2S1D1 Q3
U 2 1 58DC2A60
P 10300 1100
F 0 "Q3" H 10500 1150 50  0000 L CNN
F 1 "DMG6601LVT" H 10500 1050 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-6" H 10500 1200 50  0001 C CNN
F 3 "" H 10300 1100 50  0001 C CNN
	2    10300 1100
	1    0    0    1   
$EndComp
$Comp
L Q_DUAL_NMOS_PMOS_G1S2G2D2S1D1 Q4
U 2 1 58DC2D2E
P 10300 2700
F 0 "Q4" H 10500 2750 50  0000 L CNN
F 1 "DMG6601LVT" H 10500 2650 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-6" H 10500 2800 50  0001 C CNN
F 3 "" H 10300 2700 50  0001 C CNN
	2    10300 2700
	1    0    0    1   
$EndComp
$Comp
L GND #PWR029
U 1 1 58DC3D0F
P 700 6200
F 0 "#PWR029" H 700 5950 50  0001 C CNN
F 1 "GND" H 700 6050 50  0000 C CNN
F 2 "" H 700 6200 50  0001 C CNN
F 3 "" H 700 6200 50  0001 C CNN
	1    700  6200
	1    0    0    -1  
$EndComp
$Comp
L +2V8 #PWR030
U 1 1 58DC3D15
P 2500 5800
F 0 "#PWR030" H 2500 5650 50  0001 C CNN
F 1 "+2V8" H 2500 5940 50  0000 C CNN
F 2 "" H 2500 5800 50  0001 C CNN
F 3 "" H 2500 5800 50  0001 C CNN
	1    2500 5800
	1    0    0    -1  
$EndComp
Text GLabel 1200 5000 0    60   BiDi ~ 0
PC0
Text GLabel 1200 5100 0    60   BiDi ~ 0
PC1
Text GLabel 1200 5200 0    60   BiDi ~ 0
PC2
Text GLabel 1200 5300 0    60   BiDi ~ 0
PC3
Text GLabel 1200 6600 0    60   BiDi ~ 0
PC4
Text GLabel 1200 6700 0    60   BiDi ~ 0
PC5
Text GLabel 2000 7000 2    60   BiDi ~ 0
PC6
Text GLabel 2000 6900 2    60   BiDi ~ 0
PC7
Text GLabel 2000 6800 2    60   BiDi ~ 0
PC8
Text GLabel 2000 6700 2    60   BiDi ~ 0
PC9
Text GLabel 2000 5600 2    60   BiDi ~ 0
PC10
Text GLabel 2000 5500 2    60   BiDi ~ 0
PC11
Text GLabel 2000 5400 2    60   BiDi ~ 0
PC12
Text GLabel 1200 4400 0    60   BiDi ~ 0
PC13
Text GLabel 1200 4500 0    60   BiDi ~ 0
PC14
Text GLabel 1200 4600 0    60   BiDi ~ 0
PC15
Text GLabel 1200 5600 0    60   BiDi ~ 0
PA0
Text GLabel 1200 5700 0    60   BiDi ~ 0
PA1
Text GLabel 1200 5800 0    60   BiDi ~ 0
PA2
Text GLabel 1200 5900 0    60   BiDi ~ 0
PA3
Text GLabel 1200 6200 0    60   BiDi ~ 0
PA4
Text GLabel 1200 6300 0    60   BiDi ~ 0
PA5
Text GLabel 1200 6400 0    60   BiDi ~ 0
PA6
Text GLabel 1200 6500 0    60   BiDi ~ 0
PA7
Text GLabel 2000 6600 2    60   BiDi ~ 0
PA8
Text GLabel 2000 6500 2    60   BiDi ~ 0
PA9
Text GLabel 2000 6400 2    60   BiDi ~ 0
PA10
Text GLabel 2000 6300 2    60   BiDi ~ 0
PA11
Text GLabel 2000 6200 2    60   BiDi ~ 0
PA12
Text GLabel 2000 6100 2    60   BiDi ~ 0
PA13
Text GLabel 2000 5800 2    60   BiDi ~ 0
PA14
Text GLabel 2000 5700 2    60   BiDi ~ 0
PA15
Text GLabel 2000 7100 2    60   BiDi ~ 0
PB15
Text GLabel 2000 7200 2    60   BiDi ~ 0
PB14
Text GLabel 2000 7300 2    60   BiDi ~ 0
PB13
Text GLabel 2000 7400 2    60   BiDi ~ 0
PB12
Text GLabel 1200 7200 0    60   BiDi ~ 0
PB11
Text GLabel 1200 7100 0    60   BiDi ~ 0
PB10
Text GLabel 2000 4500 2    60   BiDi ~ 0
PB9
Text GLabel 2000 4600 2    60   BiDi ~ 0
PB8
Text GLabel 2000 4800 2    60   BiDi ~ 0
PB7
Text GLabel 2000 4900 2    60   BiDi ~ 0
PB6
Text GLabel 2000 5000 2    60   BiDi ~ 0
PB5
Text GLabel 2000 5100 2    60   BiDi ~ 0
PB4
Text GLabel 2000 5200 2    60   BiDi ~ 0
PB3
Text GLabel 1200 7000 0    60   BiDi ~ 0
PB2
Text GLabel 1200 6900 0    60   BiDi ~ 0
PB1
Text GLabel 1200 6800 0    60   BiDi ~ 0
PB0
Text GLabel 1200 4300 0    60   UnSpc ~ 0
VBAT
Text GLabel 1200 4900 0    60   BiDi ~ 0
NRST
Text GLabel 2000 4700 2    60   Input ~ 0
BOOT0
Text GLabel 2000 5300 2    60   BiDi ~ 0
PD2
Text Label 4500 7200 0    60   ~ 0
IR_R
Text Label 4500 7300 0    60   ~ 0
IR_L
Text Label 6300 7200 0    60   ~ 0
SDA
Text Label 6300 7300 0    60   ~ 0
SCL
Text GLabel 3700 7200 2    60   Input ~ 0
TRAIN_I
Text GLabel 3700 7300 2    60   Output ~ 0
FRONT-
Text GLabel 3000 7200 0    60   Output ~ 0
REAR-
Text GLabel 5700 4900 2    60   BiDi ~ 0
PC13
Text GLabel 4300 4800 0    60   UnSpc ~ 0
RAIL_R
Text GLabel 4300 5200 0    60   UnSpc ~ 0
RAIL_L
$Comp
L R_Small R8
U 1 1 58DCCDB1
P 5500 7100
F 0 "R8" H 5530 7120 50  0000 L CNN
F 1 "4k7" H 5530 7060 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" H 5500 7100 50  0001 C CNN
F 3 "" H 5500 7100 50  0001 C CNN
	1    5500 7100
	1    0    0    -1  
$EndComp
$Comp
L R_Small R9
U 1 1 58DCCDB8
P 5800 7100
F 0 "R9" H 5830 7120 50  0000 L CNN
F 1 "4k7" H 5830 7060 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" H 5800 7100 50  0001 C CNN
F 3 "" H 5800 7100 50  0001 C CNN
	1    5800 7100
	1    0    0    -1  
$EndComp
$Comp
L +2V8 #PWR031
U 1 1 58DCCDBF
P 5800 7000
F 0 "#PWR031" H 5800 6850 50  0001 C CNN
F 1 "+2V8" H 5800 7140 50  0000 C CNN
F 2 "" H 5800 7000 50  0001 C CNN
F 3 "" H 5800 7000 50  0001 C CNN
	1    5800 7000
	1    0    0    -1  
$EndComp
$Comp
L +2V8 #PWR032
U 1 1 58DCCDC7
P 5500 7000
F 0 "#PWR032" H 5500 6850 50  0001 C CNN
F 1 "+2V8" H 5500 7140 50  0000 C CNN
F 2 "" H 5500 7000 50  0001 C CNN
F 3 "" H 5500 7000 50  0001 C CNN
	1    5500 7000
	1    0    0    -1  
$EndComp
Text GLabel 6300 7200 0    60   BiDi ~ 0
PB11
Text GLabel 6300 7300 0    60   BiDi ~ 0
PB10
Text Label 5800 7400 1    60   ~ 0
SDA
Text Label 5500 7400 1    60   ~ 0
SCL
Text GLabel 4500 7200 0    60   BiDi ~ 0
PB0
Text GLabel 4500 7300 0    60   BiDi ~ 0
PB1
$Sheet
S 600  700  900  300 
U 58AFF684
F0 "Controller" 60
F1 "controller.sch" 60
$EndSheet
Text GLabel 4300 3900 0    60   BiDi ~ 0
PB12
Text GLabel 5700 3700 2    60   BiDi ~ 0
PB13
Text GLabel 5700 3900 2    60   BiDi ~ 0
PB14
Text GLabel 5700 3800 2    60   BiDi ~ 0
PB15
$Comp
L R_Small R4
U 1 1 58DD1F77
P 9100 4600
F 0 "R4" H 9130 4620 50  0000 L CNN
F 1 "13k3" H 9130 4560 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" H 9100 4600 50  0001 C CNN
F 3 "" H 9100 4600 50  0001 C CNN
	1    9100 4600
	1    0    0    -1  
$EndComp
$Comp
L R_Small R5
U 1 1 58DD1F7E
P 9100 5000
F 0 "R5" H 9130 5020 50  0000 L CNN
F 1 "2k8" H 9130 4960 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" H 9100 5000 50  0001 C CNN
F 3 "" H 9100 5000 50  0001 C CNN
	1    9100 5000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR033
U 1 1 58DD1F86
P 9100 5100
F 0 "#PWR033" H 9100 4850 50  0001 C CNN
F 1 "GND" H 9100 4950 50  0000 C CNN
F 2 "" H 9100 5100 50  0001 C CNN
F 3 "" H 9100 5100 50  0001 C CNN
	1    9100 5100
	1    0    0    -1  
$EndComp
Text GLabel 9000 4800 0    60   BiDi ~ 0
PC2
$Comp
L VCC #PWR034
U 1 1 58DD28A9
P 9100 4500
F 0 "#PWR034" H 9100 4350 50  0001 C CNN
F 1 "VCC" H 9100 4650 50  0000 C CNN
F 2 "" H 9100 4500 50  0001 C CNN
F 3 "" H 9100 4500 50  0001 C CNN
	1    9100 4500
	1    0    0    -1  
$EndComp
$Comp
L D_Small D3
U 1 1 58DD6534
P 4600 5000
F 0 "D3" H 4550 5080 50  0000 L CNN
F 1 "1N4148" H 4450 4920 50  0000 L CNN
F 2 "Diodes_SMD:D_SOD-523" V 4600 5000 50  0001 C CNN
F 3 "" V 4600 5000 50  0001 C CNN
	1    4600 5000
	0    1    1    0   
$EndComp
$Comp
L R_Small R19
U 1 1 58DD6D5C
P 4400 4800
F 0 "R19" H 4430 4820 50  0000 L CNN
F 1 "1k5" H 4430 4760 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" H 4400 4800 50  0001 C CNN
F 3 "" H 4400 4800 50  0001 C CNN
	1    4400 4800
	0    1    1    0   
$EndComp
$Comp
L R_Small R20
U 1 1 58DD7107
P 5400 4700
F 0 "R20" H 5430 4720 50  0000 L CNN
F 1 "10k" H 5430 4660 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" H 5400 4700 50  0001 C CNN
F 3 "" H 5400 4700 50  0001 C CNN
	1    5400 4700
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X32 J1
U 1 1 58DD89DD
P 1400 5850
F 0 "J1" H 1400 7500 50  0000 C CNN
F 1 "PIN[1..32]" V 1500 5850 50  0000 C CNN
F 2 "bcan:Castellations_1x32_Pitch2.00mm" H 1400 5850 50  0001 C CNN
F 3 "" H 1400 5850 50  0001 C CNN
	1    1400 5850
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X32 J2
U 1 1 58DD8C48
P 1800 5850
F 0 "J2" H 1800 7500 50  0000 C CNN
F 1 "PIN[33..64]" V 1900 5850 50  0000 C CNN
F 2 "bcan:Castellations_1x32_Pitch2.00mm" H 1800 5850 50  0001 C CNN
F 3 "" H 1800 5850 50  0001 C CNN
	1    1800 5850
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X02 J5
U 1 1 58DD91D8
P 6700 5950
F 0 "J5" H 6700 6100 50  0000 C CNN
F 1 "RAILS" V 6800 5950 50  0000 C CNN
F 2 "bcan:Castellations_1x02_Pitch2.00mm" H 6700 5950 50  0001 C CNN
F 3 "" H 6700 5950 50  0001 C CNN
	1    6700 5950
	1    0    0    -1  
$EndComp
Text GLabel 7300 5900 2    60   UnSpc ~ 0
RAIL_R
Text GLabel 6500 5900 0    60   UnSpc ~ 0
RAIL_L
$Comp
L CONN_01X02 J6
U 1 1 58DD950B
P 7100 5950
F 0 "J6" H 7100 6100 50  0000 C CNN
F 1 "MOTOR" V 7200 5950 50  0000 C CNN
F 2 "bcan:Castellations_1x02_Pitch2.00mm" H 7100 5950 50  0001 C CNN
F 3 "" H 7100 5950 50  0001 C CNN
	1    7100 5950
	-1   0    0    1   
$EndComp
Text GLabel 7300 6000 2    60   Output ~ 0
MOT+
Text GLabel 6500 6000 0    60   Output ~ 0
MOT-
$Comp
L Jumper_NC_Small JP5
U 1 1 58DD9C6C
P 4600 5900
F 0 "JP5" H 4600 5980 50  0000 C CNN
F 1 "USB_VBUS" H 4610 5840 50  0000 C CNN
F 2 "bcan:Solder_Jumper_NC" H 4600 5900 50  0001 C CNN
F 3 "" H 4600 5900 50  0001 C CNN
	1    4600 5900
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR035
U 1 1 58DD9EE4
P 4600 5800
F 0 "#PWR035" H 4600 5650 50  0001 C CNN
F 1 "+5V" H 4600 5940 50  0000 C CNN
F 2 "" H 4600 5800 50  0001 C CNN
F 3 "" H 4600 5800 50  0001 C CNN
	1    4600 5800
	1    0    0    -1  
$EndComp
Text GLabel 4600 6100 3    60   BiDi ~ 0
PA9
$Comp
L +5V #PWR036
U 1 1 58DDAC8D
P 5400 5800
F 0 "#PWR036" H 5400 5650 50  0001 C CNN
F 1 "+5V" H 5400 5940 50  0000 C CNN
F 2 "" H 5400 5800 50  0001 C CNN
F 3 "" H 5400 5800 50  0001 C CNN
	1    5400 5800
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR037
U 1 1 58DDFD3F
P 800 7200
F 0 "#PWR037" H 800 7050 50  0001 C CNN
F 1 "VCC" H 800 7350 50  0000 C CNN
F 2 "" H 800 7200 50  0001 C CNN
F 3 "" H 800 7200 50  0001 C CNN
	1    800  7200
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR038
U 1 1 58DDFFF5
P 600 7200
F 0 "#PWR038" H 600 7050 50  0001 C CNN
F 1 "+5V" H 600 7340 50  0000 C CNN
F 2 "" H 600 7200 50  0001 C CNN
F 3 "" H 600 7200 50  0001 C CNN
	1    600  7200
	1    0    0    -1  
$EndComp
$Comp
L +2V8 #PWR039
U 1 1 58DC8318
P 800 5300
F 0 "#PWR039" H 800 5150 50  0001 C CNN
F 1 "+2V8" H 800 5440 50  0000 C CNN
F 2 "" H 800 5300 50  0001 C CNN
F 3 "" H 800 5300 50  0001 C CNN
	1    800  5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 3900 4300 3900
Wire Wire Line
	5400 3700 5700 3700
Wire Wire Line
	5400 3800 5700 3800
Wire Wire Line
	5400 3900 5700 3900
Wire Wire Line
	4600 3700 4500 3700
Wire Wire Line
	4600 3800 4300 3800
Wire Wire Line
	5000 3300 5000 3500
Connection ~ 5000 3400
Wire Wire Line
	5300 5100 5400 5100
Wire Wire Line
	5400 5100 5400 5200
Wire Wire Line
	4700 4800 4700 4900
Wire Wire Line
	4500 4800 4700 4800
Connection ~ 4600 4800
Wire Wire Line
	4700 5200 4700 5100
Wire Wire Line
	4300 5200 4700 5200
Connection ~ 4600 5200
Wire Wire Line
	4300 3800 4300 3650
Wire Wire Line
	4300 3400 5000 3400
Connection ~ 4500 3400
Wire Wire Line
	4500 3400 4500 3450
Wire Wire Line
	4300 3400 4300 3450
Wire Wire Line
	4500 3700 4500 3650
Wire Wire Line
	5300 4900 5700 4900
Wire Wire Line
	5400 4900 5400 4800
Connection ~ 5400 4900
Connection ~ 8600 5700
Wire Wire Line
	8600 6100 8600 6200
Connection ~ 10100 5900
Wire Wire Line
	9100 5600 9100 5900
Wire Wire Line
	9100 5900 9200 5900
Wire Wire Line
	9600 6100 9600 6200
Wire Wire Line
	8600 5600 8600 5900
Connection ~ 9100 5700
Connection ~ 10400 6100
Connection ~ 10100 5700
Wire Wire Line
	8950 5700 9200 5700
Wire Wire Line
	9600 900  9600 1100
Wire Wire Line
	9600 2500 9600 2700
Connection ~ 9600 3000
Wire Wire Line
	9600 3000 10000 3000
Connection ~ 9600 1400
Wire Wire Line
	9600 1400 10000 1400
Wire Wire Line
	9600 2900 9600 3100
Wire Wire Line
	9600 1300 9600 1500
Connection ~ 10400 3000
Wire Wire Line
	10400 3000 10500 3000
Wire Wire Line
	10400 2900 10400 3100
Wire Wire Line
	10400 3500 10400 3500
Wire Wire Line
	10000 2700 10100 2700
Wire Wire Line
	10400 2500 10400 2500
Wire Wire Line
	10400 1900 10400 1900
Wire Wire Line
	10400 900  10400 900 
Connection ~ 10400 1400
Wire Wire Line
	10400 1400 10500 1400
Wire Wire Line
	10400 1300 10400 1500
Connection ~ 10000 3000
Connection ~ 10000 1400
Wire Wire Line
	10000 3300 10100 3300
Wire Wire Line
	10000 2700 10000 3300
Wire Wire Line
	10000 1700 10100 1700
Wire Wire Line
	10000 1100 10000 1700
Wire Wire Line
	10100 1100 10000 1100
Wire Wire Line
	9300 3300 9300 3300
Wire Wire Line
	9300 1700 9300 1700
Wire Wire Line
	9100 3300 8800 3300
Wire Wire Line
	9100 1700 8800 1700
Wire Wire Line
	5400 6300 5400 6500
Wire Wire Line
	5500 6300 5400 6300
Wire Wire Line
	6400 7100 6400 7000
Wire Wire Line
	6500 7100 6400 7100
Wire Wire Line
	4600 7100 4600 7000
Wire Wire Line
	4700 7100 4600 7100
Wire Wire Line
	6400 7400 6400 7500
Wire Wire Line
	6500 7400 6400 7400
Wire Wire Line
	4600 7400 4600 7500
Wire Wire Line
	4700 7400 4600 7400
Wire Wire Line
	3000 5900 3100 5900
Connection ~ 3000 6100
Wire Wire Line
	3100 6000 3000 6000
Connection ~ 3000 6200
Wire Wire Line
	3100 6100 3000 6100
Connection ~ 3000 6300
Wire Wire Line
	3000 6200 3100 6200
Wire Wire Line
	3000 6000 3000 6500
Wire Wire Line
	3000 6300 3100 6300
Wire Wire Line
	3000 5800 3000 5900
Wire Wire Line
	3100 7100 3000 7100
Wire Wire Line
	3600 7100 3700 7100
Wire Wire Line
	3100 7300 3000 7300
Wire Wire Line
	3600 7200 3700 7200
Wire Wire Line
	3600 7300 3700 7300
Wire Wire Line
	3100 7200 3000 7200
Wire Wire Line
	3100 7400 3000 7400
Wire Wire Line
	3600 7400 3700 7400
Wire Wire Line
	5100 6000 5500 6000
Wire Wire Line
	5100 6100 5500 6100
Wire Wire Line
	5100 6200 5500 6200
Wire Wire Line
	6300 7200 6500 7200
Wire Wire Line
	6300 7300 6500 7300
Wire Wire Line
	4500 7200 4700 7200
Wire Wire Line
	4500 7300 4700 7300
Wire Wire Line
	3600 5900 4000 5900
Wire Wire Line
	3600 6000 4000 6000
Wire Wire Line
	3600 6100 4000 6100
Wire Wire Line
	3600 6200 4000 6200
Wire Wire Line
	3600 6300 4000 6300
Wire Wire Line
	2500 5800 2500 6000
Wire Wire Line
	5500 7200 5500 7400
Wire Wire Line
	5800 7200 5800 7400
Wire Wire Line
	9100 4700 9100 4900
Wire Wire Line
	9000 4800 9100 4800
Connection ~ 9100 4800
Wire Wire Line
	2500 6000 2000 6000
Wire Wire Line
	700  6000 1200 6000
Wire Wire Line
	4600 5200 4600 5100
Wire Wire Line
	4600 4800 4600 4900
Wire Wire Line
	8750 5700 8600 5700
Wire Wire Line
	4600 6100 4600 6000
Wire Wire Line
	5500 5900 5400 5900
Wire Wire Line
	5400 5900 5400 5800
Wire Wire Line
	1200 6100 700  6100
Connection ~ 700  6100
Wire Wire Line
	2000 5900 2500 5900
Connection ~ 2500 5900
Wire Wire Line
	1200 7300 800  7300
Wire Wire Line
	800  7300 800  7200
Wire Wire Line
	1200 7400 600  7400
Wire Wire Line
	600  7400 600  7200
Wire Wire Line
	10000 5900 10100 5900
Wire Wire Line
	10000 5700 10400 5700
Wire Wire Line
	10400 5600 10400 5800
Connection ~ 10400 5700
Wire Wire Line
	10100 6100 10400 6100
Wire Wire Line
	10400 6000 10400 6200
Wire Wire Line
	10100 5700 10100 5600
Wire Wire Line
	10100 6200 10100 6100
Connection ~ 10100 6100
Wire Wire Line
	800  5500 1200 5500
Wire Wire Line
	800  5300 800  5500
Wire Wire Line
	700  5400 1200 5400
Connection ~ 800  5400
Text GLabel 1200 4800 0    60   Output ~ 0
REAR-
Text GLabel 1200 4700 0    60   Output ~ 0
FRONT-
Wire Wire Line
	700  6000 700  6200
$Comp
L +2V8 #PWR?
U 1 1 58DDB97A
P 700 5300
F 0 "#PWR?" H 700 5150 50  0001 C CNN
F 1 "+2V8" H 700 5440 50  0000 C CNN
F 2 "" H 700 5300 50  0001 C CNN
F 3 "" H 700 5300 50  0001 C CNN
	1    700  5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	700  5500 1100 5500
Wire Wire Line
	700  5300 700  5500
Connection ~ 700  5400
$Comp
L GND #PWR?
U 1 1 58DDBAD8
P 2500 4500
F 0 "#PWR?" H 2500 4250 50  0001 C CNN
F 1 "GND" H 2500 4350 50  0000 C CNN
F 2 "" H 2500 4500 50  0001 C CNN
F 3 "" H 2500 4500 50  0001 C CNN
	1    2500 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 4400 2500 4400
Wire Wire Line
	2500 4300 2500 4500
Wire Wire Line
	2000 4300 2500 4300
Connection ~ 2500 4400
$EndSCHEMATC