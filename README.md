# RasPi-TempLogger

A simple temperature logger for my RasPi, running on Adafruit Occidentalis v0.2

## Dev environment setup
**Pre-requisites:**  
git (1.7.10 or later if you want to use https) `sudo apt-get install git-core`  
libwww-perl `sudo apt-get install libwww-perl`  
rrdtool `sudo apt-get install rrdtool`  
apache2 (may already be installed) `sudo apt-get install apache2`  

**Create a new RRD database:**  
`./create_db.sh`  
NB: running this script creates a NEW RRD every time, wiping the existing one!

**[OPTIONAL] Create test data:**  
`./create_test_data.sh`  

**[OPTIONAL] Verify test data:**  
`./fetch_1wk.sh`  

**[OPTIONAL] Create test graphs:**  
`./create_test_graphs.sh`  
Creates .PNG files in various different styles.  

## Hardware setup
**Required:**  
1x DS18B20 digital temperature sensor  
1x 4K7 resistor  

**Connecting the DS18B20:**  
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

**Setup cron job:**  
Configure paths in cron-file.txt to point to correct locations.  
Install cron job into crontab `crontab -l`  

**Setup web server:**  
(php files)  

Copy ./sample.confs/rrd.conf.meteo to ./rrd.conf or create a new one using the template.  
