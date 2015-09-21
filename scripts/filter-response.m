fg impulse delta 0.01 npts 1000
bp c 0.2 2 n 2 p 1
beginframe
xvport 0.1 0.9; yvport 0.7 0.9
fileid off
qdp off
title 'Time Domain Response'
p
fft
xvport .1 .45; yvport .15 .55
title 'Amplitude Response'
psp am loglog
xvport .55 .9
title 'Phase Response'
psp ph linlin
endframe
