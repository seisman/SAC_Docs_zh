#include <stdio.h>
#include <stdlib.h>

void distaz(double, double, float*, float*, int,
        float*, float*, float*, float*, int*);

int main() {
    float evla, evlo, stla, stlo;
    float dist, az, baz, gcarc;
    int nsta, nerr;

    evla = 20;
    evlo = 35;
    stla = 59;
    stlo = 45;
    nsta = 1;

    distaz(evla, evlo, &stla, &stlo, nsta, &dist, &az, &baz, &gcarc, &nerr);
    fprintf(stderr, "%f %f %f %f\n", az, baz, gcarc, dist);

    return 0;
}
