#!/bin/bash
#
# Generate figure for plot1 display
#

export SAC_DISPLAY_COPYRIGHT=0

sac << END
dg sub local cdv.e cdv.n cdv.z
p1
saveimg plot1.ps
q
END
ps2raster -A -Tf plot1.ps
ps2raster -A -Tg plot1.ps
rm plot1.ps
