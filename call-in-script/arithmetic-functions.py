#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
import math
import subprocess

os.putenv("SAC_DISPLAY_COPYRIGHT", "0")

p = subprocess.Popen(['sac'], stdin=subprocess.PIPE)

var1 = (1+2)*3/4
var2 = math.sqrt(9)
var3 = math.sin(30*math.pi/180)

s = ""
s += "fg seis \n"
s += "rmean; rtr; taper \n"
s += "bp c %f %f \n" % (var3, var1)
s += "w seis.SAC \n"
s += "q \n"

p.communicate(s.encode())
