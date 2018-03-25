#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import glob
import subprocess

os.putenv("SAC_DISPLAY_COPYRIGHT", '0')

if len(sys.argv) != 2:
    sys.exit("python %s dirname" % sys.argv[0])

dir = sys.argv[1]

os.chdir(dir)

# 利用dict的key的不可重复性构建集合:
#     dict的key定义为 NET.STA.LOC.CHN
#     dict的value是文件名与key匹配的SAC文件数目
sets = {}
for fname in glob.glob("*.SAC"):
    net, sta, loc, chn = fname.split('.')[6:10]
    key = '.'.join([net, sta, loc, chn])
    if key not in sets:
        sets[key] = 1
    else:
        sets[key] += 1

p = subprocess.Popen(['sac'], stdin=subprocess.PIPE)
s = "wild echo off \n"
to_del = []
for key, value in sets.items():
    # 仅当value大于1时才需要merge
    if value == 1:
        continue

    print("merge %s: %d traces" % (key, value))
    # Python的glob返回值是乱序的，因而必须sort
    traces = sorted(glob.glob('.'.join(['*', key, '?', 'SAC'])))

    # 在SAC中使用通配符而不是使用@traces以避免命令行过长的问题
    # merge不支持通配符
    s += "r *.%s.?.SAC \n" % key    # SAC v101.6 or later
    s += "merge \n"
    s += "w %s \n" % traces[0]      # 以最早数据段的文件名保存

    to_del.extend(traces[1:])

s += "q \n"
p.communicate(s.encode())

# 删除多余的数据段
for file in to_del:
    os.unlink(file)

os.chdir("..")
