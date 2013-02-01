rrdtool create RasPi-TempLogger.rrd	\
	--start N-31536000	\
	--step 300	\
	DS:temp:GAUGE:600:U:U	\
	DS:outtemp:GAUGE:600:U:U \
	RRA:AVERAGE:0.5:1:288	\
	RRA:AVERAGE:0.5:12:168	\
	RRA:AVERAGE:0.5:48:186	\
	RRA:AVERAGE:0.5:144:366	\
	RRA:AVERAGE:0.5:288:366	\
	RRA:MAX:0.5:12:168 RRA:MIN:0.5:12:168 \
	RRA:MAX:0.5:48:186 RRA:MIN:0.5:48:186 \
	RRA:MAX:0.5:144:366 RRA:MIN:0.5:144:366 \
	RRA:MAX:0.5:288:366 RRA:MIN:0.5:288:366

# RRA:CF:xff:1:288	every (5 minute) sample up to 1d
# RRA:CF:xff:12:168	hourly consolidation up to 7d
# RRA:CF:xff:48:186	4-hourly consolidation up to 31d (~1m)
# RRA:CF:xff:144:366	12-hourly consolidation up to 183d (~6m)
# RRA:CF:xff:288:366	daily consolidation up to 365d (1y)