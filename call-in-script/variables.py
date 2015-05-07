#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
import subprocess

os.putenv("SAC_DISPLAY_COPYRIGHT", "0")

p = subprocess.Popen(['sac'], stdin=subprocess.PIPE)

s = ""
s += "fg seismo \n"
s += "ch kuser0 &1,kevnm& \n"
tmp = "ABC"   # Python变量，用于代替SAC中的黑板变量
s += "ch kuser1 %s \n" % (tmp)
s += "lh kuser0 kuser1 \n"
s += "q \n"

p.communicate(s.encode())
