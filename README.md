# RasPi-TempLogger

A simple temperature logger for my RasPi, running on Adafruit Occidentalis v0.2

## Dev environment setup
Pre-requisites:  
libwww-perl `sudo apt-get install libwww-perl`  
rrdtool `sudo apt-get install rrdtool`

Create database (once):  
(run script)

Create test data:  
(run script)

## Hardware setup
Required:  
1x DS18B20 digital temperature sensor  
1x 4K7 resistor  

Connecting the DS18B20:  
Connect pin 1 (GND) on the 18B20 to pin 6 (GND) on the RPi.  
Connect pin 2 (DQ) on the 18B20 to pin 7 (GPIO4) on the RPi.  
Connect pin 3 (VDD) on the 18B20 to pin 1 (3V3) on the RPi.  
Put the 4k7 resistor between pins 2 and 3 on the 18B20.  

1-wire GPIO driver `sudo modprobe w1-gpio`  
1-wire generic thermal sensor driver `sudo modprobe w1-therm`  

You can then test the sensor by issuing the following command:  
`cat /sys/bus/w1/devices/28-*/w1_slave`  

## Deploy
Install pre-requisites as per dev environment.  

Setup cron jobs:  
(scripts)

Setup web server:  
(php files)

