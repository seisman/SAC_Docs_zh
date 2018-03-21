#!/bin/bash

export SAC_DISPLAY_COPYRIGHT=0

sac << EOF
dg sub teleseis ntkl.z nykl.z onkl.z sdkl.z
line incre
color black incre
p1
saveimg attribution2.ps
q
EOF

ps2raster -A -P -Tf attribution2.ps
ps2raster -A -P -Tg attribution2.ps
rm attribution2.ps
