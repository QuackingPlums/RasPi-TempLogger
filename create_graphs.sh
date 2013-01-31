. rrd.conf

# 1 hour
rrdtool graph 1h.png \
	--start -1h \
	-c "BACK$RRD_BACK" \
	-c "SHADEA$RRD_SHADEA" \
	-c "SHADEB$RRD_SHADEB" \
	-c "FONT$RRD_FONT" \
	-c "CANVAS$RRD_CANVAS" \
	-c "AXIS$RRD_AXIS" \
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
	LINE1:temp$INDOORTEMP:"Indoor temperature [deg C]" \
	DEF:outtemp=RasPi-TempLogger.rrd:outtemp:AVERAGE \
	LINE1:outtemp$OUTDOORTEMP:"Outdoor temperature [deg C]"

# 8 hours
rrdtool graph 8h.png \
	--start -8h \
	-c "BACK$RRD_BACK" \
	-c "SHADEA$RRD_SHADEA" \
	-c "SHADEB$RRD_SHADEB" \
	-c "FONT$RRD_FONT" \
	-c "CANVAS$RRD_CANVAS" \
	-c "AXIS$RRD_AXIS" \
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
	LINE1:temp$INDOORTEMP:"Indoor temperature [deg C]" \
	DEF:outtemp=RasPi-TempLogger.rrd:outtemp:AVERAGE \
	LINE1:outtemp$OUTDOORTEMP:"Outdoor temperature [deg C]"

# 1 day
rrdtool graph 1d.png \
	--start -1d \
	-c "BACK$RRD_BACK" \
	-c "SHADEA$RRD_SHADEA" \
	-c "SHADEB$RRD_SHADEB" \
	-c "FONT$RRD_FONT" \
	-c "CANVAS$RRD_CANVAS" \
	-c "AXIS$RRD_AXIS" \
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
	LINE1:temp$INDOORTEMP:"Indoor temperature [deg C]" \
	DEF:outtemp=RasPi-TempLogger.rrd:outtemp:AVERAGE \
	LINE1:outtemp$OUTDOORTEMP:"Outdoor temperature [deg C]"

# 1 week
rrdtool graph 1w.png \
	--start -1w \
	-c "BACK$RRD_BACK" \
	-c "SHADEA$RRD_SHADEA" \
	-c "SHADEB$RRD_SHADEB" \
	-c "FONT$RRD_FONT" \
	-c "CANVAS$RRD_CANVAS" \
	-c "AXIS$RRD_AXIS" \
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
	LINE1:temp$INDOORTEMP:"Indoor temperature [deg C]" \
	DEF:outtemp=RasPi-TempLogger.rrd:outtemp:AVERAGE \
	LINE1:outtemp$OUTDOORTEMP:"Outdoor temperature [deg C]"

# 30 days
rrdtool graph 30d.png \
	--start -30d \
	-c "BACK$RRD_BACK" \
	-c "SHADEA$RRD_SHADEA" \
	-c "SHADEB$RRD_SHADEB" \
	-c "FONT$RRD_FONT" \
	-c "CANVAS$RRD_CANVAS" \
	-c "AXIS$RRD_AXIS" \
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
	LINE1:temp$INDOORTEMP:"Indoor temperature [deg C]" \
	DEF:outtemp=RasPi-TempLogger.rrd:outtemp:AVERAGE \
	LINE1:outtemp$OUTDOORTEMP:"Outdoor temperature [deg C]"

# 90 days
rrdtool graph 90d.png \
	--start -90d \
	-c "BACK$RRD_BACK" \
	-c "SHADEA$RRD_SHADEA" \
	-c "SHADEB$RRD_SHADEB" \
	-c "FONT$RRD_FONT" \
	-c "CANVAS$RRD_CANVAS" \
	-c "AXIS$RRD_AXIS" \
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
	LINE1:temp$INDOORTEMP:"Indoor temperature [deg C]" \
	DEF:outtemp=RasPi-TempLogger.rrd:outtemp:AVERAGE \
	LINE1:outtemp$OUTDOORTEMP:"Outdoor temperature [deg C]"

# 6 months
rrdtool graph 6m.png \
	--start -6m \
	-c "BACK$RRD_BACK" \
	-c "SHADEA$RRD_SHADEA" \
	-c "SHADEB$RRD_SHADEB" \
	-c "FONT$RRD_FONT" \
	-c "CANVAS$RRD_CANVAS" \
	-c "AXIS$RRD_AXIS" \
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
	LINE1:temp$INDOORTEMP:"Indoor temperature [deg C]" \
	DEF:outtemp=RasPi-TempLogger.rrd:outtemp:AVERAGE \
	LINE1:outtemp$OUTDOORTEMP:"Outdoor temperature [deg C]"

# 1 year
rrdtool graph 1y.png \
	--start -1y \
	-c "BACK$RRD_BACK" \
	-c "SHADEA$RRD_SHADEA" \
	-c "SHADEB$RRD_SHADEB" \
	-c "FONT$RRD_FONT" \
	-c "CANVAS$RRD_CANVAS" \
	-c "AXIS$RRD_AXIS" \
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
	LINE1:temp$INDOORTEMP:"Indoor temperature [deg C]" \
	DEF:outtemp=RasPi-TempLogger.rrd:outtemp:AVERAGE \
	LINE1:outtemp$OUTDOORTEMP:"Outdoor temperature [deg C]"

