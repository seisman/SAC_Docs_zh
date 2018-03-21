#!/bin/bash
export SAC_DISPLAY_COPYRIGHT=0

sac << END
dg sub regional *.z
map stan on
q
END
ps2raster -A -Tf gmt.ps
mv gmt.pdf map.pdf
rm gmt.ps gmt.csh .gmt*
