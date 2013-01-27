rrdtool create RasPi-TempLogger.rrd	\
	--start N-31536000		\
	--step 600			\
	DS:temp:GAUGE:1200:U:U		\
	RRA:AVERAGE:0.5:1:12		\
	RRA:AVERAGE:0.9:1:288		\
	RRA:AVERAGE:0.9:12:168		\
	RRA:AVERAGE:0.9:12:720		\
	RRA:AVERAGE:0.9:288:365

	#DS:outtemp:GAUGE:600:U:U	\
