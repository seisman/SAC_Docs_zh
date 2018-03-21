#!/bin/bash

export SAC_DISPLAY_COPYRIGHT=0
sac << EOF
fg seis
line 3
width 2
color red
p
saveimg attribution1.ps
q
EOF

ps2raster -A -P -Tf attribution1.ps
ps2raster -A -P -Tg attribution1.ps
rm attribution1.ps
