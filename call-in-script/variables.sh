#!/bin/bash
SAC_DISPLAY_COPYRIGHT=0

sac << EOF
fg seis
ch kuser0 &1,kevnm&
setbb tmp ABC
ch kuser1 %tmp%
lh kuser0 kuser1
quit
EOF
