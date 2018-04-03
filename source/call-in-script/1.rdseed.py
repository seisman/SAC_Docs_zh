#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import glob
import subprocess

os.putenv("SAC_DISPLAY_COPYRIGHT", '0')

if len(sys.argv) != 2:
    sys.exit("Usage: python {} dirname".format(sys.argv[0]))

dirname = sys.argv[1]

os.chdir(dirname)  # cd 进数据所在目录，以避免处理路径

for seed in glob.glob("*.seed"):
    subprocess.call(['rdseed', '-pdf', seed])

os.chdir("..")
