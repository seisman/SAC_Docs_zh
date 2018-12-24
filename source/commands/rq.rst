rq
==

概要
----

从谱文件中去除 Q 因子

语法
----

.. code-block:: bash

    RQ [Q v] [R v] [C v]

输入
----

Q v
    设置质量因子为 ``v``

R v
    设置距离为 ``v``\ ，单位为 km

C v
    设置群速度为 ``v``\ ，单位 km/s

缺省值
------

.. code-block:: bash

    rq q 1. r 0. c 1.

说明
----

该命令用于从波形数据中去除Q衰减效应，用于校正振幅谱的方程如下：

.. math:: AMP_{corrected}(f) = AMP_{uncorrected}(f) * e^{\frac{\pi R f}{Q C}}

其中 :math:`f` 为频率，单位为 Hz，\ :math:`R` 为距离，单位 km，
:math:`C` 是群速度，单位为 km/s。Q 是一个无量纲衰减因子。

头段变量
--------

depmin、depmax、depmen

限制
----

实际上各参数应是频率的函数，目前限制为常数值。
