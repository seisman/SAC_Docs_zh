调用 libsac 库
==============

next2
-----

SAC在做 FFT 时要保证数据点数为 :math:`2^n` 个，对于不足 :math:`2^n` 个点的数据
需要补零至 :math:`2^n` 次方个点。

``next2`` 函数定义为：

.. code-block:: c

    int next2(int num)  // 输入为 num，返回值为大于 num 的最小2次幂

xapiir
------

``xapiir`` 用于设计IIR滤波器，并对数据进行滤波。这个子函数底层调用了
``design`` 和 ``apply`` 两个子函数。

.. code-block:: c

    void xapiir(float  *data,      // 待滤波的数据，滤波后的数据保存在该数组中
                int     nsamps,    // 数据点数
                char   *aproto,    // 滤波器类型
                                   //  - 'BU': butterworth
                                   //  - 'BE': bessel
                                   //  - 'C1': chebyshev type I
                                   //  - 'C2': chebyshev type II
                double  trbndw,    // chebyshev 滤波器的过渡带宽度
                double  a,         // chebyshev 滤波器的衰减因子
                int     iord,      // 滤波器阶数
                char   *type,      // 滤波类型: 'LP','HP','BP','BR'
                double  flo,       // 低频截断频率
                double  fhi,       // 高频截断频率
                double  ts,        // 采样周期
                int     passes)    // 通道数，1或2

相关示例代码为 ``filterc.c`` 和 ``filterf.f``\ 。

firtrn
------

``firtrn`` 用于做数据应用 FIR 滤波器或对数据做 Hilbert 变换：

.. code-block:: c

    void firtrn(char  *ftype,     // 类型，取'HILBERT'或'DERIVATIVE'
                float *x,         // 输入数据
                int    n,         // 数据点数，至少含201个点
                float *buffer,    // 临时数组，长度至少4297
                float *y)         // 输出数组

下面的示例展示了如何计算数据的Hilbert变换:

.. literalinclude:: firtrn.c
   :language: C

envelope
--------

该子函数用于计算数据的包络函数，其底层调用了 ``firtrn`` 函数。

.. code-block:: c

    void envelope(int    n,     // 数据点数
                  float *in,    // 输入数据
                  float *out)   // 输出数据

需要注意，\ ``in`` 和 ``out`` 不能是同一个数组。

相关示例代码为 ``envelopec.c`` 和 ``envelopef.f`` 。

crscor
------

该子函数用于计算两个数据的互相关，此互相关在频率域中完成，相对时间域
互相关而言效率更高。

.. code-block:: c

    void crscor(float *data1,     // 数据1
                float *data2,     // 数据2
                int    nsamps,    // 数据点数
                int    nwin,      // 相关窗数目
                int    wlen,      // 窗内数据点数，最大值为2048
                char  *type,      // 窗类型，可以取'HAM','HAN','C','R','T'
                float *c,         // 输出数据，长度为2*wlen-1
                int   *nfft,      // 相关序列的数据点数
                char  *err,       // 错误消息
                int    err_s)     // 错误消息长度

示例代码为 ``convolvec.c``\ 、\ ``convolvef.f``\ 、\ ``correlatec.c`` 和
``correlatef.f``\ 。

rms
---

该子函数用于计算信号的均方根，其中计算公式为：

.. math:: RMS = \sqrt{\sum_{i=1}^N y_i^2}

该公式与命令 :doc:`/commands/rms` 中的公式略有不同，严格来说，这里的定义是有
问题的，因而对于该子程序计算出的结果，要除以根号 N 才是真正的均方根。

函数原型为：

.. code-block:: c

    double rms(float *x,            // 输入数据
               int nsamps)          // 数据点数

示例代码：

.. literalinclude:: rms.c
   :language: C
