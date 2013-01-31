rrdtool create RasPi-TempLogger.rrd	\
	--start N-31536000	\
	--step 300	\
	DS:temp:GAUGE:600:U:U	\
	DS:outtemp:GAUGE:600:U:U \
	RRA:AVERAGE:0.5:1:288	\
	RRA:AVERAGE:0.5:12:168	\
	RRA:AVERAGE:0.5:48:180	\
	RRA:AVERAGE:0.5:144:360	\
	RRA:AVERAGE:0.5:288:365	\
	RRA:MAX:0.5:144:14

# Do I even need these? They're the same resolution as existing archives, right?
# RRA:AVERAGE:0.5:1:12	\
# RRA:AVERAGE:0.5:1:96	\
# RRA:AVERAGE:0.5:144:180	\