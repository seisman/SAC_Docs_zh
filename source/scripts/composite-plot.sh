#!/bin/bash
export SAC_DISPLAY_COPYRIGHT=0

sac<<EOF
fg seis
beginframe
xvport 0.1 0.9
yvport 0.7 0.9
title 'Seismic Trace'
fileid off
qdp off
p
fft wmean
xvport .1 .45
yvport .15 .55
title 'Amplitude Response (linlog)'
ylim 1e-5 1
psp am linlog
xvport .55 .9
title 'Amplitude Response (loglog)'
xlim 1 60
psp am loglog
endframe
saveimg composite-plot.ps
q
EOF
ps2raster -A -Tf composite-plot.ps
ps2raster -A -Tg composite-plot.ps
rm composite-plot.ps
