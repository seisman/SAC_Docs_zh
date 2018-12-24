funcgen
=======

概要
----

生成一个函数并将其存在内存中

语法
----

.. code-block:: bash

    FuncGen [type] [Delta v] [Npts n] [BEgin v]

其中 ``type`` 是下面中的一个：

.. code-block:: bash

    IMPulse | STep | Boxcar | Triangle | SINE [v1 v2] | Line [v1 v2] |
    Quadratic [v1 v2 v3] | CUBIC [v1 v2 v3 v4] | SEISmogram |
    Random [v1 v2] | IMPSTRIN  [n1 n2 ... nN]

输入
----

IMPULSE
    位于时间序列中点的脉冲函数

IMPSTRIN n1 n2 ... nN
    在指定的一系列数据点处产生脉冲函数

STEP
    阶跃函数。数据的前半段为0，后半段为1

BOXCAR
    矩形函数。数据的前、后三分之一值为0，中间三分之一值为1

TRIANGLE
    三角函数。数据的第一个四分之一值为0，第二个四分之一的
    值从0线性增加到1，第三个四分之一的值从1线性减少到0，最后四分之一值为0

SINE v1 v2
    正弦函数。\ ``v1`` 表示频率，单位为 Hz； ``v2``
    是以度为单位的相位角。正弦函数的振幅为1，
    注意在相位参数中有一个 :math:`2\pi` 因子：\ :math:`F = 1.0 n (2\pi (v_1t+v_2))`

LINE v1 v2
    线性函数。斜率为 ``v1``\ ，截距为 ``v2``\ ， 即 :math:`v_1 t + v_2`

QUADRATIC v1 v2 v3
    二次函数 :math:`v_1 t^{2} + v_2 t + v_3`

CUBIC v1 v2 v3 v4
    三次函数 :math:`v_1 t^{3} + v_2 t^2 + v_3t + v_4`

SEISMOGRAM
    地震样本数据。此样本数据有1000个数据点。\ ``DELTA``\ 、 ``NPTS`` 和
    ``BEGIN`` 选项对该样本数据无效

RANDOM v1 v2
    生成随机序列（高斯白噪声）。\ ``v1`` 是要生成的
    随机序列文件的数目，\ ``v2`` 是用于产生第一个随机数的“种子”，
    该种子值保存在 ``USER0`` 中，因而如果需要你可以在稍后生成一个
    完全相同的随机序列

DELTA v
    设置采样周期为 ``v``\ ，储存在头段 ``delta`` 中

NPTS n
    设置函数的数据点数为 ``n``\ ，储存在头段 ``npts`` 中

BEGIN v
    设置起始时间为 ``v``\ ，储存在头段 ``b`` 中

缺省值
------

.. code-block:: bash

    funcgen impulse npts 100 delta 1.0 begin 0.

对于正弦函数频率和相位缺省值分别为0.05和0。
一次、二次、三次函数的系数都是1。 随机序列数为1，种子是12357。

说明
----

执行这个命令等效于读取单个文件（\ ``RANDOM`` 选项会生成多个文件）
到内存中，文件名即为函数名。内存中原有的数据会被该命令生成的函数所替换。

示例
----

下面的命令可以用于生成一个随机白噪声：

.. code-block:: bash

    SAC> fg random 1 1 npts 10000 delta 0.01
