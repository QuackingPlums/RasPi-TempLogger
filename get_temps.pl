#!/usr/bin/perl
################################################################################
# Grab the current reading from the DS18B20 digital temperature sensor and parse
# the latest METAR local weather report for external temperature.
# Log both values into the RRD.
# 
# Schedule this script to run every 5 minutes.
################################################################################
use LWP::UserAgent;
use File::Copy;
use Time::Piece ();


# Nearest METAR station code (usually an airport).
# Full list of stations available at: http://weather.rap.ucar.edu/surface/stations.txt
$metar_station_code = 'EGVN'; # EGVN = Brize Norton, UK

$path_to_rrdtool = '/usr/bin/rrdtool';
$path_to_scripts = '/home/pi/dev/RasPi-TempLogger';
$path_to_webroot = '/var/www';


print "get_temps.pl started at: " . Time::Piece::localtime->strftime('%F %T') . "\n";

my $outdoorTemp = getOutdoorTemp();
my $indoorTemp = getIndoorTemp();

logTemps($outdoorTemp, $indoorTemp);

createGraphs();

moveGraphsToWebroot();


################################################################################

sub moveGraphsToWebroot
{
	my $src = $path_to_scripts . '/*.png';
	my $dest = $path_to_webroot . '/';

	for my $file (glob $src)
	{
		print "Moving " . $file . " to " . $dest . "\n";
		move ($file, $dest) or die $!;
	}
}

sub createGraphs
{
	chdir $path_to_scripts;
	system ("./create_graphs.sh");
	print "Graphs created.\n";
}

sub logTemps
{
	($outdoorTemp, $indoorTemp) = @_;
	$rrd = `$path_to_rrdtool update $path_to_scripts/RasPi-TempLogger.rrd N:$indoorTemp:$outdoorTemp`;
	print "Temps logged in RRD.\n";
}

sub getIndoorTemp
{
	checkModules();
	
	return getSensorReading();
}

sub checkModules
{
	# Check for GPIO and w1_therm LKMs and load if necessary
	my $modules = `cat /proc/modules`;
	if ($modules !~ /w1_therm/)
	{
		$therm = `sudo modprobe w1-therm`;
	}
	if ($modules !~ /w1_gpio/)
	{
		$gpio = `sudo modprobe w1-gpio`;
	}
}

sub getSensorReading
{
	# Try up to 5 times to get a valid reading
	my $sensorReading = '';
	my $attempt = 1;
	while ($sensorReading !~ /YES/g && $attempt <= 5)
	{
		# Poll the sensor; it will return something like this if successful
		# 2d 00 4B 46 ff ff 08 10 fe : crc=fe YES
		# 2d 00 4B 46 ff ff 08 10 fe : t=22250 <-- this is the temperature in C * 1000
		$sensorReading = `sudo cat /sys/bus/w1/devices/28-*/w1_slave 2>&1`;
		
		#if ($attempt == 5) { $sensorReading = "YES 2d 00 4B 46 ff ff 08 10 fe : t=22250";}

		if($sensorReading =~ /No such file or directory/)
		{
			print "Could not find DS18B20\n";
			last;
		}
		elsif($sensorReading =~ /YES/g)
		{
			print "Sensor reading: attempt " . $attempt . " succeeded.\n";
			$sensorReading =~ /t=(\d+)/i; # Find the digits following "t="
			return $1 / 1000; # Sensor value is degrees C * 1000
		}
		
		print "Sensor reading: attempt " . $attempt . " failed.\n";
		$attempt++;
	}
	
	die "Unable to obtain a valid sensor reading.\n";
}

sub getOutdoorTemp
{
	my $metar = getMetar();
	print "Latest METAR from " . $metar_station_code .":\n" . $metar;

	writeToFile('>' . $path_to_scripts . '/METAR.txt', $metar);

	$metar =~ /([\s|M])(\d{2})\//g; #international METAR format: http://en.wikipedia.org/wiki/METAR

	$outdoortemp = ($1 eq 'M') ? $2 * -1 : $2;
	
	return $outdoortemp;
}

sub getMetar
{
	my $metar_url = 'http://weather.noaa.gov/pub/data/observations/metar/stations/' . $metar_station_code . '.TXT';

	# Grab the METAR from NOAA
	my $ua = new LWP::UserAgent;
	$ua->timeout(120);
	my $request = new HTTP::Request('GET', $metar_url);
	my $response = $ua->request($request);
	return $response->content();
	
#	return 'EGVN 291150Z 22010KT 9999 -RA FEW008 BKN012 13/11 Q1002 GRN TEMPO 7000 -RADZ GRN';
}

sub writeToFile
{
	($filename, $content) = @_;
	
	open (OUTPUTFILE, $filename);
	print OUTPUTFILE $content;
	close (OUTPUTFILE);
}