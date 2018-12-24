markvalue
=========

概要
----

在数据文件中搜索并标记某个值

语法
----

.. code-block:: bash

    MARKValue [GE|LE v] [TO marker]

输入
----

GE v
    搜索并标记第一个大于或等于 ``v`` 的数据点

LE v
    搜索并标记第一个小于或等于 ``v`` 的数据点

TO marker
    用于保存数据点的时刻的时间标记头段，\ ``marker`` 可以取 ``Tn``\ （n=0–9）

缺省值
------

.. code-block:: bash

    markvalue ge 1 to t0

说明
----

该命令会在信号的测量时间窗内搜索第一个满足条件（大于或等于/小于或等于）的
数据点，并将该数据点所对应的时刻记录下来。默认情况下，测量时间窗为整个信号，
可以使用 :doc:`/commands/mtw` 命令设置新的测量时间窗。

示例
----

搜索文件中第一个值大于 3.4 的点并将结果保存在头段 ``T7`` 中：

.. code-block:: bash

    SAC> markvalue ge 3.4 to t7

设定测量时间窗为 ``T4`` 后的10秒，并搜索第一个小于-3的值：

.. code-block:: bash

    SAC> mtw t4 0 10
    SAC> markvalue le -3 to t5

头段变量改变
------------

Tn、KTn
