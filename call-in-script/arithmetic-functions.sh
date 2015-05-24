#!/bin/bash
SAC_DISPLAY_COPYRIGHT=0

declare -i var1 var2 var3 var4
var1=(1+2)*3
var2=10/4
var3=10/4
echo $var1 $var2 $var3

sac << EOF
echo on
fg seis
bp c $var2 $var1
q
EOF
