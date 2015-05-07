#!/bin/bash
export SAC_DISPLAY_COPYRIGHT=0
sac << EOF
fg seis
w seis.SAC
q
EOF
gmtset TICK_LENGTH -0.3c
gmtset GRID_PEN_PRIMARY 0.3p,black,-
gmtset HEADER_FONT_SIZE 10p
gmtset LABEL_FONT_SIZE 10p
gmtset LABEL_OFFSET 0c

J=X15.4c/11.9c
R=9.2/19.8/-1.63/1.6
B=a2f0.5g2:"Time(s)":/a1f0.25g1WeS:"Amplitude":
PS=appearance.ps

psxy -J$J -R$R -T -K > $PS

psxy -J$J -R$R -Bn -T -K -O >> $PS

pstext -J$J -R$R -N -Wwhite,o0.5p,black -C8p -K -O >> $PS << EOF
19.52 -1.515 10 0 0 CM 2
EOF

pssac -J$J -R$R -B$B:."Seismic Trace": seis.SAC -W0.3p -K -O >> $PS
psxy -J$J -R$R -K -O -W0.5p >> $PS << EOF
10.464 1.5
10.464 -1.5
EOF
pstext -J$J -R$R -K -O >> $PS << EOF
10.6 -1.4 15 0 0 CM A
EOF

pstext -J$J -R$R -K -O -N -Gblue -D-1.5c/-1.5cv1p,blue >> $PS << EOF
10.4 -1.48 15 0 0 CT PICKS
EOF

pstext -J$J -R$R -N -K -O >> $PS << EOF
20 -2 15 0 0 CM 1
EOF

pstext -J$J -R$R -K -O >> $PS << EOF
17.4 1.5 10 0 0 LT KB108838
17.4 1.4 10 0 0 LT CDV VERT
17.4 1.3 10 0 0 LT MAR 29 (088), 1981
17.4 1.2 10 0 0 LT 10:38:14.000
EOF

# TITLE
pstext -J$J -R$R -N -K -O -D2c/0.5cv1p,blue -Gblue >> $PS << EOF
14.5 1.8 15 0 0 LB TITLE
EOF

# FILEID
pstext -J$J -R$R -N -K -O -D2c/0cv1p,blue -Gblue >> $PS << EOF
19. 1.45 15 0 0 LM FILEID
EOF

# QDP
pstext -J$J -R$R -N -K -O -D-0.5c/0.5cv1p,blue -Gblue >> $PS << EOF
19.2 -1.40 15 0 0 CB QDP
EOF

# filenumber
pstext -J$J -R$R -N -K -O -D-1c/0cv1p,blue -Gblue >> $PS << EOF
19.9 -2.00 15 0 0 RM FILENO
EOF

# xlabel
pstext -J$J -R$R -N -K -O -D0c/-0.5cv1p,blue -Gblue >> $PS << EOF
14.5 -1.95 15 0 0 CT XLABEL
EOF

# ylabel
pstext -J$J -R$R -N -K -O -D0c/-1.5cv1p,blue -Gblue >> $PS << EOF
8.4 -0.25 15 0 0 CT YLABEL
EOF

# axes
pstext -J$J -R$R -N -K -O -D0c/-1cv1p,blue -Gblue >> $PS << EOF
11 -1.65 15 0 0 CT AXES
EOF

# ticks
pstext -J$J -R$R -N -K -O -D1c/0cv1p,blue -Gblue >> $PS << EOF
19.9 0 15 90 0 CT TICKS
EOF

# border
pstext -J$J -R$R -N -K -O -D0c/1cv1p,blue -Gblue >> $PS << EOF
12 1.62 15 00 0 CB BORDER
EOF

# grid
pstext -J$J -R$R -N -K -O -D1c/0cv1p,blue -Gblue >> $PS << EOF
16 0.5 15 0 0 LM GRID
EOF

psxy -J$J -R$R -T -O >> $PS
rm .gmt*

ps2raster -A -P -Tf $PS
rm $PS seis.SAC
