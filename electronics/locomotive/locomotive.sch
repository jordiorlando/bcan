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
Sheet 1 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 5000 4300 1300 1800
U 58AFF684
F0 "Control" 60
F1 "control.sch" 60
F2 "VBAT" I L 5000 4500 60 
F3 "I2C2_SDA" I R 6300 5900 60 
F4 "I2C2_SCL" I R 6300 6000 60 
F5 "USB_VBUS" I R 6300 5000 60 
F6 "USB_ID" I R 6300 5100 60 
F7 "USB_D-" I R 6300 5200 60 
F8 "USB_D+" I R 6300 5300 60 
F9 "ADC10" I L 5000 4800 60 
F10 "ADC11" I L 5000 4900 60 
F11 "ADC12" I L 5000 5000 60 
F12 "ADC13" I L 5000 5100 60 
F13 "GND" I L 5000 6000 60 
F14 "2V8" I L 5000 4400 60 
F15 "TIM3_CH3" I R 6300 5500 60 
F16 "TIM3_CH4" I R 6300 5600 60 
F17 "PC13" I L 5000 5300 60 
$EndSheet
$Sheet
S 5200 2000 1000 400 
U 58B005B6
F0 "Power" 60
F1 "power.sch" 60
F2 "RAIL1" I L 5200 2100 60 
F3 "RAIL2" I L 5200 2300 60 
F4 "2V8" I R 6200 2100 60 
F5 "GND" I R 6200 2300 60 
F6 "VMOT" I R 6200 2200 60 
F7 "USB_VBUS" I L 5200 2200 60 
$EndSheet
$Comp
L +2V8 #PWR?
U 1 1 58B1F309
P 4900 4300
F 0 "#PWR?" H 4900 4150 50  0001 C CNN
F 1 "+2V8" H 4900 4440 50  0000 C CNN
F 2 "" H 4900 4300 50  0001 C CNN
F 3 "" H 4900 4300 50  0001 C CNN
	1    4900 4300
	1    0    0    -1  
$EndComp
$Comp
L +2V8 #PWR?
U 1 1 58B1F498
P 6300 2000
F 0 "#PWR?" H 6300 1850 50  0001 C CNN
F 1 "+2V8" H 6300 2140 50  0000 C CNN
F 2 "" H 6300 2000 50  0001 C CNN
F 3 "" H 6300 2000 50  0001 C CNN
	1    6300 2000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58B1F533
P 6300 2400
F 0 "#PWR?" H 6300 2150 50  0001 C CNN
F 1 "GND" H 6300 2250 50  0000 C CNN
F 2 "" H 6300 2400 50  0000 C CNN
F 3 "" H 6300 2400 50  0000 C CNN
	1    6300 2400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58B1F5CE
P 4900 6100
F 0 "#PWR?" H 4900 5850 50  0001 C CNN
F 1 "GND" H 4900 5950 50  0000 C CNN
F 2 "" H 4900 6100 50  0000 C CNN
F 3 "" H 4900 6100 50  0000 C CNN
	1    4900 6100
	1    0    0    -1  
$EndComp
Text Label 5100 2100 2    60   ~ 0
RAIL1
Text Label 5100 2300 2    60   ~ 0
RAIL2
$Comp
L VCC #PWR?
U 1 1 58B20676
P 6500 2000
F 0 "#PWR?" H 6500 1850 50  0001 C CNN
F 1 "VCC" H 6500 2150 50  0000 C CNN
F 2 "" H 6500 2000 50  0001 C CNN
F 3 "" H 6500 2000 50  0001 C CNN
	1    6500 2000
	1    0    0    -1  
$EndComp
$Sheet
S 3500 3100 900  500 
U 58B20AEF
F0 "Drivetrain" 60
F1 "drivetrain.sch" 60
F2 "MOT-" I R 4400 3500 60 
F3 "MOT+" I R 4400 3400 60 
F4 "PWM_A" I L 3500 3200 60 
F5 "PWM_B" I L 3500 3300 60 
F6 "VMOT" I R 4400 3200 60 
F7 "GND" I L 3500 3500 60 
$EndSheet
Text Label 4500 3400 0    60   ~ 0
MOT+
Text Label 4500 3500 0    60   ~ 0
MOT-
Text Label 6400 5500 0    60   ~ 0
PWM_A
Text Label 6400 5600 0    60   ~ 0
PWM_B
Text Label 3400 3200 2    60   ~ 0
PWM_A
Text Label 3400 3300 2    60   ~ 0
PWM_B
$Comp
L VCC #PWR?
U 1 1 58B2A2C4
P 4500 3100
F 0 "#PWR?" H 4500 2950 50  0001 C CNN
F 1 "VCC" H 4500 3250 50  0000 C CNN
F 2 "" H 4500 3100 50  0001 C CNN
F 3 "" H 4500 3100 50  0001 C CNN
	1    4500 3100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58B2A383
P 3400 3600
F 0 "#PWR?" H 3400 3350 50  0001 C CNN
F 1 "GND" H 3400 3450 50  0000 C CNN
F 2 "" H 3400 3600 50  0000 C CNN
F 3 "" H 3400 3600 50  0000 C CNN
	1    3400 3600
	1    0    0    -1  
$EndComp
$Comp
L LM358 U?
U 1 1 58B2BF2A
P 3800 4800
F 0 "U?" H 3800 5000 50  0000 L CNN
F 1 "LM358" H 3800 4600 50  0000 L CNN
F 2 "" H 3800 4800 50  0001 C CNN
F 3 "" H 3800 4800 50  0001 C CNN
	1    3800 4800
	1    0    0    -1  
$EndComp
$Comp
L R_Small R?
U 1 1 58B2C8A8
P 3200 4900
F 0 "R?" H 3230 4920 50  0000 L CNN
F 1 "0.25k" H 3230 4860 50  0000 L CNN
F 2 "" H 3200 4900 50  0001 C CNN
F 3 "" H 3200 4900 50  0001 C CNN
	1    3200 4900
	1    0    0    -1  
$EndComp
$Comp
L R_Small R?
U 1 1 58B2CCB4
P 3200 4500
F 0 "R?" H 3230 4520 50  0000 L CNN
F 1 "15.75k" H 3230 4460 50  0000 L CNN
F 2 "" H 3200 4500 50  0001 C CNN
F 3 "" H 3200 4500 50  0001 C CNN
	1    3200 4500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58B2D696
P 3700 5400
F 0 "#PWR?" H 3700 5150 50  0001 C CNN
F 1 "GND" H 3700 5250 50  0000 C CNN
F 2 "" H 3700 5400 50  0000 C CNN
F 3 "" H 3700 5400 50  0000 C CNN
	1    3700 5400
	1    0    0    -1  
$EndComp
$Comp
L R_Small R?
U 1 1 58B2E38E
P 3900 5300
F 0 "R?" H 3930 5320 50  0000 L CNN
F 1 "1k" H 3930 5260 50  0000 L CNN
F 2 "" H 3900 5300 50  0001 C CNN
F 3 "" H 3900 5300 50  0001 C CNN
	1    3900 5300
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR?
U 1 1 58B2F261
P 3200 4400
F 0 "#PWR?" H 3200 4250 50  0001 C CNN
F 1 "VCC" H 3200 4550 50  0000 C CNN
F 2 "" H 3200 4400 50  0001 C CNN
F 3 "" H 3200 4400 50  0001 C CNN
	1    3200 4400
	1    0    0    -1  
$EndComp
$Sheet
S 5300 3200 700  300 
U 58B300BA
F0 "TOF Sensor" 60
F1 "tof_sensor.sch" 60
F2 "SDA" I L 5300 3300 60 
F3 "SCL" I L 5300 3400 60 
F4 "2V8" I R 6000 3300 60 
F5 "GND" I R 6000 3400 60 
$EndSheet
$Sheet
S 7000 3200 700  300 
U 58B30118
F0 "IR Receiver" 60
F1 "ir_receiver.sch" 60
F2 "IR_L" I L 7000 3300 60 
F3 "IR_R" I L 7000 3400 60 
F4 "GND" I R 7700 3400 60 
F5 "2V8" I R 7700 3300 60 
$EndSheet
$Comp
L +5V #PWR?
U 1 1 58B31950
P 4800 2000
F 0 "#PWR?" H 4800 1850 50  0001 C CNN
F 1 "+5V" H 4800 2140 50  0000 C CNN
F 2 "" H 4800 2000 50  0001 C CNN
F 3 "" H 4800 2000 50  0001 C CNN
	1    4800 2000
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 58B31D04
P 6400 4900
F 0 "#PWR?" H 6400 4750 50  0001 C CNN
F 1 "+5V" H 6400 5040 50  0000 C CNN
F 2 "" H 6400 4900 50  0001 C CNN
F 3 "" H 6400 4900 50  0001 C CNN
	1    6400 4900
	1    0    0    -1  
$EndComp
Text Label 5200 3300 2    60   ~ 0
SDA
Text Label 5200 3400 2    60   ~ 0
SCL
$Comp
L +2V8 #PWR?
U 1 1 58B34E5C
P 6300 3200
F 0 "#PWR?" H 6300 3050 50  0001 C CNN
F 1 "+2V8" H 6300 3340 50  0000 C CNN
F 2 "" H 6300 3200 50  0001 C CNN
F 3 "" H 6300 3200 50  0001 C CNN
	1    6300 3200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58B35272
P 6300 3500
F 0 "#PWR?" H 6300 3250 50  0001 C CNN
F 1 "GND" H 6300 3350 50  0000 C CNN
F 2 "" H 6300 3500 50  0000 C CNN
F 3 "" H 6300 3500 50  0000 C CNN
	1    6300 3500
	1    0    0    -1  
$EndComp
Text Label 6400 5900 0    60   ~ 0
SDA
Text Label 6400 6000 0    60   ~ 0
SCL
$Comp
L GND #PWR?
U 1 1 58B37782
P 8000 3500
F 0 "#PWR?" H 8000 3250 50  0001 C CNN
F 1 "GND" H 8000 3350 50  0000 C CNN
F 2 "" H 8000 3500 50  0000 C CNN
F 3 "" H 8000 3500 50  0000 C CNN
	1    8000 3500
	1    0    0    -1  
$EndComp
$Comp
L +2V8 #PWR?
U 1 1 58B37883
P 8000 3200
F 0 "#PWR?" H 8000 3050 50  0001 C CNN
F 1 "+2V8" H 8000 3340 50  0000 C CNN
F 2 "" H 8000 3200 50  0001 C CNN
F 3 "" H 8000 3200 50  0001 C CNN
	1    8000 3200
	1    0    0    -1  
$EndComp
Text Label 6900 3300 2    60   ~ 0
IR_L
Text Label 6900 3400 2    60   ~ 0
IR_R
Text Label 4900 4800 2    60   ~ 0
IR_L
Text Label 4900 4900 2    60   ~ 0
IR_R
Text Label 6400 5100 0    60   ~ 0
USB_ID
Text Label 6400 5200 0    60   ~ 0
USB_D-
Text Label 6400 5300 0    60   ~ 0
USB_D+
Wire Wire Line
	5000 4400 4900 4400
Wire Wire Line
	4900 4400 4900 4300
Wire Wire Line
	6200 2100 6300 2100
Wire Wire Line
	6300 2100 6300 2000
Wire Wire Line
	6200 2300 6300 2300
Wire Wire Line
	6300 2300 6300 2400
Wire Wire Line
	5200 2100 5100 2100
Wire Wire Line
	5200 2300 5100 2300
Wire Wire Line
	6200 2200 6500 2200
Wire Wire Line
	6500 2200 6500 2000
Wire Wire Line
	5000 6000 4900 6000
Wire Wire Line
	4900 6000 4900 6100
Wire Wire Line
	4400 3400 4500 3400
Wire Wire Line
	4400 3500 4500 3500
Wire Wire Line
	6300 5500 6400 5500
Wire Wire Line
	6300 5600 6400 5600
Wire Wire Line
	3500 3200 3400 3200
Wire Wire Line
	3500 3300 3400 3300
Wire Wire Line
	4400 3200 4500 3200
Wire Wire Line
	4500 3200 4500 3100
Wire Wire Line
	3500 3500 3400 3500
Wire Wire Line
	3400 3500 3400 3600
Wire Wire Line
	4100 5200 3500 5200
Wire Wire Line
	3500 5200 3500 4900
Wire Wire Line
	4100 4800 4100 5200
Wire Wire Line
	4100 5200 4100 5300
Wire Wire Line
	3700 5100 3700 5300
Wire Wire Line
	3700 5300 3700 5400
Wire Wire Line
	3200 5000 3200 5300
Wire Wire Line
	3200 5300 3700 5300
Wire Wire Line
	3700 5300 3800 5300
Connection ~ 3700 5300
Wire Wire Line
	3500 4700 3200 4700
Wire Wire Line
	3200 4600 3200 4700
Wire Wire Line
	3200 4700 3200 4800
Connection ~ 3200 4700
Wire Wire Line
	4100 5300 4000 5300
Connection ~ 4100 5200
Wire Wire Line
	5200 2200 4800 2200
Wire Wire Line
	4800 2200 4800 2000
Wire Wire Line
	6300 5000 6400 5000
Wire Wire Line
	6400 5000 6400 4900
Wire Wire Line
	5300 3300 5200 3300
Wire Wire Line
	5300 3400 5200 3400
Wire Wire Line
	6000 3300 6300 3300
Wire Wire Line
	6300 3300 6300 3200
Wire Wire Line
	6000 3400 6300 3400
Wire Wire Line
	6300 3400 6300 3500
Wire Wire Line
	6300 5900 6400 5900
Wire Wire Line
	6300 6000 6400 6000
Wire Wire Line
	7000 3300 6900 3300
Wire Wire Line
	7000 3400 6900 3400
Wire Wire Line
	7700 3300 8000 3300
Wire Wire Line
	8000 3300 8000 3200
Wire Wire Line
	7700 3400 8000 3400
Wire Wire Line
	8000 3400 8000 3500
Wire Wire Line
	5000 4800 4900 4800
Wire Wire Line
	5000 4900 4900 4900
Wire Wire Line
	6300 5100 6400 5100
Wire Wire Line
	6300 5200 6400 5200
Wire Wire Line
	6300 5300 6400 5300
Wire Wire Line
	3700 4500 4700 4500
Wire Wire Line
	4700 4500 4700 5000
Wire Wire Line
	4700 5000 5000 5000
Wire Wire Line
	4700 5300 5000 5300
Text Label 2200 6800 2    60   ~ 0
RAIL2
Text Label 2200 6400 2    60   ~ 0
RAIL1
Wire Wire Line
	4700 6700 4700 5300
Connection ~ 3900 6700
Connection ~ 2700 6800
Wire Wire Line
	2700 6750 2700 6800
Wire Wire Line
	2700 6800 2800 6800
Wire Wire Line
	2200 6800 2700 6800
Wire Wire Line
	2800 6800 2800 6700
Wire Wire Line
	2300 6400 2200 6400
Connection ~ 2700 6400
Wire Wire Line
	2700 6450 2700 6400
Wire Wire Line
	2700 6400 2800 6400
Wire Wire Line
	2600 6400 2700 6400
Wire Wire Line
	2800 6400 2800 6500
Connection ~ 3700 6000
Wire Wire Line
	3500 6400 3400 6400
Wire Wire Line
	3500 6000 3500 6400
Wire Wire Line
	3700 6000 3700 6100
Wire Wire Line
	3700 5900 3700 6000
Wire Wire Line
	3700 6000 3900 6000
Wire Wire Line
	3500 6000 3700 6000
Wire Wire Line
	3900 6000 3900 6100
Wire Wire Line
	3900 6700 3900 6400
Wire Wire Line
	3900 6700 4700 6700
Wire Wire Line
	3400 6700 3900 6700
Wire Wire Line
	3500 6800 3500 6900
Wire Wire Line
	3400 6800 3500 6800
Wire Wire Line
	3700 6500 3700 6400
Wire Wire Line
	3400 6500 3700 6500
$Comp
L 6N136 U?
U 1 1 58ACE871
P 3100 6600
F 0 "U?" H 2900 6900 50  0000 L CNN
F 1 "6N136" H 3100 6900 50  0000 L CNN
F 2 "DIP-8" H 2900 6300 50  0000 L CIN
F 3 "" H 3100 6600 50  0000 L CNN
	1    3100 6600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 58ACE876
P 3500 6900
F 0 "#PWR02" H 3500 6650 50  0001 C CNN
F 1 "GND" H 3500 6750 50  0000 C CNN
F 2 "" H 3500 6900 50  0000 C CNN
F 3 "" H 3500 6900 50  0000 C CNN
	1    3500 6900
	1    0    0    -1  
$EndComp
$Comp
L D D?
U 1 1 58ACE875
P 2700 6600
F 0 "D?" H 2700 6700 50  0000 C CNN
F 1 "1N4148" H 2700 6500 50  0000 C CNN
F 2 "" H 2700 6600 50  0000 C CNN
F 3 "" H 2700 6600 50  0000 C CNN
	1    2700 6600
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 58ACE873
P 3900 6250
F 0 "R?" V 3980 6250 50  0000 C CNN
F 1 "10k" V 3900 6250 50  0000 C CNN
F 2 "" V 3830 6250 50  0000 C CNN
F 3 "" H 3900 6250 50  0000 C CNN
	1    3900 6250
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 58ACE872
P 3700 6250
F 0 "R?" V 3780 6250 50  0000 C CNN
F 1 "10k (not fitted)" V 3700 6250 50  0000 C CNN
F 2 "" V 3630 6250 50  0000 C CNN
F 3 "" H 3700 6250 50  0000 C CNN
	1    3700 6250
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR01
U 1 1 58940D69
P 3700 5900
F 0 "#PWR01" H 3700 5750 50  0001 C CNN
F 1 "+3.3V" H 3700 6040 50  0000 C CNN
F 2 "" H 3700 5900 50  0000 C CNN
F 3 "" H 3700 5900 50  0000 C CNN
	1    3700 5900
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 58940B83
P 2450 6400
F 0 "R?" V 2530 6400 50  0000 C CNN
F 1 "1k5" V 2450 6400 50  0000 C CNN
F 2 "" V 2380 6400 50  0000 C CNN
F 3 "" H 2450 6400 50  0000 C CNN
	1    2450 6400
	0    1    1    0   
$EndComp
$EndSCHEMATC