convolve
========

概要
----

计算主信号与内存中所有信号的卷积

语法
----

.. code-block:: bash

    CONVOlve [Master name|n] [Number n] [Length ON|OFF|v]
        [Type Rectangle|HAMming|HANning|Cosine|Triangle]

输入
----

MASTER name|n
    通过文件名或文件号指定某文件为主文件，内存中的 所有文件将与主文件进行卷积

NUMBER n
    设置卷积窗的数目

LENGTH ON
    打开/关闭固定窗长选项开关

LENGTH v
    打开固定窗长选项开关，并设置窗长度为 ``v`` 秒

TYPE RECTANGLE
    对每个窗应用一个矩形函数，这等价于不对窗加上函数

TYPE HAMMING|HANNING|COSINE|TRIANGlE
    对每个窗应用 XX 函数

缺省值
------

.. code-block:: bash

    convolve master 1 number 1 length off type rectangle

说明
----

该命令允许用户指定一个主信号，并将主信号与自己及其它信号做卷积。如果内存
中有 N 个 SAC 文件，则输出文件为 N 个文件与主文件卷积的结果。卷积公式如下，

.. math:: CV(t) = \int_{-\infty} ^\infty f(\tau)g(t-\tau)d\tau

需要注意的是，实际代码中该卷积在频率域完成，且没有进行归一化。内存中所有
的信号需要有相同的 ``delta``\ 。

该算法假定所有的时间序列都是因果的，因此如果你想要将信号卷积上一个 boxcar
函数（非因果低通滤波器，可用于平滑合成波形中的尖峰），输出信号将出现半个
boxcar 宽度的时移。

头段变量
--------

depmin、depmax、depmen
