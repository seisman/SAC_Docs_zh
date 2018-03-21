#!/bin/bash

export SAC_DISPLAY_COPYRIGHT=0
sac<<EOF
fileid off
qdp off
beginframe
yvport 0.775 0.975
fg seis
p
yvport 0.525 0.725
rmean
p
yvport 0.275 0.475
rtrend
p
yvport 0.025 0.225
taper
p
endframe
saveimg rmean-rtrend-taper.ps
q
EOF
ps2raster -A -Tf rmean-rtrend-taper.ps
ps2raster -A -Tg rmean-rtrend-taper.ps
rm rmean-rtrend-taper.ps
