#!/bin/bash
SAC_DISPLAY_COPYRIGHT=0
PS=freqlimits.ps

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
pssac -JX20c/10c -R0/50/-0.2/1.2 -B10:Freq\(Hz\):/1WSen freqlimits.sac -W2p,blue -K > $PS
psxy -J -R -Sv0.05/0.3/0.2 -Wred -Gred -K -O >> $PS << EOF
5 0.2 -90 1.4
15 0.8 90 1.4
34 0.8 90 1.4
44 0.2 -90 1.4
EOF
pstext -J -R -K -O -D0c/0.2c >> $PS << EOF
5 0.2 20 0 9 CB f1
44 0.2 20 0 9 CB f4
EOF
pstext -J -R -K -O -D0c/-0.2c >> $PS << EOF
15 0.8 20 0 9 CT f2
34 0.8 20 0 9 CT f3
EOF
psxy -J -R -T -O >> $PS

ps2raster -A -P -Tf $PS
ps2raster -A -P -Tg $PS
rm $PS .gmt*
rm freqlimits.sac
