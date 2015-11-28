#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import glob
import subprocess

os.putenv("SAC_DISPLAY_COPYRIGHT", '0')

if len(sys.argv) != 2:
    sys.exit("Usage: python %s dirname" % sys.argv[0])

dir = sys.argv[1]

os.chdir(dir)  # cd进数据所在目录，以避免处理路径

# 假定当前目录只有一个SEED
seed = glob.glob("*.seed")
if len(seed) != 1:
    sys.exit("One and only one SEED file is needed!")

subprocess.call(['rdseed', '-pdf', seed[0]])

os.chdir("..")
