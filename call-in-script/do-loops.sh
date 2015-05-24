#!/bin/sh
SAC_DISPLAY_COPYRIGHT=0

for file in *.SAC; do
   sac <<EOF
     read $file
     rmean
     rtrend
     lp co 1.0 p 2 n 4
     write ${file}.filtered
     quit
EOF
done
