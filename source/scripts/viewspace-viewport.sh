#!/bin/bash
PS=viewspace-viewport.ps
psbasemap -R0/1/0/1 -JX22c/17c -Glavender -K > $PS
echo 0.1 0.1 20 0 0 CM window | pstext -R -J -K -O >> $PS
psbasemap -R0/1/0/1 -JX18c/13c -Gslategray2 -K -O -X2.5c -Y2.5c >> $PS
echo 0.12 0.05 20 0 0 CM viewspace | pstext -R -J -K -O >> $PS
psbasemap -R0/1/0/1 -JX7c/5c -Glightskyblue3 -K -O -X1c -Y1.5c >> $PS
echo 0.2 0.1 20 0 0 CM viewport | pstext -R -J -K -O >> $PS
psbasemap -R0/1/0/1 -JX8c/5c -Glightskyblue3 -K -O -X8c >> $PS
echo 0.2 0.1 20 0 0 CM viewport | pstext -R -J -K -O >> $PS
psbasemap -R0/1/0/1 -JX16c/5c -Glightskyblue3 -K -O -X-8c -Y5.5c >> $PS
echo 0.1 0.1 20 0 0 CM viewport | pstext -R -J -K -O >> $PS
psxy -R -J -T -O >> $PS
ps2raster -A -P -Tf $PS
ps2raster -A -P -Tg $PS
rm .gmt* $PS
