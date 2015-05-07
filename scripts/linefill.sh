#!/bin/bash
export SAC_DISPLAY_COPYRIGHT=0

sac << EOF
fg seis
qdp off
rmean; rtrend; taper
line 0 fill  red/blue
p
saveimg linefill.ps
q
EOF
ps2raster -A -P -Tf linefill.ps
rm linefill.ps
