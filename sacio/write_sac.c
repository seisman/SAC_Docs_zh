#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sac.h"

int main (int argc, char *argv[]) {
    char    fout[80];
    SACHEAD hd;
    float   *data;

    float   delta;
    int     npts;
    float   b;

    int     i;

    delta = 0.01;       // 采样周期
    npts  = 1000;       // 数据点数
    b     = 10;         // 文件开始时间
    hd = sachdr(delta, npts, b);    // 构建基本头段
    hd.dist     = 10;   // 给其它头段变量赋值
    hd.cmpaz    = 0.0;
    hd.cmpinc   = 0.0;

    strcpy(fout, "seis.syn");
    // 生成合成数据
    data = (float *)malloc(sizeof(float)*npts);
    for (i=0; i<npts; i++) {
        data[i] = i;
    }

    // 写入到文件中
    write_sac(fout, hd, data);
    free(data);

    return 0;
}
