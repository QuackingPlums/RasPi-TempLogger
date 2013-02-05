#!/bin/bash
. rrd.conf

rm *.png

# 1 hour
rrdtool graph 1h.png \
	--start -1h \
	--title "Last 60 minutes" \
	--vertical-label "degrees C" \
	--watermark "©QuackingPlums January 2013" \
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
	CDEF:shading0=temp,0.125,*  AREA:shading0#C6E6E600::STACK \
	CDEF:shading1=temp,0.125,*  AREA:shading1#C6E6E620::STACK \
	CDEF:shading2=temp,0.125,*  AREA:shading2#C6E6E640::STACK \
	CDEF:shading3=temp,0.125,*  AREA:shading3#C6E6E660::STACK \
	CDEF:shading4=temp,0.125,*  AREA:shading4#C6E6E680::STACK \
	CDEF:shading5=temp,0.125,*  AREA:shading5#C6E6E69F::STACK \
	CDEF:shading6=temp,0.125,*  AREA:shading6#C6E6E6BF::STACK \
	CDEF:shading7=temp,0.125,*  AREA:shading7#C6E6E6DF::STACK \
	CDEF:shading8=temp,0.125,*  AREA:shading8#C6E6E6FF::STACK \
	LINE1:temp$INDOORTEMPCOLOUR:"Indoor temperature" \
	DEF:outtemp=RasPi-TempLogger.rrd:outtemp:AVERAGE \
	LINE1:outtemp$OUTDOORTEMPCOLOUR:"Outdoor temperature      " \
	HRULE:$UPPERTHRESHOLD$UPPERTHRESHOLDCOLOUR:"Upper comfort limit [$UPPERTHRESHOLD""C]" \
	HRULE:$LOWERTHRESHOLD$LOWERTHRESHOLDCOLOUR:"Lower comfort limit [$LOWERTHRESHOLD""C]" \
	>/dev/null

# 8 hours
rrdtool graph 8h.png \
	--start -8h \
	--title "Last 8 hours" \
	--vertical-label "degrees C" \
	--watermark "©QuackingPlums January 2013" \
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
	CDEF:shading0=temp,0.125,*  AREA:shading0#C6E6E600::STACK \
	CDEF:shading1=temp,0.125,*  AREA:shading1#C6E6E620::STACK \
	CDEF:shading2=temp,0.125,*  AREA:shading2#C6E6E640::STACK \
	CDEF:shading3=temp,0.125,*  AREA:shading3#C6E6E660::STACK \
	CDEF:shading4=temp,0.125,*  AREA:shading4#C6E6E680::STACK \
	CDEF:shading5=temp,0.125,*  AREA:shading5#C6E6E69F::STACK \
	CDEF:shading6=temp,0.125,*  AREA:shading6#C6E6E6BF::STACK \
	CDEF:shading7=temp,0.125,*  AREA:shading7#C6E6E6DF::STACK \
	CDEF:shading8=temp,0.125,*  AREA:shading8#C6E6E6FF::STACK \
	LINE1:temp$INDOORTEMPCOLOUR:"Indoor temperature" \
	DEF:outtemp=RasPi-TempLogger.rrd:outtemp:AVERAGE \
	LINE1:outtemp$OUTDOORTEMPCOLOUR:"Outdoor temperature      " \
	HRULE:$UPPERTHRESHOLD$UPPERTHRESHOLDCOLOUR:"Upper comfort limit [$UPPERTHRESHOLD""C]" \
	HRULE:$LOWERTHRESHOLD$LOWERTHRESHOLDCOLOUR:"Lower comfort limit [$LOWERTHRESHOLD""C]" \
	>/dev/null

# 1 day
rrdtool graph 1d.png \
	--start -1d \
	--title "Last 24 hours" \
	--vertical-label "degrees C" \
	--watermark "©QuackingPlums January 2013" \
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
	CDEF:shading0=temp,0.125,*  AREA:shading0#C6E6E600::STACK \
	CDEF:shading1=temp,0.125,*  AREA:shading1#C6E6E620::STACK \
	CDEF:shading2=temp,0.125,*  AREA:shading2#C6E6E640::STACK \
	CDEF:shading3=temp,0.125,*  AREA:shading3#C6E6E660::STACK \
	CDEF:shading4=temp,0.125,*  AREA:shading4#C6E6E680::STACK \
	CDEF:shading5=temp,0.125,*  AREA:shading5#C6E6E69F::STACK \
	CDEF:shading6=temp,0.125,*  AREA:shading6#C6E6E6BF::STACK \
	CDEF:shading7=temp,0.125,*  AREA:shading7#C6E6E6DF::STACK \
	CDEF:shading8=temp,0.125,*  AREA:shading8#C6E6E6FF::STACK \
	LINE1:temp$INDOORTEMPCOLOUR:"Indoor temperature" \
	DEF:outtemp=RasPi-TempLogger.rrd:outtemp:AVERAGE \
	LINE1:outtemp$OUTDOORTEMPCOLOUR:"Outdoor temperature      " \
	HRULE:$UPPERTHRESHOLD$UPPERTHRESHOLDCOLOUR:"Upper comfort limit [$UPPERTHRESHOLD""C]" \
	HRULE:$LOWERTHRESHOLD$LOWERTHRESHOLDCOLOUR:"Lower comfort limit [$LOWERTHRESHOLD""C]" \
	>/dev/null

# 7 days
rrdtool graph 7d.png \
	--start -7d \
	--title "Last 7 days" \
	--vertical-label "degrees C" \
	--watermark "©QuackingPlums January 2013" \
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
	DEF:maxtemp=RasPi-TempLogger.rrd:temp:MAX \
	DEF:mintemp=RasPi-TempLogger.rrd:temp:MIN \
	CDEF:shading0=mintemp  AREA:shading0#C6E6E620::STACK \
	CDEF:shading1=maxtemp,mintemp,-,0.25,*  AREA:shading1#C6E6E670::STACK \
	CDEF:shading2=maxtemp,mintemp,-,0.25,*  AREA:shading2#C6E6E6A0::STACK \
	CDEF:shading3=maxtemp,mintemp,-,0.25,*  AREA:shading3#C6E6E6CF::STACK \
	CDEF:shading4=maxtemp,mintemp,-,0.25,*  AREA:shading4#C6E6E6FF::STACK \
	DEF:temp=RasPi-TempLogger.rrd:temp:AVERAGE \
	LINE1:temp$INDOORTEMPCOLOUR:"Indoor temperature" \
	DEF:outtemp=RasPi-TempLogger.rrd:outtemp:AVERAGE \
	LINE1:outtemp$OUTDOORTEMPCOLOUR:"Outdoor temperature      " \
	HRULE:$UPPERTHRESHOLD$UPPERTHRESHOLDCOLOUR:"Upper comfort limit [$UPPERTHRESHOLD""C]" \
	HRULE:$LOWERTHRESHOLD$LOWERTHRESHOLDCOLOUR:"Lower comfort limit [$LOWERTHRESHOLD""C]" \
	>/dev/null

# 30 days
rrdtool graph 30d.png \
	--start -30d \
	--title "Last 30 days" \
	--vertical-label "degrees C" \
	--watermark "©QuackingPlums January 2013" \
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
	DEF:maxtemp=RasPi-TempLogger.rrd:temp:MAX \
	DEF:mintemp=RasPi-TempLogger.rrd:temp:MIN \
	CDEF:shading0=mintemp  AREA:shading0#C6E6E620::STACK \
	CDEF:shading1=maxtemp,mintemp,-,0.25,*  AREA:shading1#C6E6E670::STACK \
	CDEF:shading2=maxtemp,mintemp,-,0.25,*  AREA:shading2#C6E6E6A0::STACK \
	CDEF:shading3=maxtemp,mintemp,-,0.25,*  AREA:shading3#C6E6E6CF::STACK \
	CDEF:shading4=maxtemp,mintemp,-,0.25,*  AREA:shading4#C6E6E6FF::STACK \
	DEF:temp=RasPi-TempLogger.rrd:temp:AVERAGE \
	LINE1:temp$INDOORTEMPCOLOUR:"Indoor temperature" \
	DEF:outtemp=RasPi-TempLogger.rrd:outtemp:AVERAGE \
	LINE1:outtemp$OUTDOORTEMPCOLOUR:"Outdoor temperature      " \
	HRULE:$UPPERTHRESHOLD$UPPERTHRESHOLDCOLOUR:"Upper comfort limit [$UPPERTHRESHOLD""C]" \
	HRULE:$LOWERTHRESHOLD$LOWERTHRESHOLDCOLOUR:"Lower comfort limit [$LOWERTHRESHOLD""C]" \
	>/dev/null

# 90 days
rrdtool graph 90d.png \
	--start -90d \
	--title "Last 90 days" \
	--vertical-label "degrees C" \
	--watermark "©QuackingPlums January 2013" \
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
	DEF:maxtemp=RasPi-TempLogger.rrd:temp:MAX \
	DEF:mintemp=RasPi-TempLogger.rrd:temp:MIN \
	CDEF:shading0=mintemp  AREA:shading0#C6E6E620::STACK \
	CDEF:shading1=maxtemp,mintemp,-,0.25,*  AREA:shading1#C6E6E670::STACK \
	CDEF:shading2=maxtemp,mintemp,-,0.25,*  AREA:shading2#C6E6E6A0::STACK \
	CDEF:shading3=maxtemp,mintemp,-,0.25,*  AREA:shading3#C6E6E6CF::STACK \
	CDEF:shading4=maxtemp,mintemp,-,0.25,*  AREA:shading4#C6E6E6FF::STACK \
	DEF:temp=RasPi-TempLogger.rrd:temp:AVERAGE \
	LINE1:temp$INDOORTEMPCOLOUR:"Indoor temperature" \
	DEF:outtemp=RasPi-TempLogger.rrd:outtemp:AVERAGE \
	LINE1:outtemp$OUTDOORTEMPCOLOUR:"Outdoor temperature      " \
	HRULE:$UPPERTHRESHOLD$UPPERTHRESHOLDCOLOUR:"Upper comfort limit [$UPPERTHRESHOLD""C]" \
	HRULE:$LOWERTHRESHOLD$LOWERTHRESHOLDCOLOUR:"Lower comfort limit [$LOWERTHRESHOLD""C]" \
	>/dev/null

# 180 days
rrdtool graph 180d.png \
	--start -180d \
	--title "Last 180 days" \
	--vertical-label "degrees C" \
	--watermark "©QuackingPlums January 2013" \
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
	DEF:maxtemp=RasPi-TempLogger.rrd:temp:MAX \
	DEF:mintemp=RasPi-TempLogger.rrd:temp:MIN \
	CDEF:shading0=mintemp  AREA:shading0#C6E6E620::STACK \
	CDEF:shading1=maxtemp,mintemp,-,0.25,*  AREA:shading1#C6E6E670::STACK \
	CDEF:shading2=maxtemp,mintemp,-,0.25,*  AREA:shading2#C6E6E6A0::STACK \
	CDEF:shading3=maxtemp,mintemp,-,0.25,*  AREA:shading3#C6E6E6CF::STACK \
	CDEF:shading4=maxtemp,mintemp,-,0.25,*  AREA:shading4#C6E6E6FF::STACK \
	DEF:temp=RasPi-TempLogger.rrd:temp:AVERAGE \
	LINE1:temp$INDOORTEMPCOLOUR:"Indoor temperature" \
	DEF:outtemp=RasPi-TempLogger.rrd:outtemp:AVERAGE \
	LINE1:outtemp$OUTDOORTEMPCOLOUR:"Outdoor temperature      " \
	HRULE:$UPPERTHRESHOLD$UPPERTHRESHOLDCOLOUR:"Upper comfort limit [$UPPERTHRESHOLD""C]" \
	HRULE:$LOWERTHRESHOLD$LOWERTHRESHOLDCOLOUR:"Lower comfort limit [$LOWERTHRESHOLD""C]" \
	>/dev/null

# 365 days
rrdtool graph 365d.png \
	--start -365d \
	--title "Last 365 days" \
	--vertical-label "degrees C" \
	--watermark "©QuackingPlums January 2013" \
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
	DEF:maxtemp=RasPi-TempLogger.rrd:temp:MAX \
	DEF:mintemp=RasPi-TempLogger.rrd:temp:MIN \
	CDEF:shading0=mintemp  AREA:shading0#C6E6E620::STACK \
	CDEF:shading1=maxtemp,mintemp,-,0.25,*  AREA:shading1#C6E6E670::STACK \
	CDEF:shading2=maxtemp,mintemp,-,0.25,*  AREA:shading2#C6E6E6A0::STACK \
	CDEF:shading3=maxtemp,mintemp,-,0.25,*  AREA:shading3#C6E6E6CF::STACK \
	CDEF:shading4=maxtemp,mintemp,-,0.25,*  AREA:shading4#C6E6E6FF::STACK \
	DEF:temp=RasPi-TempLogger.rrd:temp:AVERAGE \
	LINE1:temp$INDOORTEMPCOLOUR:"Indoor temperature" \
	DEF:outtemp=RasPi-TempLogger.rrd:outtemp:AVERAGE \
	LINE1:outtemp$OUTDOORTEMPCOLOUR:"Outdoor temperature      " \
	HRULE:$UPPERTHRESHOLD$UPPERTHRESHOLDCOLOUR:"Upper comfort limit [$UPPERTHRESHOLD""C]" \
	HRULE:$LOWERTHRESHOLD$LOWERTHRESHOLDCOLOUR:"Lower comfort limit [$LOWERTHRESHOLD""C]" \
	>/dev/null

