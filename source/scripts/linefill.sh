#!/bin/bash
export SAC_DISPLAY_COPYRIGHT=0

sac << EOF
fg seis
qdp off
rmean; rtrend; taper
line 0 fill red/blue
p
saveimg linefill.ps
q
EOF
gmt psconvert -A -P -Tf linefill.ps
gmt psconvert -A -P -Tg linefill.ps
rm linefill.ps
