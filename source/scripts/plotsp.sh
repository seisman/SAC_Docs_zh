#!/bin/bash
export SAC_DISPLAY_COPYRIGHT=0

sac << EOF
fg seis
fft
psp am loglog
saveimg plotsp.ps
q
EOF
ps2raster -A -Tf plotsp.ps
rm plotsp.ps
