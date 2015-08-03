#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sac.h"

int main (int argc, char *argv[]) {
    char fin[80], fout[80];
    SACHEAD hd;
    float   *data;
    int     tmark;
    float   t1, t2;
    int     i;

    strcpy(fin, "seis.SAC");

    tmark   =   0;
    t1      =   -0.5;
    t2      =   2.5;

    data = read_sac2(fin, &hd, tmark, t1, t2);
    fprintf(stderr, "npts=%d delta=%f\n", hd.npts, hd.delta);

    for (i=0; i<hd.npts; i++) {
        data[i] += 0.1;
    }

    strcpy(fout, "seis.SAC.cut");
    write_sac(fout, hd, data);

    free(data);
    return 0;
}
