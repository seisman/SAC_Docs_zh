#!/usr/bin/env python
# -*- coding: utf8 -*-

import os
import sys
import glob
import subprocess

os.putenv("SAC_DISPLAY_COPYRIGHT", '0')

if len(sys.argv) != 2:
    sys.exit("Usage: python %s dirname" % sys.argv[0])

dir = sys.argv[1]
os.chdir(dir)

# 构建 NET.STA.LOC.CH 的集合
sets = set()
for fname in glob.glob("*.SAC"):
    net, sta, loc, chn = fname.split('.')[0:4]
    key = '.'.join([net, sta, loc, chn[0:2]])
    sets.add(key)

p = subprocess.Popen(['sac'], stdin=subprocess.PIPE)
s = ""
for key in sets:
    # 检测Z分量是否存在
    Z = key + "Z.SAC"
    if not os.path.exists(Z):
        print("%s: Vertical component missing!\n" % key)
        for fname in glob.glob(key + "?.SAC"):
            os.unlink(fname)
        continue

    # 检测水平分量是否存在
    if os.path.exists(key + "E.SAC") and os.path.exists(key + "N.SAC"):
        E = key + "E.SAC"
        N = key + "N.SAC"
    elif os.path.exists(key + "1.SAC") and os.path.exists(key + "2.SAC"):
        E = key + "1.SAC"
        N = key + "2.SAC"
    else:
        print("%s: Horizontal components missings!\n" % key)
        for fname in glob.glob(key + "?.SAC"):
            os.unlink(fname)
        continue

    # 检查B, E, DELTA
    Zb, Ze, Zdelta = subprocess.check_output(['saclst', 'b', 'e', 'delta', 'f', Z]).decode().split()[1:]
    Eb, Ee, Edelta = subprocess.check_output(['saclst', 'b', 'e', 'delta', 'f', E]).decode().split()[1:]
    Nb, Ne, Ndelta = subprocess.check_output(['saclst', 'b', 'e', 'delta', 'f', N]).decode().split()[1:]

    # 获取三分量的最大B和最小E值作为数据窗
    begin = max(float(Zb), float(Eb), float(Nb))
    end = min(float(Ze), float(Ee), float(Ne))

    # 输出文件名为 NET.STA.LOC.[RTZ]
    prefix = key[:-2]
    R, T, Z0 = prefix + '.R', prefix + '.T', prefix + '.Z'

    s += "cut %f %f \n" % (begin, end)
    s += "r %s %s \n" % (E, N)
    s += "rotate to gcp \n"
    s += "w %s %s \n" % (R, T)
    s += "r %s \n" % Z
    s += "w %s \n" % Z0
s += "q \n"
p.communicate(s.encode())

# 删除原文件
for fname in glob.glob("*.SAC"):
    os.unlink(fname)

os.chdir("..")
