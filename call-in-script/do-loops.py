#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
import glob
import subprocess

os.putenv("SAC_DISPLAY_COPYRIGHT", "0")

p = subprocess.Popen(['sac'], stdin=subprocess.PIPE)

s = ""
s += "echo on \n"
for filename in glob.glob("*.SAC"):
    s += "r %s \n" % (filename)
    s += "rmean; rtr; taper \n"
    s += "lp co 1.0 p 2 n 4 \n"
    s += "w %s.filtered\n" % (filename)
s += "quit \n"

p.communicate(s.encode())
