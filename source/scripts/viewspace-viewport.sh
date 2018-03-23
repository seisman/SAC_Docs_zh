#!/bin/bash

gmt begin viewspace-viewport pdf,png
gmt basemap -R0/22/0/17 -Jx1c -B+gblue@90
gmt plot -Gblue << EOF
> -Gblue@85
2 2
2 15
20 15
20 2
> -Gblue@80
3 9
3 14
19 14
19 9
> -Gblue@80
3 4
3 8
10 8
10 4
> -Gblue@80
11 4
11 8
19 8
19 4
EOF
gmt text -F+f25p,9+jBL -D0.2c/0.2c << EOF
0 0 window
2 2 viewspace
3 9 viewport
3 4 viewport
11 4 viewport
EOF
gmt end

#psbasemap -R0/1/0/1 -JX22c/17c -Glavender -K > $PS
#echo 0.1 0.1 20 0 0 CM window | pstext -R -J -K -O >> $PS
#psbasemap -R0/1/0/1 -JX18c/13c -Gslategray2 -K -O -X2.5c -Y2.5c >> $PS
#echo 0.12 0.05 20 0 0 CM viewspace | pstext -R -J -K -O >> $PS
#psbasemap -R0/1/0/1 -JX7c/5c -Glightskyblue3 -K -O -X1c -Y1.5c >> $PS
#echo 0.2 0.1 20 0 0 CM viewport | pstext -R -J -K -O >> $PS
#psbasemap -R0/1/0/1 -JX8c/5c -Glightskyblue3 -K -O -X8c >> $PS
#echo 0.2 0.1 20 0 0 CM viewport | pstext -R -J -K -O >> $PS
#psbasemap -R0/1/0/1 -JX16c/5c -Glightskyblue3 -K -O -X-8c -Y5.5c >> $PS
#echo 0.1 0.1 20 0 0 CM viewport | pstext -R -J -K -O >> $PS
#psxy -R -J -T -O >> $PS
#ps2raster -A -P -Tf $PS
#ps2raster -A -P -Tg $PS
#rm .gmt* $PS
