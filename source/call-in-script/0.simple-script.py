#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
import subprocess

os.putenv("SAC_DISPLAY_COPYRIGHT", '0')

s = "fg seismo \n"
s += "lh evla kstnm \n"
s += "q \n"
subprocess.Popen(['sac'], stdin=subprocess.PIPE).communicate(s.encode())
