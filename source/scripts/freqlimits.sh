#!/bin/bash
export SAC_DISPLAY_COPYRIGHT=0

sac << EOF
fg line 0 1 npts 40 be 5
taper width 0.25
w freqlimits.sac
cuterr fillz
cut 0 50
r freqlimits.sac
w over
q
EOF
gmt begin freqlimits pdf,png
gmt basemap -JX20c/10c -R0/50/-0.1/1.1 -Bx10+l'Frequency (Hz)' -Bya0.2 -BWSen
gmt sac freqlimits.sac -W2p,blue
gmt plot -Sv0.4c+e -W2p,red -Gred << EOF
5 0.2 -90 1.4
15 0.8 90 1.4
34 0.8 90 1.4
44 0.2 -90 1.4
EOF
gmt text -F+f20p,9 -D0c/0.25c << EOF
5 0.2 f1
44 0.2 f4
EOF
gmt text -F+f20p,9 -D0c/-0.25c << EOF
15 0.8 f2
34 0.8 f3
EOF
gmt end
rm freqlimits.sac
