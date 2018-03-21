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
ps2raster -A -P -Tf ground-motion.ps
ps2raster -A -P -Tg ground-motion.ps
rm ground-motion.ps
