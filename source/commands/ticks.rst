ticks
=====

概要
----

控制绘图上刻度轴的位置

语法
----

.. code-block:: bash

    TICKS [ON|OFF|ONLY] [All] [Top] [Bottom] [Right] [Left]

输入
----

ON
    在指定的边上显示刻度，其他不变

OFF
    在指定的边上不显示刻度，其他不变

ONLY
    仅在指定的边上显示刻度，其他关闭

ALL
    所有四条边

TOP
    X 轴的上边

BOTTOM
    X 轴的下边

RIGHT
    Y 轴的右边

LEFT
    Y 轴的左边

缺省值
------

.. code-block:: bash

    ticks on all

说明
----

刻度轴可以画图形四边的一边或几边上，刻度间隔由 :doc:`/commands/xdiv` 命令控制。

示例
----

显示上部刻度轴，其他不变：

.. code-block:: bash

    SAC> ticks on top

关闭所有刻度轴：

.. code-block:: bash

    SAC> ticks off all

只显示底部刻度轴：

.. code-block:: bash

    SAC> ticks only bottom
