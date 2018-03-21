#!/bin/bash
export SAC_DISPLAY_COPYRIGHT=0
sub=teleseis
sta=nykm
sac << EOF
dg sub $sub $sta.[enz]
traveltime phase P S picks 0
w $sta.e $sta.n $sta.z
r $sta.n $sta.e
rotate to gcp
w $sta.r $sta.t
r $sta.n $sta.e $sta.z
qdp 300
fileid type name location ul
ylim -8 8
ydiv inc 5
beginframe
yvport 0.55 0.95
title "Seismograms of NEZ Components"
p1
r $sta.r $sta.t $sta.z
yvport 0.08 0.45
title "Seismograms of RTZ Components"
p1
endframe
saveimg rotate.ps
q
EOF
rm $sta.[nezrt]
ps2raster -A -Tf rotate.ps
ps2raster -A -Tg rotate.ps
rm rotate.ps
