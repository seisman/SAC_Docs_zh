#!/bin/bash
export SAC_DISPLAY_COPYRIGHT=0

sac << EOF
fg seis
fft
psp am loglog
saveimg plotsp.ps
q
EOF
gmt psconvert -A -Tf plotsp.ps
gmt psconvert -A -Tg plotsp.ps
rm plotsp.ps
