taper
=====

概要
----

对数据两端应用对称的 taper 函数，使得数据两端平滑地衰减到零

语法
----

.. code-block:: bash

    TAPER [Type HANning|HAMming|Cosine] [Width v]

输入
----

TYPE HANNING|HAMMIN|COSINE
    应用 Hanning、Hamming、余弦衰减窗

WIDTH v
    设置衰减窗的宽度占数据点数的比值为v，v取值在0.0和0.5之间

缺省值
------

.. code-block:: bash

    taper type hanning width 0.05

说明
----

taper 函数是在0和1之间取值的单调函数，若将其对称地施加于数据的首尾两端，
则可实现数据的“尖灭”。

taper 函数共计 :math:`npts*v` 个点，第一个点值为0，最后一个点的值为1，将此函数的
每个点依次于数据的第1至 :math:`npts*v` 个点相乘，使得数据数据的首端从0开始光滑地
增加到其原始值。数据的末端完全类似，此时数据由其原始值不断光滑地减小到0。

taper命令的通用形式为

.. math:: Data(j) = Data(j)*(F_0 - F_1\cos(\omega(j-1)))

 此公式应用于数据的首端，另一个完全对称的数据用于数据的尾端。

:numref:`table:taper-functions` 定义了不同的衰减函数的参数，其中 N 为
衰减窗的宽度，即 :math:`npts*v`\ 。

.. _table:taper-functions:

.. table:: taper衰减函数参数一览
   :align: center

   ======== ======================= ============ =============
   类型     :math:`\omega`          :math:`F_0`  :math:`F_1`
   ======== ======================= ============ =============
   HANNING  :math:`\frac{\pi}{N}`   0.50         0.50
   HAMMING  :math:`\frac{\pi}{N}`   0.54         0.46
   COSINE   :math:`\frac{\pi}{2N}`  1.00         1.00
   ======== ======================= ============ =============

:numref:`figure:taper-functions` 给出了不同 taper 衰减函数的曲线图，图中可以
看出，hamming 窗实际上并没有完全实现尖灭。

.. _figure:taper-functions:

.. figure:: /images/taper-functions.*
   :alt: taper 衰减函数曲线
   :width: 80.0%
   :align: center

   taper 衰减函数曲线

头段变量
--------

depmin、depmax、depmen
