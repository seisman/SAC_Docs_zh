#!/bin/bash
export SAC_DISPLAY_COPYRIGHT=0

sac << EOF
r IU.COLA.00.BHZ
rmean; rtr; taper
qdp 1200
p
saveimg raw-data.ps
q
EOF
gmt psconvert -A -P -Tf raw-data.ps
gmt psconvert -A -P -Tg raw-data.ps
rm raw-data.ps
