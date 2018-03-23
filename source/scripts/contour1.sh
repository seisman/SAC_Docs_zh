#!/bin/bash
export SAC_DISPLAY_COPYRIGHT=0

sac << END
r ./contourdata
zlevels range 700 1150 increment 25
zlines list 1 2 3 4
title 'Katmai topography from survey data [inc = 25 km]'
contour
saveimg contour1.ps
q
END
gmt psconvert -A -Tf contour1.ps
gmt psconvert -A -Tg contour1.ps
rm contour1.ps
