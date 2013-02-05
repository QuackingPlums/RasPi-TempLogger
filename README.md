# RasPi-TempLogger

A simple temperature logger for my RasPi, running on Adafruit Occidentalis v0.2

## Hardware setup
**Required:**  
1x DS18B20 digital temperature sensor  
1x 4K7 resistor  

**Connecting the DS18B20:**  
Connect pin 1 (GND) on the 18B20 to pin 6 (GND) on the RPi.  
Connect pin 2 (DQ) on the 18B20 to pin 7 (GPIO4) on the RPi.  
Connect pin 3 (VDD) on the 18B20 to pin 1 (3V3) on the RPi.  
Put the 4k7 resistor between pins 2 and 3 on the 18B20.  

**Install LKMs:**  
1-wire GPIO driver:  
`sudo modprobe w1-gpio`  
1-wire generic thermal sensor driver:  
`sudo modprobe w1-therm`  

**Test the sensor:**  
You can now test the sensor by issuing the following command:  
`cat /sys/bus/w1/devices/28-*/w1_slave`  

## Environment pre-requisites  
**git** source control (1.7.10 or later if you want to use https)  
`sudo apt-get install git-core`  
**libwww** Perl web library  
`sudo apt-get install libwww-perl`  
**rrdtool** round-robin database tool  
`sudo apt-get install rrdtool`  
**lighttpd** lightweight web server  
`sudo apt-get install lighttpd`  
- Set owner and group permissions on webroot  
`sudo chown www-data:www-data /var/www`  
- Allow the group to write to the directory  
`sudo chmod 775 /var/www`  
- Add the pi user to the www-data group  
`sudo usermod -a -G www-data pi`  

**PHP 5**  
	sudo apt-get install php5-common php5-cgi php5
	sudo lighty-enable-mod fastcgi fastcgi-php
	sudo service lighttpd force-reload  

**Configuration**  
Grab a sample config or create a fresh one using the template  
`cp ./sample.confs/rrd.conf.meteo ./rrd.conf`  
Check that the config paths point to the correct locations
	
## Application setup  
**Create a new RRD database:**  
`./create_db.sh`  
NB: running this script creates a NEW RRD every time, wiping the existing one!

**[OPTIONAL] Create test data:**  
Run this script to fill the RRD with random data  
`./create_test_data.sh`  

**[OPTIONAL] Verify test data:**  
Run this script to check that the test data has been loaded  
`./fetch_1wk.sh`  

**[OPTIONAL] Create test graphs:**  
Run this script to create some test graphs (creates .PNG files in various different styles).  
`./create_test_graphs.sh`  



**Setup cron job:**  
Copy sample cron-file.txt and configure paths to point at the correct locations.  
`cp sample.confs/cron-file.template .`  
Install cron job and verify crontab 
	crontab cron-file.txt  
	crontab -l  

