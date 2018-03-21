#!/usr/bin/env python
# -*- coding: utf8 -*-

import os
import sys
import datetime
import subprocess

os.putenv("SAC_DISPLAY_COPYRIGHT", '0')

if len(sys.argv) != 7:
    sys.exit("Usage: python %s dirname yyyy-mm-ddThh:mm:ss.xxx evlo evla evdp mag" % sys.argv[0])

dir, origin, evlo, evla, evdp, mag = sys.argv[1:]

o = datetime.datetime.strptime(origin,'%Y-%m-%dT%H:%M:%S.%f')
# 计算发震日期是一年中的第几天
jday = o.strftime("%j")
# 提取毫秒值
msec = int(o.microsecond / 1000 + 0.5)

os.chdir(dir)

p = subprocess.Popen(['sac'], stdin=subprocess.PIPE)
s = "wild echo off \n";
s += "r *.SAC \n"
s += "synchronize \n"
s += "ch o gmt %s %s %s %s %s %d \n" % (o.year, jday, o.hour, o.minute, o.second, msec)
s += "ch allt (0 - &1,o&) iztype IO \n"
s += "ch evlo %s evla %s evdp %s mag %s \n" % (evlo, evla, evdp, mag)
s += "wh \n"
s += "q \n"
p.communicate(s.encode())

os.chdir("..")
