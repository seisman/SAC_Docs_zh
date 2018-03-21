#!/bin/bash
#
# rglitches
#
export SAC_DISPLAY_COPYRIGHT=0
sac << EOF
fg seis
ch a undef
w seis
fg impstrin 100 300 500 750 delta 0.01 npts 1000 begin 9.46
mul 30
w impulse
r seis
addf impulse
w glitches.SAC
rglitches
w deglitches.SAC
qdp off
beginframe
r glitches.SAC
xvport .1 .9
yvport .55 .95
title 'Seismic Trace With Glitches'
p
r deglitches.SAC
xvport .1 .9
yvport .05 .45
title 'Seismic Trace Without Glitches'
p
endframe
saveimg rglitches.ps
q
EOF
ps2raster -A -Tf rglitches.ps
ps2raster -A -Tg rglitches.ps
rm rglitches.ps
rm seis impulse glitches.SAC deglitches.SAC
