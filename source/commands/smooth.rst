smooth
======

概要
----

对数据应用算术平滑算法

语法
----

.. code-block:: bash

    SMOOTH [MEAN|MEDIAN] [Halfwidth n]

输入
----

MEAN|MEDIAN
    应用均值/中值平滑算法

HALFWIDTH n
    设置滑动窗的半宽为n个数据点

缺省值
------

.. code-block:: bash

    smooth mean halfwidth 1

说明
----

此命令对数据应用算术平滑算法，可以选择均值平滑或中值平滑算法。

滑动窗的窗长通过指定其半宽度 n 来定义，对于第 n 到第 npts-n+1 个的每个数据点而言，
应用一个窗长为 2n+1 个数据点平滑窗。对于两端的 2(n-1) 个数据点而言，做特殊处理。

头段变量
--------

depmin、depmax、depmen
