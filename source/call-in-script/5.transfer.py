#!/usr/bin/env python
# -*- coding: utf8 -*-
import os
import sys
import glob
import subprocess

os.putenv("SAC_DISPLAY_COPYRIGHT", "0")

if len(sys.argv) != 2:
    sys.exit("Usage: python {} dirname\n".format(sys.argv[0]))

dirname = sys.argv[1]

os.chdir(dirname)

s = ""
for sacfile in glob.glob("*.SAC"):
    net, sta, loc, chn = sacfile.split('.')[0:4]
    pz = glob.glob("SAC_PZs_{}_{}_{}_{}_*_*".format(net, sta, chn, loc))
    # 暂不考虑多个PZ文件的情况
    if len(pz) != 1:
        sys.exit("PZ file error for {}".format(sacfile))

    s += "r {} \n".format(sacfile)
    s += "rmean; rtr; taper \n"
    s += "trans from pol s {} to none freq 0.01 0.02 5 10\n".format(pz[0])
    s += "mul 1.0e9 \n"
    s += "w over \n"

s += "q \n"
subprocess.Popen(['sac'], stdin=subprocess.PIPE).communicate(s.encode())

os.chdir("..")
