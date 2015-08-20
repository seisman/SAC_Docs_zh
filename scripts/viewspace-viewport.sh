#!/bin/bash
PS=viewspace-viewport.ps
gmt psbasemap -R0/1/0/1 -JX22c/17c -BWSEN+glavender -K > $PS
echo 0.1 0.1 window | gmt pstext -R -J -F+f20p -K -O >> $PS
gmt psbasemap -R0/1/0/1 -JX18c/13c -BWSEN+gslategray2 -K -O -Xf5c -Yf5c >> $PS
echo 0.12 0.05 viewspace | gmt pstext -R -J -F+f20p -K -O >> $PS
gmt psbasemap -R0/1/0/1 -JX7c/5c -BWSEN+glightskyblue3 -K -O -Xf6c -Yf6.5c >> $PS
echo 0.2 0.1 viewport | gmt pstext -R -J -F+f20p -K -O >> $PS
gmt psbasemap -R0/1/0/1 -JX8c/5c -BWSEN+glightskyblue3 -K -O -Xf14c -Yf6.5c >> $PS
echo 0.2 0.1 viewport | gmt pstext -R -J -F+f20p -K -O >> $PS
gmt psbasemap -R0/1/0/1 -JX16c/5c -BWSEN+glightskyblue3 -K -O -Xf6c -Yf12c >> $PS
echo 0.1 0.1 viewport | gmt pstext -R -J -F+f20p -K -O >> $PS
gmt psxy -R -J -T -O >> $PS
gmt ps2raster -A -P -Tf $PS
rm gmt.* $PS
