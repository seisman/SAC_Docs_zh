#!/usr/bin/env python
# -*- coding: utf8 -*-

import os
import sys
import datetime
import subprocess

os.putenv("SAC_DISPLAY_COPYRIGHT", '0')

if len(sys.argv) != 7:
    sys.exit("Usage: python {} dirname yyyy-mm-ddThh:mm:ss.xxx "
             "evlo evla evdp mag".format(sys.argv[0]))

dirname, origin, evlo, evla, evdp, mag = sys.argv[1:]

o = datetime.datetime.strptime(origin, '%Y-%m-%dT%H:%M:%S.%f')
# 计算发震日期是一年中的第几天
jday = o.strftime("%j")
# 提取毫秒值
msec = int(o.microsecond / 1000 + 0.5)

os.chdir(dirname)

s = "wild echo off \n"
s += "r *.SAC \n"
s += "synchronize \n"
s += "ch o gmt {} {} {} {} {} {}\n".format(o.year, jday, o.hour,
                                           o.minute, o.second, msec)
s += "ch allt (0 - &1,o&) iztype IO \n"
s += "ch evlo {} evla {} evdp {} mag {} \n".format(evlo, evla, evdp, mag)
s += "wh \n"
s += "q \n"
subprocess.Popen(['sac'], stdin=subprocess.PIPE).communicate(s.encode())

os.chdir("..")
