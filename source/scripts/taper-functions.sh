#!/bin/bash
export SAC_DISPLAY_COPYRIGHT=0

sac << EOF
setbb npts 1000
setbb delta 0.01
setbb time (%npts%*%delta%)
fg sine (0.25/%time%) 90 npts %npts% delta %delta%
mul -1
add 1
w COSINE
fg sine (0.5/%time%) 90 npts %npts% delta %delta%
mul -0.5
add 0.5
w HANNING
fg sine (0.5/%time%) 90 npts %npts% delta %delta%
mul -0.46
add 0.54
w HAMMING
r HANNING HAMMING COSINE
line incre
fileid l ul
color black incre list black blue green
ylim 0 1
qdp off
p2
saveimg taper-functions.ps
q
EOF
rm COSINE HANNING HAMMING
ps2raster -A -Tf taper-functions.ps
ps2raster -A -Tg taper-functions.ps
rm taper-functions.ps
