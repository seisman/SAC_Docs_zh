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
gmt begin filter-waveform pdf,png
gmt basemap -JX15c/12c -R-2/2/0.5/6 -Bx1+l"T (s)" -BWSen
gmt plot -N -W1p,gray,- << EOF
0 0.5
0 6
EOF
gmt sac -En1 -M2c seis.42 seis.41 seis.22 seis.21 seis.0 -W1.5p,black
gmt text -F+f10p,9 -D0c/0.25c << EOF
-1.2 5 Impulse
-1.2 4 bp c 0.5 5 n 2 p 1
-1.2 3 bp c 0.5 5 n 2 p 2
-1.2 2 bp c 0.5 5 n 4 p 1
-1.2 1 bp c 0.5 5 n 4 p 2
EOF
gmt end
rm seis.*
