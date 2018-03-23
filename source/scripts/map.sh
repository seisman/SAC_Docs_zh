#!/bin/bash
export SAC_DISPLAY_COPYRIGHT=0

sac << END
dg sub regional *.z
map stan on
q
END
gmt psconvert -A -Tf gmt.ps
gmt psconvert -A -Tg gmt.ps
mv gmt.pdf map.pdf
mv gmt.png map.png
rm map.ps gmt.csh .gmt*
