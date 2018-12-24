lowpass
=======

概要
----

对数据文件应用一个无限脉冲低通滤波器

语法
----

.. code-block:: bash

    LowPass [BUtter|BEssel|C1|C2] [Corners v1 v2] [Npoles n] [Passes n]
        [Tranbw v] [Atten v]

输入
----

BUTTER
    应用一个 Butterworth 滤波器

BESSEL
    应用一个 Bessel 滤波器

C1
    应用一个 Chebyshev I 型滤波器

C2
    应用一个 Chebyshev II 滤波器

CORNERS v1 v2
    设定拐角频率分别为 v1 和 v2，即频率通带为 v1–v2

NPOLES n
    设置极数为 ``n``\ ，可以取1到10之间的整数

PASSES n
    设置通道数为 ``n``\ ，可以取1或2

TRANBW v
    设置 Chebyshev 转换带宽为 v

ATTEN v
    设置 Chebyshev 衰减因子为 v

缺省值
------

.. code-block:: bash

    lowpass butter corner 0.2 npoles 2 passes 1 tranbw 0.3 atten 30

说明
----

参见 :doc:`/commands/bandpass` 命令的相关说明。

示例
----

应用一个四极 Butterworth，拐角频率为 2 Hz：

.. code-block:: bash

    SAC> lp n 4 c 2

在此之后如果要应用一个二极双通具有相同频率的 Bessel：

.. code-block:: bash

    SAC> lp n 2 be p 2

头段变量改变
------------

depmin、depmax、depmen
