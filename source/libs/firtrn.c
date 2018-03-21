#include <stdio.h>
#include <stdlib.h>
#define NPTS 1000
float *hilbert(float *in, int npts);
int main(){
    float data[NPTS];
    float *hdata;
    int i;
    // 准备输入数据
    for (i=0; i<NPTS; i++)  data[i] = i;
    // 进行Hilbert变换，hdata为Hilbert变换的结果
    hdata = hilbert(data, NPTS);
    for (i = 0; i < NPTS; i++)
        printf("%f\n", hdata[i]);

    free(hdata);
}

// 这里定义了hilbert函数，是对firtrn函数的一个封装
float *hilbert(float *in, int npts) {
    float *buffer;
    float *out;

    buffer = (float *)malloc(sizeof(float)*50000);
    out = (float *)malloc(sizeof(float)*npts);
    firtrn("HILBERT", in, npts, buffer, out);

    free(buffer);
    return out;
}