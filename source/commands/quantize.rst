quantize
========

概要
----

将连续数据数字化\ [1]_

语法
----

.. code-block:: bash

    QUANTIZE [GAINS n ...] [LEVEL v] [MANTISSA n]

输入
----

GAINS n ...
    设置允许的增益表，必须单调递减的，增益的最大数目为8

LEVEL v
    设置最低增益的量化水平，即 Least Significant Bit，单位为伏特

MANTISSA n
    设置 Bits，用其尾数表示。

缺省值
------

.. code-block:: bash

    quantize gains 128 32 8 1 level 0.00001 mantissa 14

说明
----

此命令演示了与 Oppenheim 和 Schafer(1975, Fig. 9.1) 描述的“rounding”量化
算法类似的一个量化算法。

算法中的位数通过其尾数表示，则若尾数 mantissa 为 :math:`n`\ ，则表示其所
能允许的范围是 :math:`\pm \frac{2^n-1}{2}`\ 。

量化水平 level 即 least significant bit 的值，表征了系统所能识别的最小的电压
变化，缺省值为10微伏。

这个量化函数描述的信号误差是量化水平的一半。在频率域中，这个误差或量化
噪声为：

.. math:: Err = \frac{1}{12}(Delta*Level^2)

其中 Delta 是采样周期。量化噪声的单位是 counts*counts，相当于
功率谱密度。量化噪声的均方根为 :math:`\frac{1}{6}Level^2`\ 。然而，仅当信号的均方根
水平远大于量化噪声的均方根值时，才是量化噪声的一个精确的近似。

头段变量
--------

depmin、depmax、depmen

.. [1] 无法理解这个命令，请阅读官方文档
