#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import glob

os.putenv("SAC_DISPLAY_COPYRIGHT", '0')

if len(sys.argv) != 2:
    sys.exit("Usage: python %s dirname\n" % sys.argv[0])

dir = sys.argv[1]

os.chdir(dir)
for fname in glob.glob("*.SAC"):
    net, sta, loc, chn = fname.split('.')[6:10]
    os.rename(fname, "%s.%s.%s.%s.SAC" % (net, sta, loc, chn))

os.chdir("..")
