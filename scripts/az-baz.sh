#!/bin/bash
PS=az-baz.ps
R=110/150/10/50
J=B130/20/50/55/15c

gmtset BASEMAP_TYPE plain GRID_PEN_PRIMARY 2p,gray
psbasemap -R$R -J$J -Bg20z -K > $PS
psxy -R -J -Sc0.4c -Gred -K -O >> $PS << EOF
120 20
140 20
120 40
140 40
EOF
psxy -R$R -J$J -W2p,red,- -K -O >> $PS << EOF
120 20
140 40
EOF
psxy -R$R -J$J -Smf2c -Gred -W1p,red -K -O >> $PS << EOF
120 20 40 83
140 40 -130 98
EOF
pstext -R$R -J$J -N -K -O >> $PS << EOF
121.5 25 15 0 0 CM Az
144   43 15 0 0 CM Baz
121   18 15 0 0 CM Epicenter
136   40 15 0 0 CM Station
120   9  15 0 0 CM @~\154@~@-e@-
140   9  15 0 0 CM @~\154@~@-s@-
109   20 15 0 0 CM @~\146@~@-e@-
108   40 15 0 0 CM @~\146@~@-s@-
EOF
psxy -R$R -J$J -T -O >> $PS
ps2raster -A -P -Tf az-baz.ps
rm .gmt* az-baz.ps
