#!/usr/bin/env perl
# -*- coding: utf-8 -*-
import os
import datetime
import subprocess

year = 1981
month = 3
day = 28
hour = 10
min = 23
sec = 32
msec = 456

# arguments: year, month, day, hour, minute, second, microsecond
event = datetime.datetime(year, month, day, hour, min, sec, msec*1000)
# day of year
doy = int(event.strftime('%j'))

os.putenv("SAC_DISPLAY_COPYRIGHT", "0")

p = subprocess.Popen(['sac'], stdin=subprocess.PIPE)

s = ""
s += "r *.SAC\n"
s += "synchronize \n"
s += "ch o gmt %d %d %d %d %d %d\n" % (year, doy, hour, min, sec, msec)
s += "ch allt (0 - &1,o&) iztype IO\n"
s += "wh\n"
s += "q\n"
p.communicate(s.encode())
