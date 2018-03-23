#!/bin/bash
export SAC_DISPLAY_COPYRIGHT=0

sac << EOF
r IU.COLA.00.BHZ
rmean; rtr; taper
trans from evalresp fname RESP.IU.COLA.00.BHZ to none
qdp 500
p
saveimg ground-motion.ps
q
EOF
gmt psconvert -A -P -Tf ground-motion.ps
gmt psconvert -A -P -Tg ground-motion.ps
rm ground-motion.ps
