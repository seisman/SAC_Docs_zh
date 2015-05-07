#!/bin/bash
export SAC_DISPLAY_COPYRIGHT=0
sac << EOF
fg seis
rmean; rtr; taper
w seis.0
bp c 1 10 n 4 p 2
w seis.1
bp c 1 10 n 4 p 1
w seis.2
bp c 1 10 n 2 p 1
w seis.3
qdp off
color black incre list black blue
beginframe
yvport 0.75 0.95
r seis.0 seis.1
title location top 'bp c 1 10 n 4 p 2'
p2
yvport 0.45 0.65
r seis.0 seis.2
title 'bp c 1 10 n 4 p 1'
p2
yvport 0.15 0.35
r seis.0 seis.3
title 'bp c 1 10 n 2 p 1'
p2
endframe
saveimg filter.ps
q
EOF
ps2raster -A -Tf filter.ps
rm filter.ps
rm seis.?
