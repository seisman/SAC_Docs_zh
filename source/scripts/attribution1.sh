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

gmt psconvert -A -P -Tf attribution1.ps
gmt psconvert -A -P -Tg attribution1.ps
rm attribution1.ps
