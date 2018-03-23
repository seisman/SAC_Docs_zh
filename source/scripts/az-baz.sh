#!/bin/bash

gmt begin az-baz pdf,png
gmt set MAP_FRAME_TYPE plain MAP_GRID_PEN_PRIMARY 2p,gray
gmt basemap -JB130/20/50/55/15c -R110/150/10/50 -Bg20z
gmt plot -Sc0.4c -Gred << EOF
120 20
140 20
120 40
140 40
EOF
gmt plot -W2p,red,- << EOF
120 20
140 40
EOF
gmt plot -Sm0.25c+b+e -Gred -W1p,red << EOF
120 20 1c 40 83
140 40 1c -130 98
EOF
gmt text -F+f15p -N << EOF
121.5 25 Az
144   43 Baz
121   18 Epicenter
136   40 Station
120   9  @~\154@~@-e@-
140   9  @~\154@~@-s@-
109   20 @~\146@~@-e@-
108   40 @~\146@~@-s@-
EOF
gmt end
