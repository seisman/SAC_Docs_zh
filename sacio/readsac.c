#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sac.h"

int main (int argc, char *argv[]) {
    char    file[80];
    SACHEAD hd;
    float   *data;
    int     i;

    strcpy(file, "seis.SAC");

    // 读入数据
    data = read_sac(file, &hd);
    fprintf(stderr, "npts=%d delta=%f \n", hd.npts, hd.delta);

    // 其它数据处理
    for (i=0; i<hd.npts; i++) {
        data[i] *= 0.1;
    }

    // 将结果写回到原文件中
    write_sac(file, hd, data);

    free(data);
    return 0;
}
