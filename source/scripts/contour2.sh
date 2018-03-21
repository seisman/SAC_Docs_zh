#!/bin/bash
export SAC_DISPLAY_COPYRIGHT=0

sac << END
r ./contourdata
zlevels range 700 1150 increment 25
zlabels on list int off off off
zticks on direction down
zlines list 1
title 'Katmai topography from survey data [inc = 25 km]'
contour
saveimg contour2.ps
q
END
ps2raster -A -Tf contour2.ps
ps2raster -A -Tg contour2.ps
rm contour2.ps
