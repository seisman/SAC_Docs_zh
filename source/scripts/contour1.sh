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
ps2raster -A -Tf contour1.ps
ps2raster -A -Tg contour1.ps
rm contour1.ps
