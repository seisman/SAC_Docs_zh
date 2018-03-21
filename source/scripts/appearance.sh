#!/bin/bash
export SAC_DISPLAY_COPYRIGHT=0
sac << EOF
fg seis
w seis.SAC
q
EOF

J=X15.4c/11.9c
R=9.2/19.8/-1.63/1.6
B=a2f0.5g2:"Time(s)":/a1f0.25g1WeS:"Amplitude":
PS=appearance.ps

gmtset TICK_LENGTH -0.3c
gmtset GRID_PEN_PRIMARY 0.3p,black,-
gmtset HEADER_FONT_SIZE 10p HEADER_OFFSET 0.2c
gmtset LABEL_FONT_SIZE 10p LABEL_OFFSET 0c

# Plot top axes only
psbasemap -J$J -R$R -Bn -K > $PS

# Plot traces, xlabel, ylabel, ticks, annotations and grids
pssac -J$J -R$R -B$B:."Seismic Trace": seis.SAC -W0.3p -K -O >> $PS

# time marker
psxy -J$J -R$R -K -O -W0.5p >> $PS << EOF
10.464 1.5
10.464 -1.5
EOF
echo 10.7 -1.4 15 0 0 CM A | pstext -J$J -R$R -K -O >> $PS

# qdp factor
echo 19.52 -1.515 10 0 0 CM 2 | pstext -J$J -R$R -N -Wwhite,o0.5p,black -C8p -K -O >> $PS

# fileid
pstext -J$J -R$R -K -O >> $PS << EOF
17.4 1.5 10 0 0 LT K8108838
17.4 1.4 10 0 0 LT CDV VERT
17.4 1.3 10 0 0 LT MAR 29 (088), 1981
17.4 1.2 10 0 0 LT 10:38:14.000
EOF

# fileno
echo 20 -2 15 0 0 CM 1 | pstext -J$J -R$R -N -K -O >> $PS

# annotations
echo 10.4 -1.48 15 0 8 CT PICKS | pstext -J$J -R$R -K -O -N -Gblue -D-1.5c/-1.5cv1p,blue >> $PS
echo 14.5 1.75 15 0 8 LM TITLE | pstext -J$J -R$R -N -K -O -D2c/0.5cv1p,blue -Gblue >> $PS
echo 19. 1.35 15 0 8 LM FILEID | pstext -J$J -R$R -N -K -O -D2c/0cv1p,blue -Gblue >> $PS
echo 19.2 -1.40 15 0 8 CB QDP | pstext -J$J -R$R -N -K -O -D-0.5c/0.5cv1p,blue -Gblue >> $PS
echo 19.9 -2.00 15 0 8 RM FILENO | pstext -J$J -R$R -N -K -O -D-1c/0cv1p,blue -Gblue >> $PS
echo 14.5 -1.95 15 0 8 CT XLABEL | pstext -J$J -R$R -N -K -O -D0c/-0.5cv1p,blue -Gblue >> $PS
echo 8.4 -0.25 15 0 8 CT YLABEL | pstext -J$J -R$R -N -K -O -D0c/-1.5cv1p,blue -Gblue >> $PS
echo 11 -1.65 15 0 8 CT AXES | pstext -J$J -R$R -N -K -O -D0c/-1cv1p,blue -Gblue >> $PS
echo 19.9 0 15 0 8 LM TICKS | pstext -J$J -R$R -N -K -O -D1c/0cv1p,blue -Gblue >> $PS
echo 12 1.62 15 0 8 CB BORDER | pstext -J$J -R$R -N -K -O -D0c/1cv1p,blue -Gblue >> $PS
echo 16 0.5 15 0 8 LM GRID | pstext -J$J -R$R -N -K -O -D1c/0cv1p,blue -Gblue >> $PS

psxy -J$J -R$R -T -O >> $PS
ps2raster -A -P -Tf $PS
ps2raster -A -P -Tg $PS
rm $PS seis.SAC .gmt*
