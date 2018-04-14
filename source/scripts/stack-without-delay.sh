#!/bin/bash
#
# Generate figure for stack without delay
#
export SAC_DISPLAY_COPYRIGHT=0
sac << EOF
bg sgf
funcgen impulse npts 10 delta 1 begin 0
w a.SAC
funcgen impulse npts 10 delta 1 begin 10
w b.SAC
sss
zerostack
addstack a.SAC
addstack b.SAC
timewindow 0 19
sumstack
quitsub
saveimg stack-without-delay.pdf
q
EOF
rm a.SAC
rm b.SAC
rm f001.sgf
