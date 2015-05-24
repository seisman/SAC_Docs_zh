#!/bin/bash
SAC_DISPLAY_COPYRIGHT=0
str1=`echo "this is long" | sed 's/long/short/'`    # 替换
str2=`echo "abcdefghi" | sed 's/def//'`             # 删除

sac << EOF
fg seis
title "$str1"
p
saveimg string.ps
q
EOF
