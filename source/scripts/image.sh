#!/bin/bash
export SAC_DISPLAY_COPYRIGHT=0

sac << END
r contourdata
image
saveimg image.ps
q
END
gmt psconvert -A -P -Tf image.ps
gmt psconvert -A -P -Tg image.ps
rm image.ps
