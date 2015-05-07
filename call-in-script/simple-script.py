#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import subprocess

os.putenv("SAC_DISPLAY_COPYRIGHT", '0')

p = subprocess.Popen(['sac'], stdin=subprocess.PIPE)

s = ""
s += "fg seismo\n"
s += "lh evla kstnm\n"
s += "quit\n"
p.communicate(s.encode())
