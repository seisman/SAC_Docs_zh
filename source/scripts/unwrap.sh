#!/bin/bash
export SAC_DISPLAY_COPYRIGHT=0
sac << EOF
fg seis
rmean; rtr; taper
fft
wsp origin

fg seis
rmean; rtr; taper
unwrap
wsp unwrap
r ./origin.ph ./unwrap.ph
fileid off
picks off
p1
saveimg unwrap.ps
q
EOF
rm origin.am origin.ph unwrap.am unwrap.ph
ps2raster -A -Tf unwrap.ps
ps2raster -A -Tg unwrap.ps
rm unwrap.ps
