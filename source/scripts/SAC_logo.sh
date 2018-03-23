#!/bin/bash
#
# Generate the logo of SAC manual
#
export SAC_DISPLAY_COPYRIGHT=0

data=onkm.e
sac << END
dg sub tele $data
bp c 0.001 0.2
div &1,depmax
w $data
q
END

gmt begin SAC_logo pdf,png
gmt pssac onkm.e -JX10/3c -R200/1600/-1/1 -W0.75p,red
gmt end
rm $data
