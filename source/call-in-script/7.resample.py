#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import glob
import subprocess

os.putenv("SAC_DISPLAY_COPYRIGHT", "0")

if len(sys.argv) != 3:
    sys.exit("Usage: python {} dirname [delta | 0]".format(sys.argv[0]))
# 若第二个参数为0，则取数据中出现次数最多的周期为采样周期

dirname, delta = sys.argv[1], float(sys.argv[2])

os.chdir(dirname)

if delta == 0:
    # 假定所有数据已旋转到RTZ坐标系，文件名格式为NET.STA.LOC.[RTZ]
    # hash的键为出现了的采样周期，其值为出现的个数
    groups = {}
    for fname in glob.glob("*.*.*.[RTZ]"):
        cmd = 'saclst delta f {}'.format(fname).split()
        delta0 = subprocess.check_output(cmd).decode().split()[1]
        if delta0 not in groups:
            groups[delta0] = 1
        else:
            groups[delta0] += 1
    delta = float(max(groups, key=groups.get))

s = ""
for fname in glob.glob("*.*.*.[RTZ]"):
    cmd = 'saclst delta f {}'.format(fname).split()
    delta0 = float(subprocess.check_output(cmd).decode().split()[1])
    if delta == delta0:  # 不需要重采样
        continue

    s += "r {} \n".format(fname)
    # 用 interpolate 实现减采样或增采样
    # 若是减采样，则需要对数据做低通滤波以防止出现混淆效应
    # 低通滤波时或许需要加上 p 2 以避免滤波引起的相移
    if delta > delta0:
        s += "lp c {} \n".format(0.5/delta)
    s += "interpolate delta {} \n".format(delta)
    s += "w over \n"
s += "q \n"
subprocess.Popen(['sac'], stdin=subprocess.PIPE).communicate(s.encode())

os.chdir("..")
