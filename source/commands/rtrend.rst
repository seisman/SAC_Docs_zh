rtrend
======

概要
----

去除线性趋势

语法
----

.. code-block:: bash

    RTRend [Quiet|Verbose]

输入
----

QUIET
    不显示线性拟合信息

VERBOSE
    终端显示线性拟合信息

缺省值
------

.. code-block:: bash

    rtrend quiet

说明
----

该命令利用最小二乘方法将数据拟合成一条直线，然后从数据中减去该直线所
表征的线性趋势。数据可以是不等间隔的。

若有 n 个数据 :math:`(x_i,y_i)`\ ，利用最小二乘法拟合直线 :math:`y=ax+b`\ 。其中斜率为

.. math::

   a = \frac{n\sum x_i y_i - \sum x_i \sum y_i}
       {n\sum x_i^2 - (\sum x_i)^2}

Y 轴截距为

.. math::

   b = \frac{\sum x_i^2 \sum y_i - \sum x_i \sum x_i y_i}
       {n\sum x_i^2 - (\sum x_i)^2}

内存中最后一个文件的线性拟合参数将会写入到如下黑板变量中：

-  ``RTR_SLP`` 直线斜率
-  ``RTR_YINT`` 直线的Y截距
-  ``RTR_SDSLP`` 斜率的标准差
-  ``RTR_SDYINT`` Y截距的标准差
-  ``RTR_SDDTA`` 数据的标准差
-  ``RTR_CORRCF`` 数据和拟合结果的相关系数

头段变量改变
------------

depmin、depmax、depmin
