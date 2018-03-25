#!/bin/bash
export SAC_DISPLAY_COPYRIGHT=0

sac << EOF
m filter-response.m
saveimg filter-response.ps
quit
EOF
gmt psconvert -A -Tg filter-response.ps
rm filter-response.ps
