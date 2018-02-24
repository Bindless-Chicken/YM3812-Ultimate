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
Sheet 4 4
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
L LM386 U?
U 1 1 5A80F11F
P 5400 2950
F 0 "U?" H 5450 3250 50  0000 L CNN
F 1 "LM386" H 5450 3150 50  0000 L CNN
F 2 "" H 5500 3050 50  0001 C CNN
F 3 "" H 5600 3150 50  0001 C CNN
	1    5400 2950
	1    0    0    -1  
$EndComp
$Comp
L POT RV?
U 1 1 5A80F1A5
P 4600 2850
F 0 "RV?" V 4425 2850 50  0000 C CNN
F 1 "10k" V 4500 2850 50  0000 C CNN
F 2 "" H 4600 2850 50  0001 C CNN
F 3 "" H 4600 2850 50  0001 C CNN
	1    4600 2850
	1    0    0    -1  
$EndComp
Text HLabel 4200 2400 0    60   Input ~ 0
Input
$Comp
L GND #PWR?
U 1 1 5A80F256
P 4600 3500
F 0 "#PWR?" H 4600 3250 50  0001 C CNN
F 1 "GND" H 4600 3350 50  0000 C CNN
F 2 "" H 4600 3500 50  0001 C CNN
F 3 "" H 4600 3500 50  0001 C CNN
	1    4600 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 2850 5100 2850
Wire Wire Line
	4600 2700 4600 2400
Wire Wire Line
	4600 2400 4200 2400
Wire Wire Line
	5100 3050 4600 3050
Wire Wire Line
	4600 3000 4600 3500
Connection ~ 4600 3050
Wire Wire Line
	5300 3250 5300 3300
Wire Wire Line
	5300 3300 4600 3300
Connection ~ 4600 3300
$Comp
L +9V #PWR?
U 1 1 5A80F2B2
P 5300 2350
F 0 "#PWR?" H 5300 2200 50  0001 C CNN
F 1 "+9V" H 5300 2490 50  0000 C CNN
F 2 "" H 5300 2350 50  0001 C CNN
F 3 "" H 5300 2350 50  0001 C CNN
	1    5300 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 2650 5300 2350
$Comp
L C C?
U 1 1 5A80F32C
P 5900 3200
F 0 "C?" H 5925 3300 50  0000 L CNN
F 1 "0.05uF" H 5925 3100 50  0000 L CNN
F 2 "" H 5938 3050 50  0001 C CNN
F 3 "" H 5900 3200 50  0001 C CNN
	1    5900 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 2950 5900 2950
Wire Wire Line
	5900 2950 5900 3050
$Comp
L CP C?
U 1 1 5A80F3B5
P 6350 2950
F 0 "C?" H 6375 3050 50  0000 L CNN
F 1 "CP" H 6375 2850 50  0000 L CNN
F 2 "" H 6388 2800 50  0001 C CNN
F 3 "" H 6350 2950 50  0001 C CNN
	1    6350 2950
	0    -1   -1   0   
$EndComp
$EndSCHEMATC
