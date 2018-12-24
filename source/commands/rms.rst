rms
===

概要
----

计算测量时间窗内信号的均方根

语法
----

.. code-block:: bash

    RMS [NOISE ON|OFF|pdw] [TO USERn]

输入
----

NOISE ON/OFF
    打开/关闭噪声校正选项

NOISE pdw
    打开噪声校正选项并设置噪声的测量时间窗，见 :ref:`subsec:pdw`

TO USERn
    将计算结果保存到头段变量 ``USERn`` 中（n取0到9）

缺省值
------

.. code-block:: bash

    rms noise off to user0

说明
----

该命令用于计算当前测量时间窗（由 :doc:`/commands/mtw` 定义）内数据的均方根，
并将计算结果保存到头段变量 ``USERn`` 中。

均方根的定义为：

.. math:: RMS = \sqrt{\frac{1}{N} \sum_{i=1}^N y_i^2}

``NOISE`` 选项用于校正计算结果中噪声的贡献。其计算公式为：

.. math::

   RMS_{corrected} = \sqrt{\frac{1}{N} \sum_{i=1}^N y_i^2 -
               \frac{1}{M} \sum_{j=1}^M y_j^2}

即，先计算 ``mtw`` 定义的信号时间窗内数据点的平方和均值，然后计算
``NOISE pdw`` 定义的噪声时间窗内数据点的平方和均值，从信号的平方
和均值中减去噪声的平方和均值，以校正噪声的贡献，最后将校正后的平方和均值
的开方作为测量结果保存到头段变量中。

示例
----

计算头段变量 ``T1`` 和 ``T2`` 之间的数据的未做噪声校正的均方根，
并将结果保存在头段 ``USER4`` 中：

.. code-block:: bash

    SAC> mtw t1 t2
    SAC> rms to user4

将 ``T3`` 前5秒作为噪声窗，计算校正噪声后的均方根：

.. code-block:: bash

    SAC> mtw t1 t2
    SAC> rms noise t3 -5.0 0.0

头段变量
--------

``USERn``
