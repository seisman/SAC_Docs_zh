#!/bin/bash
PS=az-baz.ps
R=110/150/10/50
J=B130/20/50/55/15c

gmt set MAP_FRAME_TYPE plain MAP_GRID_PEN_PRIMARY = 2p,gray
gmt psxy -R$R -J$J -K -T > $PS
gmt psbasemap -R$R -J$J -Bag20 -BZ -K -O >> $PS
gmt psxy -R -J -Sc0.4c -Gred -K -O >> $PS << EOF
120 20
140 20
120 40
140 40
EOF
gmt psxy -R$R -J$J -W2p,red,- -K -O >> $PS << EOF
120 20
140 40
EOF
gmt psxy -R$R -J$J -Sm0.4c+b -Gred -W1p,red -K -O >> $PS << EOF
120 20 1 40 83
140 40 1.0 -130 98
EOF
gmt pstext -R$R -J$J -F+f -N -K -O >> $PS << EOF
121.5 25 15p Az
144 43 15p Baz
121 18 15p Epicenter
136 40 15p Station
120 9  15p @~\154@~@-e@-
140 9  15p @~\154@~@-s@-
109 20  15p @~\146@~@-e@-
108 40  15p @~\146@~@-s@-
EOF
gmt psxy -R$R -J$J -T -O >> $PS
gmt ps2raster -A -P -Tf az-baz.ps
rm gmt.* az-baz.ps
