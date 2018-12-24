benioff
=======

概要
----

对数据使用 Benioff 滤波器

语法
----

.. code-block:: bash

    BENIOFF

说明
----

1960年左右，美国空军 VELA 计划中使用了一些可变磁阻短周期地震仪，这些仪器以
加州理工的 Hugo Benioff 教授命名。其自然频率为 1 Hz，与一个电流计
耦合在一起（自然频率为 5 Hz）。耦合因子的标称值为0.01，其响应在 1 Hz 到
5 Hz 频段内近乎为平的。

该命令生成的滤波器是 Benioff 短周期地震仪的数字等效，用于将宽频带地震数据
模拟成短周期系统。

该滤波器的响应函数如下图所示：

.. figure:: /images/benioff.*
   :alt: Benioff 滤波器的响应函数
   :width: 80.0%
   :align: center

   Benioff 滤波器的响应函数

头段变量
--------

depmin、depmax、depmen
