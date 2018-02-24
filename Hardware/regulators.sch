EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
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
LIBS:Yamaha
LIBS:Microchip_2
LIBS:OPL
LIBS:opl2-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 4
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
L Barrel_Jack J?
U 1 1 5A806EE7
P 3800 4150
F 0 "J?" H 3800 4360 50  0000 C CNN
F 1 "Barrel_Jack" H 3800 3975 50  0000 C CNN
F 2 "" H 3850 4110 50  0001 C CNN
F 3 "" H 3850 4110 50  0001 C CNN
	1    3800 4150
	1    0    0    1   
$EndComp
$Comp
L MIC5211-LXYM6-TR U?
U 1 1 5A807155
P 6650 4350
F 0 "U?" H 6700 5450 60  0000 C CNN
F 1 "MIC5211-LXYM6-TR" V 7150 4850 60  0000 C CNN
F 2 "" H 6650 4350 60  0001 C CNN
F 3 "" H 6650 4350 60  0001 C CNN
	1    6650 4350
	1    0    0    -1  
$EndComp
$Comp
L SW_SPDT SW?
U 1 1 5A8076B9
P 4650 4050
F 0 "SW?" H 4500 4350 50  0000 C CNN
F 1 "SW_SPDT" H 4600 4250 50  0000 C CNN
F 2 "" H 4650 4050 50  0001 C CNN
F 3 "" H 4650 4050 50  0001 C CNN
	1    4650 4050
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5A80783A
P 5600 3400
F 0 "C?" H 5800 3500 50  0000 L CNN
F 1 "0.1uF" H 5800 3300 50  0000 L CNN
F 2 "" H 5638 3250 50  0001 C CNN
F 3 "" H 5600 3400 50  0001 C CNN
	1    5600 3400
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5A8078D3
P 5300 3400
F 0 "C?" H 5000 3500 50  0000 L CNN
F 1 "0.1uF" H 5000 3300 50  0000 L CNN
F 2 "" H 5338 3250 50  0001 C CNN
F 3 "" H 5300 3400 50  0001 C CNN
	1    5300 3400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5A807984
P 6150 4400
F 0 "#PWR?" H 6150 4150 50  0001 C CNN
F 1 "GND" H 6150 4250 50  0000 C CNN
F 2 "" H 6150 4400 50  0001 C CNN
F 3 "" H 6150 4400 50  0001 C CNN
	1    6150 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 4250 6450 4250
Wire Wire Line
	6450 3450 6150 3450
Wire Wire Line
	6450 3800 6150 3800
Wire Wire Line
	4100 4050 4450 4050
Wire Wire Line
	4850 4150 6450 4150
Wire Wire Line
	6150 3450 6150 4400
Connection ~ 6150 4250
Connection ~ 6150 3800
Wire Wire Line
	6450 3900 5450 3900
Wire Wire Line
	5450 3900 5450 3100
Wire Wire Line
	5450 3100 5300 3100
Wire Wire Line
	5300 2950 5300 3250
Wire Wire Line
	6450 3550 5750 3550
Wire Wire Line
	5750 3550 5750 3100
Wire Wire Line
	5750 3100 5600 3100
Wire Wire Line
	5600 2950 5600 3250
Wire Wire Line
	5300 3550 5300 4250
Connection ~ 5300 4250
Wire Wire Line
	5600 3550 5600 4250
Connection ~ 5600 4250
$Comp
L +3.3V #PWR?
U 1 1 5A807D3F
P 5600 2950
F 0 "#PWR?" H 5600 2800 50  0001 C CNN
F 1 "+3.3V" H 5600 3090 50  0000 C CNN
F 2 "" H 5600 2950 50  0001 C CNN
F 3 "" H 5600 2950 50  0001 C CNN
	1    5600 2950
	1    0    0    -1  
$EndComp
Connection ~ 5600 3100
$Comp
L +5V #PWR?
U 1 1 5A807D79
P 5300 2950
F 0 "#PWR?" H 5300 2800 50  0001 C CNN
F 1 "+5V" H 5300 3090 50  0000 C CNN
F 2 "" H 5300 2950 50  0001 C CNN
F 3 "" H 5300 2950 50  0001 C CNN
	1    5300 2950
	1    0    0    -1  
$EndComp
Connection ~ 5300 3100
$EndSCHEMATC
