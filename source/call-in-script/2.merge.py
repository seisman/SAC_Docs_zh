#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import glob
import subprocess

os.putenv("SAC_DISPLAY_COPYRIGHT", '0')

if len(sys.argv) != 2:
    sys.exit("python {} dirname".format(sys.argv[0]))

dirname = sys.argv[1]

os.chdir(dirname)

# 利用 dict 的 key 的不可重复性构建集合:
#     dict 的 key 定义为 NET.STA.LOC.CHN
#     dict 的 value 是文件名与 key 匹配的 SAC 文件数目
sets = {}
for fname in glob.glob("*.SAC"):
    key = '.'.join(fname.split('.')[6:10])
    if key not in sets:
        sets[key] = 1
    else:
        sets[key] += 1

# prepare sac commands
s = "wild echo off \n"
to_del = []
for key, value in sets.items():
    # 仅当 value 大于1时才需要 merge
    if value == 1:
        continue

    print("merge {}: {} traces".format(key, value))
    # Python 的 glob 返回值是乱序的，因而必须 sort
    traces = sorted(glob.glob('.'.join(['*', key, '?', 'SAC'])))

    # 在 SAC 中使用通配符而不是使用 @traces 以避免命令行过长的问题
    # merge 不支持通配符
    s += "r *.{}.?.SAC \n".format(key)    # SAC v101.6 or later
    # 缺数据则补0，重叠则做平均
    s += "merge gap zero overlap average \n"
    s += "w {} \n".format(traces[0])      # 以最早数据段的文件名保存

    to_del.extend(traces[1:])

s += "q \n"
subprocess.Popen(['sac'], stdin=subprocess.PIPE).communicate(s.encode())

# 删除多余的数据段
for file in to_del:
    os.unlink(file)

os.chdir("..")
