#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import glob
import subprocess

if len(sys.argv) != 2:
    sys.exit("Usage: python %s dirname" % sys.argv[0])

dir = sys.argv[1]

os.chdir(dir)

seed = glob.glob("*.seed")
if len(seed) != 1:
    print("One and only one SEED file is needed!")

subprocess.call(['rdseed', '-pdf', seed[0]])

os.chdir("..")
