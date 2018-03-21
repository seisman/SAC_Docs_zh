#!/bin/bash
SAC_DISPLAY_COPYRIGHT=0

sac << EOF
fg impulse delta 0.01 npts 1000 begin -4.985
w seis.0
fg
bp c 0.5 5 n 2 p 1
w seis.21
fg
bp c 0.5 5 n 4 p 1
w seis.41
fg
bp c 0.5 5 n 2 p 2
w seis.22
fg
bp c 0.5 5 n 4 p 2
w seis.42
q
EOF

PS=filter-waveform.ps
pssac -JX20c/15c -R-2/2/0.5/6 -B1:"T(s)":/WSen -Ent -M1 seis.42 seis.41 seis.22 seis.21 seis.0 -W1.5p,black -K > $PS
psxy -J -R -K -O -N -W1p,gray,- >> $PS << EOF
0 0.5
0 6
EOF
pstext -J -R -K -O -D0c/0.3c >> $PS << EOF
-1.2 5 15 0 9 CB Impulse
-1.2 4 15 0 9 CB bp c 0.5 5 n 2 p 1
-1.2 3 15 0 9 CB bp c 0.5 5 n 2 p 2
-1.2 2 15 0 9 CB bp c 0.5 5 n 4 p 1
-1.2 1 15 0 9 CB bp c 0.5 5 n 4 p 2
EOF
psxy -J -R -O -T >> $PS
ps2raster -A -P -Tf $PS
ps2raster -A -P -Tg $PS
rm seis.* $PS .gmt*
