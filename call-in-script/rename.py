#!/usr/bin/env python
# -*- coding: utf8 -*-
import os
import glob

for file in glob.glob("*.SAC"):
    item = file.split('.')
    os.rename(file, "%s.%s.%s.%s" % (item[6], item[7], item[8], item[9]))
