#!/bin/bash

export SAC_DISPLAY_COPYRIGHT=0

sac << EOF
fg seis
beginframe
xvport .1 .9
yvport .7 .9
title 'SEISMIC TRACE'
fileid off
qdp off
p
fft wmean
xvport .1 .45
yvport .15 .55
title 'Amplitude Response-linlog'
ylim 1e-5 1
psp am linlog
xvport .55 .9
title 'Amplitude Response-loglog'
xlim 1 60
psp am loglog
endframe
cut off
fileid off
xlim off
ylim off
saveimg beginframe.ps
quit
EOF
ps2raster -A -Tf beginframe.ps
ps2raster -A -Tg beginframe.ps
rm beginframe.ps
