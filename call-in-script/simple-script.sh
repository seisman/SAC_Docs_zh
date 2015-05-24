#!/bin/bash
SAC_DISPLAY_COPYRIGHT=0

sac << EOF
fg seis
lh evla evlo
q               # 必须！
EOF
