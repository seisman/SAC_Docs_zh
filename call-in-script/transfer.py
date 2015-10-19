#!/usr/bin/env python
# -*- coding: utf8 -*-
import os
import glob
import subprocess

os.putenv("SAC_DISPLAY_COPYRIGHT", "0")

p = subprocess.Popen(['sac'], stdin=subprocess.PIPE)

s = ""
for sacfile in glob.glob("*.BH?"):
    (net, sta, loc, chn) = sacfile.split('.')
    pzfile = glob.glob("SAC_PZs_%s_%s_%s_%s_*_*" % (net, sta, chn, loc))[0]

    if not pzfile:
        os.exit("PZ file error for %s" % sacfile)

    s += "r %s \n" % sacfile
    s += "rmean; rtr; taper \n"
    s += "trans from pol s %s to none freq 0.01 0.02 5 10\n" % pzfile
    s += "mul 1.0e9 \n"
    s += "w over \n"

s += "q \n"
p.communicate(s.encode())
