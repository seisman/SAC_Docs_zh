#include <stdio.h>
#include "sac.h"

int main() {
    SACHEAD hd;

    read_sachead("seis.SAC", &hd);
    fprintf(stderr, "%d %f %f %f\n", hd.npts, hd.delta, hd.depmax, hd.depmin);

    return 0;
}
