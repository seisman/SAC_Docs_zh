#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import glob
import subprocess

if len(sys.argv) != 2:
    sys.exit("python %s dirname" % sys.argv[0])

dir = sys.argv[1]

os.chdir(dir)

sets = {}
for fname in glob.glob("*.SAC"):
    net, sta, loc, chn = fname.split('.')[6:10]
    key = '.'.join([net, sta, loc, chn])
    if key not in sets:
        sets[key] = 1
    else:
        sets[key] += 1;

p = subprocess.Popen(['sac'], stdin=subprocess.PIPE)
s = "wild echo off \n"
to_del = []
for key, value in sets.items():
    if value == 1:
        continue

    print("merge %s: %d traces" % (key, value))
    traces = sorted(glob.glob('.'.join(['*', key, '?', 'SAC'])))

    s += "r *.%s.?.SAC \n" % key
    s += "merge \n"
    s += "w %s \n" % traces[0]

    to_del.extend(traces[1:])

s += "q \n"
p.communicate(s.encode())

for file in to_del:
    os.unlink(file)

os.chdir("..")
