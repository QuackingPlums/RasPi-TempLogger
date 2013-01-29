. rrd.conf

rrdtool graph test.png \
	--start N-180000 \
	DEF:temp=RasPi-TempLogger.rrd:temp:AVERAGE \
	LINE2:temp$TOOWARMCOLOUR

rrdtool graph test2.png \
	--start N-180000 \
	DEF:temp=RasPi-TempLogger.rrd:temp:AVERAGE \
	CDEF:ok=temp,$UPPERTHRESHOLD,MIN \
	CDEF:toocool=temp,$LOWERTHRESHOLD,MIN \
	AREA:temp$TOOWARMCOLOUR:"Too warm" \
	AREA:ok$JUSTRIGHTCOLOUR:"Ok" \
	AREA:toocool$TOOCOOLCOLOUR:"Too cool"

rrdtool graph test3.png \
	--start N-180000 \
	DEF:temp=RasPi-TempLogger.rrd:temp:AVERAGE \
	CDEF:ok=temp,$LOWERTHRESHOLD,$UPPERTHRESHOLD,LIMIT \
	CDEF:toocool=temp,0,$LOWERTHRESHOLD,LIMIT \
	AREA:temp$TOOWARMCOLOUR:"Too warm" \
	AREA:ok$JUSTRIGHTCOLOUR:"Ok" \
	AREA:toocool$TOOCOOLCOLOUR:"Too cool"

rrdtool graph test4.png \
	--start N-180000 \
	DEF:temp=RasPi-TempLogger.rrd:temp:AVERAGE \
	CDEF:nocolour=temp,$LOWERTHRESHOLD,LE,temp,$LOWERTHRESHOLD,IF \
	CDEF:toocool=temp,$LOWERTHRESHOLD,LE,$LOWERTHRESHOLD,temp,-,UNKN,IF \
	CDEF:justright=temp,$LOWERTHRESHOLD,GT,temp,$UPPERTHRESHOLD,GT,$UPPERTHRESHOLD,$LOWERTHRESHOLD,-,temp,$LOWERTHRESHOLD,-,IF,UNKN,IF \
	CDEF:toowarm=temp,$UPPERTHRESHOLD,GT,temp,$UPPERTHRESHOLD,-,UNKN,IF \
	AREA:nocolour$NOCOLOUR:: \
	AREA:toocool$TOOCOOLCOLOUR:"Too cool":STACK \
	AREA:justright$JUSTRIGHTCOLOUR:"Ok":STACK \
	AREA:toowarm$TOOWARMCOLOUR:"Too warm":STACK
