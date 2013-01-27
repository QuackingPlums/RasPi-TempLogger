rrdtool graph test.png \
	--start N-180000 \
	DEF:temp=RasPi-TempLogger.rrd:temp:AVERAGE \
	LINE2:temp#FF0000

rrdtool graph test2.png \
	--start N-180000 \
	DEF:temp=RasPi-TempLogger.rrd:temp:AVERAGE \
	CDEF:ok=temp,24,MIN \
	CDEF:toocool=temp,17,MIN \
	AREA:temp#FF0000:"Too warm" \
	AREA:ok#00FF00:"Ok" \
	AREA:toocool#0000FF:"Too cool"

rrdtool graph test3.png \
	--start N-180000 \
	DEF:temp=RasPi-TempLogger.rrd:temp:AVERAGE \
	CDEF:ok=temp,17,24,LIMIT \
	CDEF:toocool=temp,0,17,LIMIT \
	AREA:temp#FF0000:"Too warm" \
	AREA:ok#00FF00:"Ok" \
	AREA:toocool#0000FF:"Too cool"

rrdtool graph test4.png \
	--start N-180000 \
	DEF:temp=RasPi-TempLogger.rrd:temp:AVERAGE \
	CDEF:nocolour=temp,17,LE,temp,17,IF \
	CDEF:toocool=temp,17,LE,17,temp,-,UNKN,IF \
	CDEF:justright=temp,17,GT,temp,24,GT,7,temp,17,-,IF,UNKN,IF \
	CDEF:toowarm=temp,24,GT,temp,24,-,UNKN,IF \
	AREA:nocolour#FFFFFFAA:: \
	AREA:toocool#0000FFAA:"Too cool":STACK \
	AREA:justright#00FF00AA:"Ok":STACK \
	AREA:toowarm#FF0000AA:"Too warm":STACK
