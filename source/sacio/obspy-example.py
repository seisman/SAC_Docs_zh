#!/usr/bin/env python
# -*- coding: utf-8 -*-

from obspy.clients.fdsn import Client
from obspy import UTCDateTime

client = Client("IRIS")

t = UTCDateTime("2010-02-27T06:45:00.000")

inventory = client.get_stations(network="IC", station="BJT", location="00",
                                channel="BH*", level="response", starttime=t)
st = client.get_waveforms("IC", "BJT", "00", "BH*", t, t + 60 * 60)
st.detrend(type="demean")  # rmean
st.detrend(type="linear")  # rtrend
st.taper(max_percentage=0.05)  # taper
# transfer to vel freq 0.005 0.01 10 25
st.remove_response(inventory=inventory, output="VEL",
                   pre_filt=[0.005, 0.01, 10, 25])
# bandpass c 1 10 n 2 p 2
st.filter('bandpass', freqmin=0.01, freqmax=0.1, corners=2, zerophase=True)
st.plot()
