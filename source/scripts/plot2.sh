#!/bin/bash
#
# Generate figure for plot2 display
#
export SAC_DISPLAY_COPYRIGHT=0
sac << EOF
fg seis
rmean; rtrend; taper
w seis.0
bp c 0.05 10 n 4 p 2
w seis.1
r ./seis.[01]
color red inc list red blue
qdp off
p2
saveimg plot2.ps
quit
EOF
rm seis.0 seis.1
ps2raster -A -Tf plot2.ps
ps2raster -A -Tg plot2.ps
rm plot2.ps
