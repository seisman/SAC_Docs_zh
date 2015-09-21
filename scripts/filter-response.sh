#!/bin/bash
export SAC_DISPLAY_COPYRIGHT=0

sac << EOF
m filter-response.m
saveimg filter-response.ps
quit
EOF
ps2raster -A -Tf filter-response.ps
rm filter-response.ps
