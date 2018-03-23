khronhite
=========

概要
----

对数据应用Khronhite滤波器

语法
----

.. code:: bash

    KHRONHITE [v]

输入
----

v
    截断频率，单位 Hz

缺省值
------

.. code:: bash

    khronhite 2.0

说明
----

此低通滤波器是两个级联的四阶Butterworth低通模拟滤波器的数字近似。
其拐角频率为 0.1Hz 以增强区域地震的基模瑞利波（Rg）的振幅信号。

头段变量
--------

depmin、depmax、depmen
