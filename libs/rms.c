/*
 * 本例中使用了Lupei Zhu的sacio库的数据读入子程序
 *
 * 编译方式：
 *    gcc prog.c sacio.c -lm -L/usr/local/sac/lib -lsac -lsacio
 */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "sac.h"

double rms(float *x, int nsamps);

int main() {
    SACHEAD hd;
    float *data;
    double result;

    data = read_sac("seis.SAC", &hd);
    result = rms(data, hd.npts)/sqrt(hd.npts);  // 除以根号N
    printf("rms = %lf\n", result);
}
