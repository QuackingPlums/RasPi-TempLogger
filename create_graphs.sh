. rrd.conf

# testing max, gradient
rrdtool graph 7dtest.png \
	--start -7d \
	--title "7 days" \
	--vertical-label "degrees C" \
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
	"CDEF:shading25=temp,0.025,*" "AREA:shading25#C6E6E600::STACK" \
	"CDEF:shading30=temp,0.025,*" "AREA:shading30#C6E6E611::STACK" \
	"CDEF:shading35=temp,0.025,*" "AREA:shading35#C6E6E622::STACK" \
	"CDEF:shading40=temp,0.025,*" "AREA:shading40#C6E6E633::STACK" \
	"CDEF:shading45=temp,0.025,*" "AREA:shading45#C6E6E644::STACK" \
	"CDEF:shading50=temp,0.025,*" "AREA:shading50#C6E6E655::STACK" \
	"CDEF:shading55=temp,0.025,*" "AREA:shading55#C6E6E666::STACK" \
	"CDEF:shading60=temp,0.025,*" "AREA:shading60#C6E6E677::STACK" \
	"CDEF:shading65=temp,0.025,*" "AREA:shading65#C6E6E688::STACK" \
	"CDEF:shading70=temp,0.025,*" "AREA:shading70#C6E6E699::STACK" \
	"CDEF:shading75=temp,0.025,*" "AREA:shading75#C6E6E6AA::STACK" \
	"CDEF:shading80=temp,0.025,*" "AREA:shading80#C6E6E6BB::STACK" \
	"CDEF:shading85=temp,0.025,*" "AREA:shading85#C6E6E6CC::STACK" \
	"CDEF:shading90=temp,0.025,*" "AREA:shading90#C6E6E6DD::STACK" \
	"CDEF:shading95=temp,0.65,*" "AREA:shading95#C6E6E6EE::STACK" \
	LINE1:temp$INDOORTEMPCOLOUR:"Indoor temperature" \
	DEF:outtemp=RasPi-TempLogger.rrd:outtemp:AVERAGE \
	LINE1:outtemp$OUTDOORTEMPCOLOUR:"Outdoor temperature" \
	DEF:maxtemp=RasPi-TempLogger.rrd:temp:MAX \
	LINE1:maxtemp#FFCC3C:"12h maximum"
	
#"CDEF:shading10=temp,0.90,*" "AREA:shading10#E10000" \
#"CDEF:shading15=temp,0.85,*" "AREA:shading15#D20000" \
#"CDEF:shading20=temp,0.80,*" "AREA:shading20#C30000" \
#"CDEF:shading25=temp,0.75,*" "AREA:shading25#B40000" \
#"CDEF:shading30=temp,0.70,*" "AREA:shading30#A50000" \
#"CDEF:shading35=temp,0.65,*" "AREA:shading35#960000" \
#"CDEF:shading40=temp,0.60,*" "AREA:shading40#870000" \
#"CDEF:shading45=temp,0.55,*" "AREA:shading45#780000" \
#"CDEF:shading50=temp,0.50,*" "AREA:shading50#690000" \
#"CDEF:shading55=temp,0.45,*" "AREA:shading55#5A0000" \
#"CDEF:shading60=temp,0.40,*" "AREA:shading60#4B0000" \
#"CDEF:shading65=temp,0.35,*" "AREA:shading65#3C0000" \
#"CDEF:shading70=temp,0.30,*" "AREA:shading70#2D0000" \
#"CDEF:shading75=temp,0.25,*" "AREA:shading75#180000" \
#"CDEF:shading80=temp,0.20,*" "AREA:shading80#0F0000" \
#"CDEF:shading85=temp,0.15,*" "AREA:shading85#000000"

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
	LINE1:temp$INDOORTEMPCOLOUR:"Indoor temperature [deg C]" \
	DEF:outtemp=RasPi-TempLogger.rrd:outtemp:AVERAGE \
	LINE1:outtemp$OUTDOORTEMPCOLOUR:"Outdoor temperature [deg C]"

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
	LINE1:temp$INDOORTEMPCOLOUR:"Indoor temperature [deg C]" \
	DEF:outtemp=RasPi-TempLogger.rrd:outtemp:AVERAGE \
	LINE1:outtemp$OUTDOORTEMPCOLOUR:"Outdoor temperature [deg C]"

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
	LINE1:temp$INDOORTEMPCOLOUR:"Indoor temperature [deg C]" \
	DEF:outtemp=RasPi-TempLogger.rrd:outtemp:AVERAGE \
	LINE1:outtemp$OUTDOORTEMPCOLOUR:"Outdoor temperature [deg C]"

# 7 days
rrdtool graph 7d.png \
	--start -7d \
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
	LINE1:temp$INDOORTEMPCOLOUR:"Indoor temperature [deg C]" \
	DEF:outtemp=RasPi-TempLogger.rrd:outtemp:AVERAGE \
	LINE1:outtemp$OUTDOORTEMPCOLOUR:"Outdoor temperature [deg C]"

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
	LINE1:temp$INDOORTEMPCOLOUR:"Indoor temperature [deg C]" \
	DEF:outtemp=RasPi-TempLogger.rrd:outtemp:AVERAGE \
	LINE1:outtemp$OUTDOORTEMPCOLOUR:"Outdoor temperature [deg C]"

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
	LINE1:temp$INDOORTEMPCOLOUR:"Indoor temperature [deg C]" \
	DEF:outtemp=RasPi-TempLogger.rrd:outtemp:AVERAGE \
	LINE1:outtemp$OUTDOORTEMPCOLOUR:"Outdoor temperature [deg C]"

# 180 days
rrdtool graph 180d.png \
	--start -180d \
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
	LINE1:temp$INDOORTEMPCOLOUR:"Indoor temperature [deg C]" \
	DEF:outtemp=RasPi-TempLogger.rrd:outtemp:AVERAGE \
	LINE1:outtemp$OUTDOORTEMPCOLOUR:"Outdoor temperature [deg C]"

# 365 days
rrdtool graph 365d.png \
	--start -365d \
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
	LINE1:temp$INDOORTEMPCOLOUR:"Indoor temperature [deg C]" \
	DEF:outtemp=RasPi-TempLogger.rrd:outtemp:AVERAGE \
	LINE1:outtemp$OUTDOORTEMPCOLOUR:"Outdoor temperature [deg C]"

