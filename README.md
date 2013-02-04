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

1-wire GPIO driver `sudo modprobe w1-gpio`  
1-wire generic thermal sensor driver `sudo modprobe w1-therm`  

You can then test the sensor by issuing the following command:  
`cat /sys/bus/w1/devices/28-*/w1_slave`  

## Environment setup
**Pre-requisites:**  
Source control tool (1.7.10 or later if you want to use https) `sudo apt-get install git-core`  
Perl web library `sudo apt-get install libwww-perl`  
Round-robin database toold `sudo apt-get install rrdtool`  
Lightweight web server `sudo apt-get install lighttpd`  
PHP  
    sudo apt-get install php5-common php5-cgi php5  
    sudo lighty-enable-mod fastcgi fastcgi-php  
    sudo service lighttpd force-reload  

Copy ./sample.confs/rrd.conf.meteo to ./rrd.conf or create a new one using the template.  

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

** Set permissions on webroot: **
Change webroot owner and group    
`sudo chown www-data:www-data /var/www`  
Allow the group to write to the directory  
`sudo chmod 775 /var/www`  
Add the pi user to the www-data group  
`sudo usermod -a -G www-data pi`  

**Setup cron job:**  
Copy sample cron-file.txt and configure paths to point at the correct locations.  
Install cron job and verify crontab   
        crontab cron-file.txt  
        crontab -l  

