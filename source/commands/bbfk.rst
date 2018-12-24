bbfk
====

概要
----

利用 SAC 内存中的所有文件计算宽频频率波数谱估计

语法
----

.. code-block:: bash

    BBFK [Filter] [NOrmalize] [EPS v] [MLM|PDS] [Exp n] [WAwvenumber v]
        [Size m n] [Levels n] [Db] [Title text] [WRite [ON|OFF fname] [Ssq n]]

输入
----

FILTER
    使用最近一次 :doc:`/commands/filterdesign` 命令设计的带通滤波器

NORMALIZE
    用 Capo 方法归一化协方差矩阵，如果各信号道的振幅差别比较大，这是一个好方法

EPS v
    调整协方差矩阵的分量值，矩阵对角线的项是（1.0+EPS）的整数倍

MLM
    在高分辨率估计中使用最大似然法

PDS
    不采用最大似然法的功率谱密度

EXP n
    波数谱增加的幂次

WAVENUMBER v
    从中采样谱估计的波数目

SIZE m n
    极坐标中等值线的尺寸：
    ``m`` 是方位角方向上的采样 点数；
    ``n`` 是在波数方向上的采样点数。
    ``m``\ 、\ ``n`` 必须为偶数，而且其乘积最大限为40000

LEVELS n
    等值线间隔数

DB
    以分贝为单位的对数坐标图形

TITLE text
    图形标题

WRITE ON|OFF fname
    是否计算二维等值线数据并写入磁盘（xyz 类型的 SAC 文件）。\ ``fname``
    是要写入的文件名或路径名。如果没有指定文件名，则默认为 ``BBFK``

SSQ n
    二维图的尺寸（取沿着正方形每个边的采样数据点），最大允许值为200

缺省值
------

.. code-block:: bash

    bbfk eps .01 pds exp 1 wvenumber 1.0 size 90 32 levels 11
        write off ssq 100

头段数据
--------

分情况决定头段的信息：

-  若参考台站设置在 ``kuser1`` 中并且其对于所有文件是相同的，
   则所有文件的 ``user7`` 和 ``user8`` 都需要设置为偏移量
-  若所有文件台站纬度 ``stla`` 以及台站经度 ``stlo`` 都设置了，
   则偏移量通过这些经纬度计算，以第一个文件作为参考台站
-  若所有文件的 ``user7`` 和 ``user8`` 都设置了，则它们直接作为偏移量
-  若所有文件的事件纬度 ``evla`` 以及事件经度 ``evlo``
   都设置了，则他们用于计算偏移量，使用第一个台站作为参考台站

输出
----

polar 输出立即被绘制出（不保留），square 输出会写入到硬盘。
FK 的峰值、反方位角以及波数将分别写入黑板变量 ``BBFK_AMP``\ 、
``BBFK_BAZIM`` 以及 ``BBFK_WVNBR``\ 。

错误消息
--------

-  尺寸 ``m`` 或者 ``n`` 不是一个偶数
-  偏移量X、Y、Z未设置在头段变量 ``user7``\ 、\ ``user8``\ 、\ ``user9``\ 中
-  未找到 ``filterdesign`` 得到的系数数据，或者滤波器类型不是 ``BP``

限制
----

-  台站最多允许有100个
-  极性等值线的最大尺寸是 :math:`m\times n = 40000`
-  二维等值线输出的最大尺寸是 :math:`i = 200`
