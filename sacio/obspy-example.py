#!/usr/bin/env python
# -*- coding: uft8 -*-
from obspy import read
import numpy as np
import matplotlib.pyplot as plt

st = read("*.z")

for tr in st:
    tr_filt = tr.copy()
    tr_filt.filter('lowpass', freq=0.05, corners=2, zerophase=True)

    # Now let's plot the raw and filtered data...
    t = np.arange(0, tr.stats.npts / tr.stats.sampling_rate, tr.stats.delta)
    plt.subplot(211)
    plt.plot(t, tr.data, 'k')
    plt.ylabel('Raw Data')
    plt.subplot(212)
    plt.plot(t, tr_filt.data, 'k')
    plt.ylabel('Lowpassed Data')
    plt.xlabel('Time [s]')
    plt.suptitle(tr.stats.starttime)
    plt.show()

    tr_filt.write(filename=tr_filt.id, format='SAC')
