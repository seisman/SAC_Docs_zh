grid
====

概要
----

控制绘图时的网格线

语法
----

.. code-block:: bash

    GRID [ON|OFF|Solid|Dotted]

输入
----

SOLID
    设置网格线为实线

DOTTED
    设置网格线为虚线

ON
    绘制网格，但不改变网格类型

OFF
    不绘制网格

缺省值
------

.. code-block:: bash

    grid off

说明
----

该命令控制X和Y轴的网格线的绘制。可以使用 :doc:`/commands/xgrid` 和
:doc:`/commands/ygrid` 分别控制单个坐标轴的网格类型。
