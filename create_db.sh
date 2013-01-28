rrdtool create RasPi-TempLogger.rrd	\
	--start N-31536000		\
	--step 300			\
	DS:temp:GAUGE:900:U:U		\
	RRA:AVERAGE:0.9:1:12		\
	RRA:AVERAGE:0.9:1:288		\
	RRA:AVERAGE:0.9:12:168		\
	RRA:AVERAGE:0.9:12:720		\
	RRA:AVERAGE:0.9:288:365

	#DS:outtemp:GAUGE:600:U:U	\
