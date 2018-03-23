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
gmt psconvert -A -Tf unwrap.ps
gmt psconvert -A -Tg unwrap.ps
rm unwrap.ps
