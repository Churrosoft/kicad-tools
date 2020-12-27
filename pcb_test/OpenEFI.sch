EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 4
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
L OpenEFI-STM32-rev3:MCZ33810EK U1
U 1 1 5F4D8452
P 8300 2650
F 0 "U1" H 8300 4220 50  0000 C CNN
F 1 "MCZ33810EK" H 8300 4129 50  0000 C CNN
F 2 "OpenEFI-STM32F rev3:SOP65P1030X245-33N" H 8300 2650 50  0001 L BNN
F 3 "-" H 8300 2650 50  0001 L BNN
F 4 "FREESCALE SEMICONDUCTOR" H 8300 2650 50  0001 L BNN "Field4"
F 5 "45P4988" H 8300 2650 50  0001 L BNN "Field5"
F 6 "SOP-32" H 8300 2650 50  0001 L BNN "Field6"
F 7 "MCZ33810EK" H 8300 2650 50  0001 L BNN "Field7"
	1    8300 2650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5F4FE3FC
P 7350 4200
F 0 "#PWR0101" H 7350 3950 50  0001 C CNN
F 1 "GND" H 7355 4027 50  0000 C CNN
F 2 "" H 7350 4200 50  0001 C CNN
F 3 "" H 7350 4200 50  0001 C CNN
	1    7350 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 4200 7350 4050
Wire Wire Line
	7350 4050 7500 4050
Wire Notes Line style solid
	500  1700 2150 1700
Wire Notes Line style solid
	2150 2800 500  2800
Wire Notes Line
	500  1700 2150 1700
Text Notes 1200 1850 0    50   ~ 0
Crystal
Connection ~ 1400 2100
Wire Wire Line
	1650 2100 1400 2100
Connection ~ 1400 2500
Wire Wire Line
	1650 2500 1400 2500
Text GLabel 1650 2500 2    50   Input Italic 0
OSC_OUT
Text GLabel 1650 2100 2    50   Input Italic 0
OSC_IN
$Comp
L Device:Crystal_GND24 Y1
U 1 1 5F600C8B
P 1400 2300
F 0 "Y1" V 1400 2250 50  0000 L CNN
F 1 "25MHz" V 1550 2300 50  0000 L CNN
F 2 "Crystal:Crystal_SMD_3225-4Pin_3.2x2.5mm" H 1400 2300 50  0001 C CNN
F 3 "~" H 1400 2300 50  0001 C CNN
	1    1400 2300
	0    1    1    0   
$EndComp
Wire Wire Line
	1750 2300 1600 2300
$Comp
L power:GND #PWR0105
U 1 1 5F600C92
P 1750 2300
F 0 "#PWR0105" H 1750 2050 50  0001 C CNN
F 1 "GND" V 1755 2172 50  0000 R CNN
F 2 "" H 1750 2300 50  0001 C CNN
F 3 "" H 1750 2300 50  0001 C CNN
	1    1750 2300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1100 2300 1200 2300
$Comp
L power:GND #PWR0106
U 1 1 5F600C99
P 1100 2300
F 0 "#PWR0106" H 1100 2050 50  0001 C CNN
F 1 "GND" V 1105 2172 50  0000 R CNN
F 2 "" H 1100 2300 50  0001 C CNN
F 3 "" H 1100 2300 50  0001 C CNN
	1    1100 2300
	0    1    1    0   
$EndComp
Connection ~ 700  2500
Wire Wire Line
	700  2550 700  2500
$Comp
L power:GND #PWR0107
U 1 1 5F600CA1
P 700 2550
F 0 "#PWR0107" H 700 2300 50  0001 C CNN
F 1 "GND" H 705 2377 50  0000 C CNN
F 2 "" H 700 2550 50  0001 C CNN
F 3 "" H 700 2550 50  0001 C CNN
	1    700  2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	700  2500 850  2500
Wire Wire Line
	700  2100 700  2500
Wire Wire Line
	850  2100 700  2100
Wire Wire Line
	1400 2500 1400 2450
Wire Wire Line
	1050 2500 1400 2500
Wire Wire Line
	1400 2100 1400 2150
Wire Wire Line
	1050 2100 1400 2100
$Comp
L Device:C_Small C3
U 1 1 5F600CAF
P 950 2500
F 0 "C3" V 1000 2400 50  0000 C CNN
F 1 "15pF" V 1000 2650 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 950 2500 50  0001 C CNN
F 3 "~" H 950 2500 50  0001 C CNN
F 4 "C1794" V 950 2500 50  0001 C CNN "LCSC"
	1    950  2500
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C2
U 1 1 5F600CB6
P 950 2100
F 0 "C2" V 900 2000 50  0000 C CNN
F 1 "15pF" V 900 2250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 950 2100 50  0001 C CNN
F 3 "~" H 950 2100 50  0001 C CNN
F 4 "C1794" V 950 2100 50  0001 C CNN "LCSC"
	1    950  2100
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C10
U 1 1 5F691FE6
P 9600 950
F 0 "C10" H 9600 1000 50  0000 L CNN
F 1 "100nF" H 9800 700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9600 950 50  0001 C CNN
F 3 "~" H 9600 950 50  0001 C CNN
F 4 "C49678" H 9600 950 50  0001 C CNN "LCSC"
	1    9600 950 
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C11
U 1 1 5F691FED
P 9800 950
F 0 "C11" H 9800 1000 50  0000 L CNN
F 1 "100nF" H 9800 900 50  0001 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9800 950 50  0001 C CNN
F 3 "~" H 9800 950 50  0001 C CNN
F 4 "C49678" H 9800 950 50  0001 C CNN "LCSC"
	1    9800 950 
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C12
U 1 1 5F691FF4
P 10000 950
F 0 "C12" H 10000 1000 50  0000 L CNN
F 1 "100nF" H 10000 900 50  0001 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10000 950 50  0001 C CNN
F 3 "~" H 10000 950 50  0001 C CNN
F 4 "C49678" H 10000 950 50  0001 C CNN "LCSC"
	1    10000 950 
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C13
U 1 1 5F691FFB
P 10200 950
F 0 "C13" H 10200 1000 50  0000 L CNN
F 1 "100nF" H 10200 900 50  0001 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10200 950 50  0001 C CNN
F 3 "~" H 10200 950 50  0001 C CNN
F 4 "C49678" H 10200 950 50  0001 C CNN "LCSC"
	1    10200 950 
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C14
U 1 1 5F692002
P 10400 950
F 0 "C14" H 10400 1000 50  0000 L CNN
F 1 "100nF" H 10400 900 50  0001 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10400 950 50  0001 C CNN
F 3 "~" H 10400 950 50  0001 C CNN
F 4 "C49678" H 10400 950 50  0001 C CNN "LCSC"
	1    10400 950 
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C15
U 1 1 5F692009
P 10600 950
F 0 "C15" H 10600 1000 50  0000 L CNN
F 1 "100nF" H 10600 900 50  0001 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10600 950 50  0001 C CNN
F 3 "~" H 10600 950 50  0001 C CNN
F 4 "C49678" H 10600 950 50  0001 C CNN "LCSC"
	1    10600 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	10600 1050 10600 1100
Wire Wire Line
	10600 1100 10400 1100
Wire Wire Line
	9600 1100 9600 1050
Wire Wire Line
	9800 1050 9800 1100
Connection ~ 9800 1100
Wire Wire Line
	9800 1100 9600 1100
Wire Wire Line
	10000 1050 10000 1100
Connection ~ 10000 1100
Wire Wire Line
	10000 1100 9800 1100
Wire Wire Line
	10200 1050 10200 1100
Connection ~ 10200 1100
Wire Wire Line
	10200 1100 10100 1100
Wire Wire Line
	10400 1050 10400 1100
Connection ~ 10400 1100
Wire Wire Line
	10400 1100 10200 1100
Wire Wire Line
	9600 850  9600 800 
Wire Wire Line
	9600 800  9800 800 
Wire Wire Line
	10600 800  10600 850 
Wire Wire Line
	10400 850  10400 800 
Connection ~ 10400 800 
Wire Wire Line
	10400 800  10600 800 
Wire Wire Line
	10200 850  10200 800 
Connection ~ 10200 800 
Wire Wire Line
	10200 800  10400 800 
Wire Wire Line
	10000 850  10000 800 
Connection ~ 10000 800 
Wire Wire Line
	10000 800  10100 800 
Wire Wire Line
	9800 850  9800 800 
Connection ~ 9800 800 
Wire Wire Line
	9800 800  10000 800 
$Comp
L power:+3V3 #PWR0108
U 1 1 5F69202D
P 10100 700
F 0 "#PWR0108" H 10100 550 50  0001 C CNN
F 1 "+3V3" H 10115 873 50  0000 C CNN
F 2 "" H 10100 700 50  0001 C CNN
F 3 "" H 10100 700 50  0001 C CNN
	1    10100 700 
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 700  10100 800 
Connection ~ 10100 800 
Wire Wire Line
	10100 800  10200 800 
Wire Wire Line
	10100 1200 10100 1100
Connection ~ 10100 1100
Wire Wire Line
	10100 1100 10000 1100
Text Notes 10200 700  0    50   ~ 0
VDD Decoupling
$Comp
L Device:CP_Small C16
U 1 1 5F69203B
P 10850 950
F 0 "C16" H 10900 1000 50  0000 L CNN
F 1 "4.7uF" H 10900 850 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10850 950 50  0001 C CNN
F 3 "~" H 10850 950 50  0001 C CNN
F 4 "0805" H 10850 950 50  0001 C CNN "LCSC"
	1    10850 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	10850 850  10850 800 
Wire Wire Line
	10850 800  10600 800 
Connection ~ 10600 800 
Wire Wire Line
	10850 1050 10850 1100
Wire Wire Line
	10850 1100 10600 1100
Connection ~ 10600 1100
$Comp
L Device:C_Small C5
U 1 1 5F692048
P 2200 1050
F 0 "C5" H 2250 1150 50  0000 L CNN
F 1 "100nF" H 2250 950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2200 1050 50  0001 C CNN
F 3 "~" H 2200 1050 50  0001 C CNN
F 4 "C49678" H 2200 1050 50  0001 C CNN "LCSC"
	1    2200 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 1200 2200 1150
Wire Wire Line
	2200 950  2200 900 
Wire Wire Line
	2200 900  2400 900 
Wire Wire Line
	2550 900  2550 950 
$Comp
L power:+3V3 #PWR0109
U 1 1 5F69205B
P 2400 800
F 0 "#PWR0109" H 2400 650 50  0001 C CNN
F 1 "+3V3" H 2415 973 50  0000 C CNN
F 2 "" H 2400 800 50  0001 C CNN
F 3 "" H 2400 800 50  0001 C CNN
	1    2400 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 800  2400 900 
Connection ~ 2400 900 
Wire Wire Line
	2400 900  2550 900 
Wire Wire Line
	2400 1300 2400 1200
Wire Wire Line
	2400 1200 2200 1200
Text Notes 2500 800  0    50   ~ 0
VREF Decoupling
$Comp
L power:GND #PWR0110
U 1 1 5F692069
P 2400 1300
F 0 "#PWR0110" H 2400 1050 50  0001 C CNN
F 1 "GND" H 2405 1127 50  0000 C CNN
F 2 "" H 2400 1300 50  0001 C CNN
F 3 "" H 2400 1300 50  0001 C CNN
	1    2400 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 5F69206F
P 10100 1200
F 0 "#PWR0111" H 10100 950 50  0001 C CNN
F 1 "GND" H 10105 1027 50  0000 C CNN
F 2 "" H 10100 1200 50  0001 C CNN
F 3 "" H 10100 1200 50  0001 C CNN
	1    10100 1200
	1    0    0    -1  
$EndComp
Connection ~ 2400 1200
Connection ~ 4050 950 
Wire Wire Line
	4050 900  4050 950 
$Comp
L power:GND #PWR0112
U 1 1 5F6FA910
P 4050 900
F 0 "#PWR0112" H 4050 650 50  0001 C CNN
F 1 "GND" H 4055 727 50  0000 C CNN
F 2 "" H 4050 900 50  0001 C CNN
F 3 "" H 4050 900 50  0001 C CNN
	1    4050 900 
	-1   0    0    1   
$EndComp
Text Label 6100 2500 0    39   ~ 0
USB_D+
Text Label 6100 2400 0    39   ~ 0
USB_D-
Text Label 6100 2700 0    39   ~ 0
SYS_SWCLK
Text Label 6000 3300 0    39   ~ 0
SYS_SWO
Wire Wire Line
	6000 3300 6125 3300
Text Label 6100 2600 0    39   ~ 0
SYS_SWDIO
Text Label 3775 1350 2    39   ~ 0
NRST
Connection ~ 3850 1350
Wire Wire Line
	3850 1350 3775 1350
Wire Wire Line
	6100 4400 6000 4400
Wire Wire Line
	6100 4000 6000 4000
Wire Wire Line
	6000 2800 6100 2800
Wire Wire Line
	6000 3400 6100 3400
Wire Wire Line
	6100 3600 6000 3600
Wire Wire Line
	6000 3700 6100 3700
Wire Wire Line
	6100 3800 6000 3800
Wire Wire Line
	6000 3900 6100 3900
Wire Wire Line
	6000 5500 6100 5500
Wire Wire Line
	6100 5600 6000 5600
Wire Wire Line
	4100 5400 4200 5400
Wire Wire Line
	4200 5100 4100 5100
Wire Wire Line
	4100 5000 4200 5000
Wire Wire Line
	4100 4800 4200 4800
Wire Wire Line
	4200 4700 4100 4700
Wire Wire Line
	4100 4100 4200 4100
Wire Wire Line
	4200 4000 4100 4000
Wire Wire Line
	4100 3900 4200 3900
Wire Wire Line
	4200 3800 4100 3800
Wire Wire Line
	4100 3700 4200 3700
Wire Wire Line
	4100 3500 4200 3500
Wire Wire Line
	4200 3400 4100 3400
Wire Wire Line
	4100 3300 4200 3300
Wire Wire Line
	4200 3100 4100 3100
Wire Wire Line
	4100 3000 4200 3000
Wire Wire Line
	4200 2800 4100 2800
Wire Wire Line
	4100 2700 4200 2700
Text GLabel 4100 2800 0    50   Input Italic 0
OSC_OUT
Text GLabel 4100 2700 0    50   Input Italic 0
OSC_IN
Wire Wire Line
	6150 3200 6000 3200
$Comp
L Connector:TestPoint_Small TP2
U 1 1 5F6FA8BF
P 6150 3200
F 0 "TP2" H 6150 3200 50  0000 L CNN
F 1 "BOOT1" H 6200 3200 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 6350 3200 50  0001 C CNN
F 3 "~" H 6350 3200 50  0001 C CNN
	1    6150 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 4300 4200 4300
Wire Wire Line
	4200 4400 4100 4400
Wire Wire Line
	4100 4500 4200 4500
Wire Wire Line
	6100 4200 6000 4200
Wire Wire Line
	6100 5700 6000 5700
Wire Wire Line
	6000 5800 6100 5800
Wire Wire Line
	6100 5900 6000 5900
Wire Wire Line
	4200 4900 4100 4900
Wire Wire Line
	4200 5300 4100 5300
Wire Wire Line
	4100 5200 4200 5200
Wire Wire Line
	6100 5300 6000 5300
Wire Wire Line
	6100 3500 6000 3500
Wire Wire Line
	4100 3200 4200 3200
Wire Wire Line
	6000 4300 6100 4300
Wire Wire Line
	6000 4100 6100 4100
Wire Wire Line
	6100 5400 6000 5400
Wire Wire Line
	6000 2700 6100 2700
Wire Wire Line
	6100 2600 6000 2600
Wire Wire Line
	6000 2500 6100 2500
Wire Wire Line
	6100 2400 6000 2400
Wire Wire Line
	6000 2300 6100 2300
Wire Wire Line
	6100 2200 6000 2200
Wire Wire Line
	6000 2100 6100 2100
Wire Wire Line
	4100 1500 4200 1500
Connection ~ 4100 1500
Wire Wire Line
	4100 1400 4100 1500
$Comp
L Connector:TestPoint_Small TP1
U 1 1 5F6FA860
P 4100 1400
F 0 "TP1" H 4148 1400 50  0000 L CNN
F 1 "BOOT0" H 4148 1355 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 4300 1400 50  0001 C CNN
F 3 "~" H 4300 1400 50  0001 C CNN
	1    4100 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 1750 3750 1750
Connection ~ 3650 1750
Wire Wire Line
	3650 1500 3650 1750
Wire Wire Line
	3850 1500 3650 1500
Wire Wire Line
	4050 1500 4100 1500
$Comp
L Device:R_Small R2
U 1 1 5F6FA855
P 3950 1500
F 0 "R2" V 3950 1500 50  0000 C CNN
F 1 "10k" V 3875 1500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 3950 1500 50  0001 C CNN
F 3 "~" H 3950 1500 50  0001 C CNN
	1    3950 1500
	0    1    1    0   
$EndComp
Wire Wire Line
	4050 950  3850 950 
Wire Wire Line
	4050 1000 4050 950 
Connection ~ 4050 1300
Wire Wire Line
	4050 1350 4050 1300
Wire Wire Line
	3850 1350 4050 1350
$Comp
L Switch:SW_Push SW1
U 1 1 5F6FA84A
P 3850 1150
F 0 "SW1" H 4050 1250 50  0000 R CNN
F 1 "SW_Push" V 3750 1550 50  0001 R CNN
F 2 "Button_Switch_SMD:SW_SPST_TL3342" H 3850 1350 50  0001 C CNN
F 3 "~" H 3850 1350 50  0001 C CNN
	1    3850 1150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4050 1300 4050 1200
Wire Wire Line
	4200 1300 4050 1300
$Comp
L Device:C_Small C9
U 1 1 5F6FA842
P 4050 1100
F 0 "C9" H 4100 1200 50  0000 L CNN
F 1 "100nF" H 4100 1000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4050 1100 50  0001 C CNN
F 3 "~" H 4050 1100 50  0001 C CNN
F 4 "C49678" H 4050 1100 50  0001 C CNN "LCSC"
	1    4050 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 2000 4200 1900
$Comp
L power:+3V3 #PWR0113
U 1 1 5F6FA83A
P 4200 2000
F 0 "#PWR0113" H 4200 1850 50  0001 C CNN
F 1 "+3V3" H 4215 2173 50  0000 C CNN
F 2 "" H 4200 2000 50  0001 C CNN
F 3 "" H 4200 2000 50  0001 C CNN
	1    4200 2000
	-1   0    0    1   
$EndComp
Connection ~ 5400 900 
Wire Wire Line
	5500 900  5500 1000
Wire Wire Line
	5400 900  5500 900 
Connection ~ 5200 6600
Wire Wire Line
	5300 6600 5300 6500
Wire Wire Line
	5200 6600 5300 6600
Connection ~ 4900 6600
Wire Wire Line
	4900 6750 4900 6600
$Comp
L power:GND #PWR0114
U 1 1 5F6FA814
P 4900 6750
F 0 "#PWR0114" H 4900 6500 50  0001 C CNN
F 1 "GND" H 4905 6577 50  0000 C CNN
F 2 "" H 4900 6750 50  0001 C CNN
F 3 "" H 4900 6750 50  0001 C CNN
	1    4900 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 900  4900 900 
Connection ~ 4800 900 
Wire Wire Line
	4800 750  4800 900 
Wire Wire Line
	4800 900  4800 1000
Connection ~ 4900 900 
Wire Wire Line
	4550 750  4800 750 
$Comp
L power:+3V3 #PWR0115
U 1 1 5F6FA808
P 4550 750
F 0 "#PWR0115" H 4550 600 50  0001 C CNN
F 1 "+3V3" V 4565 878 50  0000 L CNN
F 2 "" H 4550 750 50  0001 C CNN
F 3 "" H 4550 750 50  0001 C CNN
	1    4550 750 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5300 900  5200 900 
Connection ~ 5300 900 
Wire Wire Line
	5200 900  5100 900 
Connection ~ 5200 900 
Wire Wire Line
	5100 900  5000 900 
Connection ~ 5100 900 
Wire Wire Line
	5000 900  4900 900 
Connection ~ 5000 900 
Wire Wire Line
	5400 900  5300 900 
Connection ~ 3750 1750
Wire Wire Line
	3750 1750 3750 1850
Wire Wire Line
	3750 1750 3750 1700
Wire Wire Line
	3550 1750 3650 1750
$Comp
L power:GND #PWR0116
U 1 1 5F6FA7F5
P 3550 1750
F 0 "#PWR0116" H 3550 1500 50  0001 C CNN
F 1 "GND" V 3555 1622 50  0000 R CNN
F 2 "" H 3550 1750 50  0001 C CNN
F 3 "" H 3550 1750 50  0001 C CNN
	1    3550 1750
	0    1    1    0   
$EndComp
Wire Wire Line
	4050 1800 4200 1800
Wire Wire Line
	4050 1850 4050 1800
Wire Wire Line
	3950 1850 4050 1850
Wire Wire Line
	3950 1700 4200 1700
$Comp
L Device:C_Small C7
U 1 1 5F6FA7EB
P 3850 1700
F 0 "C7" V 3800 1550 50  0000 L CNN
F 1 "2.2uF" V 3800 1750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3850 1700 50  0001 C CNN
F 3 "~" H 3850 1700 50  0001 C CNN
F 4 "Low ESR <2Ohm" H 3850 1700 50  0001 C CNN "Note"
F 5 "C49217" V 3850 1700 50  0001 C CNN "LCSC"
	1    3850 1700
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C8
U 1 1 5F6FA7E3
P 3850 1850
F 0 "C8" V 3900 1700 50  0000 L CNN
F 1 "2.2uF" V 3800 1900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3850 1850 50  0001 C CNN
F 3 "~" H 3850 1850 50  0001 C CNN
F 4 "Low ESR <2Ohm" H 3850 1850 50  0001 C CNN "Note"
F 5 "C49217" V 3850 1850 50  0001 C CNN "LCSC"
	1    3850 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	5100 6600 5000 6600
Connection ~ 5100 6600
Wire Wire Line
	5100 6500 5100 6600
Wire Wire Line
	5000 6600 4900 6600
Connection ~ 5000 6600
Wire Wire Line
	5000 6500 5000 6600
Wire Wire Line
	4900 6600 4900 6500
Wire Wire Line
	5200 6600 5100 6600
Wire Wire Line
	5200 6500 5200 6600
Wire Wire Line
	4900 900  4900 1000
Wire Wire Line
	5000 900  5000 1000
Wire Wire Line
	5100 900  5100 1000
Wire Wire Line
	5300 900  5300 1000
Wire Wire Line
	5200 900  5200 1000
Wire Wire Line
	5400 1000 5400 900 
Wire Wire Line
	2550 1200 2400 1200
Wire Wire Line
	2550 1150 2550 1200
$Comp
L Device:C_Small C6
U 1 1 5F69204F
P 2550 1050
F 0 "C6" H 2600 1150 50  0000 L CNN
F 1 "1uF" H 2600 950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2550 1050 50  0001 C CNN
F 3 "~" H 2550 1050 50  0001 C CNN
F 4 "C28323" H 2550 1050 50  0001 C CNN "LCSC"
	1    2550 1050
	1    0    0    -1  
$EndComp
$Comp
L Connector:USB_B J1
U 1 1 5F7CD2F4
P 850 7075
F 0 "J1" H 907 7542 50  0000 C CNN
F 1 "USB_B" H 907 7451 50  0000 C CNN
F 2 "Connector_USB:USB_B_OST_USB-B1HSxx_Horizontal" H 1000 7025 50  0001 C CNN
F 3 " ~" H 1000 7025 50  0001 C CNN
	1    850  7075
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1
U 1 1 5F7CD2FB
P 1375 6875
F 0 "R1" V 1450 6875 50  0000 C CNN
F 1 "10k" V 1300 6875 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 1375 6875 50  0001 C CNN
F 3 "~" H 1375 6875 50  0001 C CNN
F 4 "C25804" V 1375 6875 50  0001 C CNN "LCSC"
	1    1375 6875
	0    1    1    0   
$EndComp
Wire Wire Line
	1150 6875 1275 6875
$Comp
L power:GND #PWR0117
U 1 1 5F7CD302
P 1500 6875
F 0 "#PWR0117" H 1500 6625 50  0001 C CNN
F 1 "GND" V 1505 6747 50  0000 R CNN
F 2 "" H 1500 6875 50  0001 C CNN
F 3 "" H 1500 6875 50  0001 C CNN
	1    1500 6875
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1500 6875 1475 6875
Text Label 1250 7075 0    39   ~ 0
USB_D+
Text Label 1250 7175 0    39   ~ 0
USB_D-
Wire Wire Line
	1250 7075 1150 7075
Wire Wire Line
	1150 7175 1250 7175
$Comp
L power:GND #PWR0118
U 1 1 5F7CD30D
P 850 7525
F 0 "#PWR0118" H 850 7275 50  0001 C CNN
F 1 "GND" H 855 7352 50  0000 C CNN
F 2 "" H 850 7525 50  0001 C CNN
F 3 "" H 850 7525 50  0001 C CNN
	1    850  7525
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  7525 850  7475
NoConn ~ 750  7475
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J2
U 1 1 5F80F0B0
P 2400 7075
F 0 "J2" H 2425 7275 50  0000 L CNN
F 1 "Tag connect" H 2250 6825 50  0000 L CNN
F 2 "Connector:Tag-Connect_TC2030-IDC-FP_2x03_P1.27mm_Vertical" H 2400 7075 50  0001 C CNN
F 3 "~" H 2400 7075 50  0001 C CNN
	1    2400 7075
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0119
U 1 1 5F80F0B6
P 2200 6975
F 0 "#PWR0119" H 2200 6825 50  0001 C CNN
F 1 "+3V3" V 2250 6925 50  0000 L CNN
F 2 "" H 2200 6975 50  0001 C CNN
F 3 "" H 2200 6975 50  0001 C CNN
	1    2200 6975
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 5F80F0BC
P 2200 7175
F 0 "#PWR0120" H 2200 6925 50  0001 C CNN
F 1 "GND" V 2250 7275 50  0000 R CNN
F 2 "" H 2200 7175 50  0001 C CNN
F 3 "" H 2200 7175 50  0001 C CNN
	1    2200 7175
	0    1    1    0   
$EndComp
Text Label 2150 7075 2    39   ~ 0
NRST
Wire Wire Line
	2150 7075 2200 7075
Text Label 2775 6975 0    39   ~ 0
SYS_SWDIO
Text Label 2775 7075 0    39   ~ 0
SYS_SWCLK
Text Label 2775 7175 0    39   ~ 0
SYS_SWO
Wire Wire Line
	2775 6975 2700 6975
Wire Wire Line
	2775 7075 2700 7075
Wire Wire Line
	2775 7175 2700 7175
$Comp
L MCU_ST_STM32F4:STM32F407VGTx U3
U 1 1 5F6FA7CC
P 5100 3700
F 0 "U3" H 5100 1750 50  0000 C CNN
F 1 "STM32F407VGTx" H 5100 1850 50  0000 C CNN
F 2 "Package_QFP:LQFP-100_14x14mm_P0.5mm" H 4400 1100 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00037051.pdf" H 5100 3700 50  0001 C CNN
	1    5100 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 1950 9250 1950
Wire Wire Line
	9100 2050 9250 2050
Wire Wire Line
	9100 2150 9250 2150
Wire Wire Line
	7400 2150 7500 2150
Wire Wire Line
	7400 1950 7500 1950
Text Label 4050 5500 0    50   ~ 0
INY1
Text Label 4050 5600 0    50   ~ 0
INY2
Text Label 4050 5700 0    50   ~ 0
INY3
Text Label 4050 5800 0    50   ~ 0
INY4
Text Label 4050 6000 0    50   ~ 0
ECN1
Text Label 4050 6200 0    50   ~ 0
ECN3
Text Label 4050 3600 0    50   ~ 0
ECN4
Text Label 4050 6100 0    50   ~ 0
ECN2
Wire Wire Line
	4050 6200 4200 6200
Wire Wire Line
	4050 6100 4200 6100
Wire Wire Line
	4050 6000 4200 6000
Wire Wire Line
	4050 5800 4200 5800
Wire Wire Line
	4050 5700 4200 5700
Wire Wire Line
	4050 5600 4200 5600
Wire Wire Line
	4050 5500 4200 5500
Entry Wire Line
	3950 3500 4050 3600
Entry Wire Line
	3950 5400 4050 5500
Entry Wire Line
	3950 5500 4050 5600
Entry Wire Line
	3950 5600 4050 5700
Entry Wire Line
	3950 5700 4050 5800
Entry Wire Line
	3950 5900 4050 6000
Entry Wire Line
	3950 6000 4050 6100
Entry Wire Line
	3950 6100 4050 6200
Text Label 7350 2550 0    50   ~ 0
INY1
Text Label 7350 2650 0    50   ~ 0
INY2
Text Label 7350 2750 0    50   ~ 0
INY3
Text Label 7350 2850 0    50   ~ 0
INY4
Text Label 7350 3550 0    50   ~ 0
ENC1
Text Label 7350 3650 0    50   ~ 0
ECN2
Text Label 7350 3750 0    50   ~ 0
ECN3
Text Label 7350 3850 0    50   ~ 0
ECN4
Entry Wire Line
	7250 3750 7350 3850
Entry Wire Line
	7250 3650 7350 3750
Entry Wire Line
	7250 3550 7350 3650
Entry Wire Line
	7250 3450 7350 3550
Entry Wire Line
	7250 2450 7350 2550
Entry Wire Line
	7250 2550 7350 2650
Entry Wire Line
	7250 2650 7350 2750
Entry Wire Line
	7250 2750 7350 2850
Wire Wire Line
	7350 3650 7500 3650
Wire Wire Line
	7350 3750 7500 3750
Wire Wire Line
	7350 3850 7500 3850
Wire Wire Line
	7350 3550 7500 3550
Wire Wire Line
	7350 2850 7500 2850
Wire Wire Line
	7350 2750 7500 2750
Wire Wire Line
	7350 2650 7500 2650
Wire Wire Line
	7350 2550 7500 2550
Wire Wire Line
	4050 3600 4200 3600
Wire Bus Line
	3950 7000 7250 7000
Wire Wire Line
	9600 2550 9650 2550
Wire Wire Line
	9100 1750 9400 1750
Wire Wire Line
	9500 2950 9650 2950
Wire Wire Line
	9300 2650 9100 2650
Entry Wire Line
	6300 1300 6400 1400
Entry Wire Line
	6300 1400 6400 1500
Entry Wire Line
	6300 2000 6400 2100
Entry Wire Line
	6300 1900 6400 2000
Entry Wire Line
	6300 1800 6400 1900
Entry Wire Line
	6300 1700 6400 1800
Entry Wire Line
	6300 1600 6400 1700
Entry Wire Line
	6300 1500 6400 1600
Wire Wire Line
	6000 1300 6300 1300
Wire Wire Line
	6000 1400 6300 1400
Wire Wire Line
	6000 1500 6300 1500
Wire Wire Line
	6000 1700 6300 1700
Wire Wire Line
	6000 1600 6300 1600
Wire Wire Line
	6000 1800 6300 1800
Wire Wire Line
	6000 1900 6300 1900
Wire Wire Line
	6000 2000 6300 2000
Entry Wire Line
	6300 3000 6400 3100
Entry Wire Line
	6300 3100 6400 3200
Wire Wire Line
	6000 3100 6300 3100
Wire Wire Line
	6000 3000 6300 3000
Entry Wire Line
	6300 4800 6400 4900
Entry Wire Line
	6300 4900 6400 5000
Entry Wire Line
	6300 5000 6400 5100
Entry Wire Line
	6300 5100 6400 5200
Entry Wire Line
	6300 5200 6400 5300
Wire Wire Line
	6000 5200 6300 5200
Wire Wire Line
	6000 5100 6300 5100
Wire Wire Line
	6000 5000 6300 5000
Wire Wire Line
	6000 4900 6300 4900
Wire Wire Line
	6000 4800 6300 4800
Entry Wire Line
	6300 4700 6400 4800
Wire Wire Line
	6000 4700 6300 4700
$Comp
L power:+12P #PWR0122
U 1 1 5FF8B92F
P 7200 1700
F 0 "#PWR0122" H 7200 1550 50  0001 C CNN
F 1 "+12P" H 7215 1873 50  0000 C CNN
F 2 "" H 7200 1700 50  0001 C CNN
F 3 "" H 7200 1700 50  0001 C CNN
	1    7200 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 1700 7200 1750
Wire Wire Line
	7200 1750 7500 1750
$Comp
L power:+3.3V #PWR0123
U 1 1 5FFA184C
P 7350 1400
F 0 "#PWR0123" H 7350 1250 50  0001 C CNN
F 1 "+3.3V" H 7365 1573 50  0000 C CNN
F 2 "" H 7350 1400 50  0001 C CNN
F 3 "" H 7350 1400 50  0001 C CNN
	1    7350 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 1400 7350 1450
Wire Wire Line
	7350 1450 7500 1450
Text Label 3600 5850 0    50   ~ 0
PMIC_ENABLE
Wire Wire Line
	4200 5900 4100 5900
Wire Wire Line
	4100 5900 4100 5850
Wire Wire Line
	4100 5850 3600 5850
Text Label 9250 2150 0    31   ~ 0
PMIC_ENABLE
Text Label 9250 2050 0    31   ~ 0
PMIC_NOMI
Text Label 9250 1950 0    31   ~ 0
SPI2_MISO
Text Label 7350 2050 0    31   ~ 0
SPI2_OSI
Wire Wire Line
	7350 2050 7500 2050
Wire Wire Line
	7350 1850 7500 1850
Text Label 7350 1850 0    31   ~ 0
SPI2_SCK
Text Label 7250 2350 0    31   ~ 0
PMIC_MAXI
Text Label 7250 2250 0    31   ~ 0
PMIC_SPARK
Wire Wire Line
	7250 2250 7500 2250
Wire Wire Line
	7250 2350 7500 2350
Text Label 7350 1650 0    31   ~ 0
PMIC_CS
Wire Wire Line
	7350 1650 7500 1650
Text Label 4050 4200 0    31   ~ 0
PMIC_CS
Wire Wire Line
	4050 4200 4200 4200
Text Label 6100 4000 0    31   ~ 0
SPI2_SCK
Text Label 6100 4400 0    31   ~ 0
SPI2_MISO
Text Label 6100 4500 0    31   ~ 0
SPI2_MOSI
Wire Wire Line
	6000 4500 6100 4500
Text Label 6100 4300 0    31   ~ 0
PMIC_SPARK
Text Label 6100 4200 0    31   ~ 0
PMIC_ENABLE
Text Label 6100 4100 0    31   ~ 0
GNC_GLP
Text Label 6100 3900 0    31   ~ 0
PWM_ENABLE_1
Text Label 6100 3800 0    31   ~ 0
PWM_ENABLE_2
Text Label 6100 3700 0    31   ~ 0
PAP_ENABLE
Text Label 6100 3600 0    31   ~ 0
MTR_M1
Text Label 6100 3500 0    31   ~ 0
MTR_M_2
$Comp
L Mechanical:MountingHole H1
U 1 1 600EB996
P 850 6250
F 0 "H1" H 950 6296 50  0000 L CNN
F 1 "MountingHole" H 950 6205 50  0000 L CNN
F 2 "MountingHole:MountingHole_5.3mm_M5" H 850 6250 50  0001 C CNN
F 3 "~" H 850 6250 50  0001 C CNN
	1    850  6250
	1    0    0    -1  
$EndComp
$Sheet
S 8150 4500 550  1650
U 5F54B134
F0 "Sensores" 50
F1 "file5F54B133.sch" 50
F2 "PA0" I L 8150 4550 50 
F3 "PA1" I L 8150 4650 50 
F4 "PA2" I L 8150 4750 50 
F5 "PA3" I L 8150 4850 50 
F6 "PA4" I L 8150 4950 50 
F7 "PA5" I L 8150 5050 50 
F8 "PA6" I L 8150 5150 50 
F9 "PA7" I L 8150 5250 50 
F10 "PB0" I L 8150 5350 50 
F11 "PB1" I L 8150 5450 50 
F12 "PC0" I L 8150 5550 50 
F13 "PC1" I L 8150 5650 50 
F14 "PC2" I L 8150 5750 50 
F15 "PC3" I L 8150 5850 50 
F16 "PC4" I L 8150 5950 50 
F17 "PC5" I L 8150 6050 50 
$EndSheet
Entry Wire Line
	8000 4450 8100 4550
Entry Wire Line
	8000 4550 8100 4650
Entry Wire Line
	8000 4650 8100 4750
Entry Wire Line
	8000 4750 8100 4850
Entry Wire Line
	8000 4850 8100 4950
Entry Wire Line
	8000 4950 8100 5050
Entry Wire Line
	8000 5050 8100 5150
Entry Wire Line
	8000 5150 8100 5250
Entry Wire Line
	8000 5250 8100 5350
Entry Wire Line
	8000 5350 8100 5450
Entry Wire Line
	8000 5450 8100 5550
Entry Wire Line
	8000 5550 8100 5650
Entry Wire Line
	8000 5650 8100 5750
Entry Wire Line
	8000 5750 8100 5850
Entry Wire Line
	8000 5850 8100 5950
Entry Wire Line
	8000 5950 8100 6050
Wire Wire Line
	8100 6050 8150 6050
Wire Wire Line
	8150 5950 8100 5950
Wire Wire Line
	8100 5850 8150 5850
Wire Wire Line
	8150 5750 8100 5750
Wire Wire Line
	8100 5650 8150 5650
Wire Wire Line
	8150 5550 8100 5550
Wire Wire Line
	8100 5450 8150 5450
Wire Wire Line
	8150 5350 8100 5350
Wire Wire Line
	8100 5250 8150 5250
Wire Wire Line
	8150 5150 8100 5150
Wire Wire Line
	8100 5050 8150 5050
Wire Wire Line
	8150 4950 8100 4950
Wire Wire Line
	8100 4850 8150 4850
Wire Wire Line
	8150 4750 8100 4750
Wire Wire Line
	8100 4650 8150 4650
Wire Wire Line
	8150 4550 8100 4550
Wire Bus Line
	8000 6000 6400 6000
Wire Wire Line
	10200 3150 10450 3150
Wire Wire Line
	10200 3250 10450 3250
Text Label 10450 3150 0    50   ~ 0
RSP
Text Label 10450 3250 0    50   ~ 0
RSN
Text Label 7400 2150 0    50   ~ 0
RSN
Text Label 7400 1950 0    50   ~ 0
RSP
$Sheet
S 850  3550 1450 450 
U 5F782F71
F0 "connector" 50
F1 "connector.sch" 50
$EndSheet
$Sheet
S 9650 2500 550  850 
U 5FA9324B
F0 "Sheet5FA9324A" 50
F1 "Drivers.sch" 50
F2 "GD0" I L 9650 2550 50 
F3 "GD1" I L 9650 2650 50 
F4 "GD2" I L 9650 2750 50 
F5 "GD3" I L 9650 2850 50 
F6 "OUT0" I L 9650 2950 50 
F7 "OUT1" I L 9650 3050 50 
F8 "OUT2" I L 9650 3150 50 
F9 "OUT3" I L 9650 3250 50 
F10 "FB0" I R 10200 2550 50 
F11 "FB1" I R 10200 2650 50 
F12 "FB2" I R 10200 2750 50 
F13 "FB3" I R 10200 2850 50 
F14 "RSP" I R 10200 3150 50 
F15 "RSN" I R 10200 3250 50 
$EndSheet
Wire Wire Line
	9300 2650 9300 3250
Wire Wire Line
	9300 3250 9650 3250
Wire Wire Line
	9350 3150 9350 2550
Wire Wire Line
	9350 3150 9650 3150
Wire Wire Line
	9100 2550 9350 2550
Wire Wire Line
	9400 2450 9400 3050
Wire Wire Line
	9400 3050 9650 3050
Wire Wire Line
	9100 2450 9400 2450
Wire Wire Line
	9500 2950 9500 2350
Wire Wire Line
	9100 2350 9500 2350
Wire Wire Line
	9600 2550 9600 1450
Wire Wire Line
	9100 1450 9600 1450
Wire Wire Line
	9550 1550 9550 2650
Wire Wire Line
	9550 2650 9650 2650
Wire Wire Line
	9100 1550 9550 1550
Wire Wire Line
	9450 2750 9650 2750
Wire Wire Line
	9100 1650 9450 1650
Wire Wire Line
	9450 1650 9450 2750
Wire Wire Line
	9400 1750 9400 2300
Wire Wire Line
	9400 2300 9200 2300
Wire Wire Line
	9200 2300 9200 2850
Wire Wire Line
	9200 2850 9650 2850
Wire Wire Line
	10800 2550 10800 4300
Wire Wire Line
	7100 4300 7100 3050
Wire Wire Line
	7100 3050 7500 3050
Wire Wire Line
	10200 2550 10800 2550
Wire Wire Line
	10800 4300 7100 4300
Wire Wire Line
	10750 2650 10750 4350
Wire Wire Line
	10750 4350 7150 4350
Wire Wire Line
	7150 4350 7150 3150
Wire Wire Line
	10200 2650 10750 2650
Wire Wire Line
	7150 3150 7500 3150
Wire Wire Line
	7050 3250 7050 4400
Wire Wire Line
	7050 4400 10700 4400
Wire Wire Line
	10700 4400 10700 2750
Wire Wire Line
	7050 3250 7500 3250
Wire Wire Line
	10200 2750 10700 2750
Wire Wire Line
	10650 2850 10650 4450
Wire Wire Line
	6950 4450 6950 3350
Wire Wire Line
	6950 3350 7500 3350
Wire Wire Line
	10200 2850 10650 2850
$Comp
L Power_Protection:USB6B1 U2
U 1 1 5F749CD6
P 2100 6000
F 0 "U2" H 2100 6481 50  0000 C CNN
F 1 "USB6B1" H 2100 6390 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 2100 6000 50  0001 C CNN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/3e/ec/b2/54/b2/76/47/90/CD00001361.pdf/files/CD00001361.pdf/jcr:content/translations/en.CD00001361.pdf" H 1150 5900 50  0001 C CNN
	1    2100 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 4450 10650 4450
Wire Bus Line
	7250 2450 7250 7000
Wire Bus Line
	3950 3500 3950 7000
Wire Bus Line
	6400 1400 6400 6000
Wire Bus Line
	8000 4450 8000 6000
$EndSCHEMATC
