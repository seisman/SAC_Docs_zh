plotspe
=======

概要
----

绘制谱估计

语法
----

.. code-block:: bash

    PlotSPE [Power|Log|Amplitude] [Confidence [ON|OFF]]

输入
----

POWER
    用线性插值绘制功率响应

LOG
    用对数内插法绘制功率响应

AMPLITUDE
    绘制振幅响应

CONFIDENCE ON
    在绘图上包含置信区间

CONFIDENCE OFF
    在绘图上不包含置信区间

缺省值
------

.. code-block:: bash

    plotsp power confidence off

说明
----

这个绘图中还包括用于计算相关函数和频谱估计的参数的描述。
