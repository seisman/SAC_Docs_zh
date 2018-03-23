#!/bin/bash
export SAC_DISPLAY_COPYRIGHT=0
sac << EOF
fg seis
w seis.SAC
q
EOF

gmt begin appearance pdf,png
gmt set MAP_TICK_LENGTH_PRIMARY -0.3c MAP_GRID_PEN_PRIMARY 0.3p,black,-
gmt set FONT_TITLE 10p MAP_TITLE_OFFSET 0.2c
gmt set MAP_ANNOT_OFFSET_PRIMARY 15p
gmt set FONT_LABEL 10p

# Plot top axes only
gmt basemap -JX15.4c/11.9c -R9.2/19.8/-1.63/1.6 -B0 -Bn+t'Seismic Trace'

# Plot traces, xlabel, ylabel, ticks, annotations and grids
gmt sac seis.SAC -W0.3p -Bxa2f0.5g2+l"Time (s)" -Bya1f0.25g1+l'Amplitude' -BWeS

# time marker
gmt plot -W0.5p << EOF
10.464 1.5
10.464 -1.5
EOF
echo 10.7 -1.4 A | gmt text -F+f15p

# qdp factor
echo 19.52 -1.515 2 | gmt text -F+f10p -N -W0.5p,black -C8p

# fileid
gmt text -F+f10p+jLT << EOF
17.4 1.5 K8108838
17.4 1.4 CDV VERT
17.4 1.3 MAR 29 (088), 1981
17.4 1.2 10:38:14.000
EOF

# fileno
echo 20 -2 1 | gmt text -F+f15p -N

# annotations
echo 10.4 -1.48 CT PICKS  | gmt text -F+f15p,8,blue+j -N -D-1.5c/-1.5c+v1p,blue
echo 14.5 1.75 LM TITLE   | gmt text -F+f15p,8,blue+j -N -D2c/0.5c+v1p,blue
echo 19. 1.35 LM FILEID   | gmt text -F+f15p,8,blue+j -N -D2c/0c+v1p,blue
echo 19.2 -1.40 CB QDP    | gmt text -F+f15p,8,blue+j -N -D-0.5c/0.5c+v1p,blue
echo 19.9 -2.00 RM FILENO | gmt text -F+f15p,8,blue+j -N -D-1c/0c+v1p,blue
echo 14.5 -1.95 CT XLABEL | gmt text -F+f15p,8,blue+j -N -D0c/-0.5c+v1p,blue
echo 8.4 -0.25 CT YLABEL  | gmt text -F+f15p,8,blue+j -N -D0c/-1.5c+v1p,blue
echo 11 -1.65 CT AXES     | gmt text -F+f15p,8,blue+j -N -D0c/-1c+v1p,blue
echo 19.9 0 LM TICKS      | gmt text -F+f15p,8,blue+j -N -D1c/0c+v1p,blue
echo 12 1.62 CB BORDER    | gmt text -F+f15p,8,blue+j -N -D0c/1c+v1p,blue
echo 16 0.5 LM GRID       | gmt text -F+f15p,8,blue+j -N -D1c/0c+v1p,blue
gmt end
rm seis.SAC
