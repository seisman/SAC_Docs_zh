#!/usr/bin/env python
import os
import re
import glob
import subprocess


def merge(seedfile):
    m = re.compile(r'Sta\s+Loc\s+Chn\s+Net')

    rdseed = subprocess.Popen(['rdseed', '-cf', seedfile],
                              stdout=subprocess.PIPE)
    lines = rdseed.stdout.readlines()

    for index in range(len(lines)):
        if m.search(str(lines[index])):
            break

    for line in lines[index+1:len(lines)-1]:
        items = line.decode('utf-8').split()

        if len(items) == 12:
            net, sta, chn, loc = items[4], items[1], items[3], items[2]
        elif len(items) == 11:
            net, sta, chn, loc = items[3], items[1], items[2], ''

        sacfiles = glob.glob('.'.join(['*', net, sta, loc, chn, '?.SAC']))

        if len(sacfiles) == 1:  # no need to merge
            next
        elif len(sacfiles) > 1:  # multiple segments, need merge
            p = subprocess.Popen(['sac'], stdin=subprocess.PIPE)
            s = ""
            s += "wild echo off\n"
            s += "r *.%s.%s.%s.%s.?.SAC \n" % (net, sta, loc, chn)
            s += "merge \n"
            s += "w %s \n" % sacfiles[0]
            s += "q\n"
            p.communicate(s.encode())
            for file in sacfiles[1:]:
                os.unlink(file)


seed = "2004.001.20.59.31.0910.879937.seed"
merge(seed)
