#!/bin/bash
export SAC_DISPLAY_COPYRIGHT=0

sac << EOF
fg impulse delta 0.01 npts 1000
benioff
beginframe
xvport 0.1 0.9; yvport 0.7 0.9
fileid off
qdp off
title 'Time Domain Response'
p
fft
xvport .1 .45; yvport .15 .55
title 'Amplitude Response'
psp am loglog
xvport .55 .9
title 'Phase Response'
psp ph linlin
endframe
saveimg benioff.ps
quit
EOF
ps2raster -A -Tf benioff.ps
ps2raster -A -Tg benioff.ps
rm benioff.ps
