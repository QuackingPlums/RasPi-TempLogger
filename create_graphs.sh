. rrd.conf

# Hourly
rrdtool graph hourly.png \
	--start -8h \
	-c "BACK$RRD_BACK" \
	-c "SHADEA$RRD_SHADEA" \
	-c "SHADEB$RRD_SHADEB" \
	-c "FONT$RRD_FONT" \
	-c "CANVAS$RRD_CANVAS" \
	-c "GRID$RRD_GRID" \
	-c "MGRID$RRD_MGRID" \
	-c "FRAME$RRD_FRAME" \
	-c "ARROW$RRD_ARROW" \
	DEF:temp=RasPi-TempLogger.rrd:temp:AVERAGE \
	CDEF:nocolour=temp,$LOWERTHRESHOLD,LE,temp,$LOWERTHRESHOLD,IF \
	CDEF:toocool=temp,$LOWERTHRESHOLD,LE,$LOWERTHRESHOLD,temp,-,UNKN,IF \
	CDEF:justright=temp,$LOWERTHRESHOLD,GT,temp,$UPPERTHRESHOLD,GT,$UPPERTHRESHOLD,$LOWERTHRESHOLD,-,temp,$LOWERTHRESHOLD,-,IF,UNKN,IF \
	CDEF:toowarm=temp,$UPPERTHRESHOLD,GT,temp,$UPPERTHRESHOLD,-,UNKN,IF \
	AREA:nocolour$NOCOLOUR:: \
	AREA:toocool$TOOCOOLCOLOUR:"Too cool":STACK \
	AREA:justright$JUSTRIGHTCOLOUR:"Ok":STACK \
	AREA:toowarm$TOOWARMCOLOUR:"Too warm":STACK \
	LINE1:temp$INDOORTEMP:"Indoor temperature [deg C]"
	
	
