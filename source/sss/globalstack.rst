.. _sss:globalstack:

globalstack
===========

概要
----

设置全局叠加属性

语法
----

.. code:: bash

    G\verb|LOBAL|S\verb|TACK| [W\verb|EIGHT| v] [DI\verb|STANCE| v] [DE\verb|LAY| v [S\verb|ECONDS||P\verb|OINTS|]]
        [I\verb|NCREMENT| v [S\verb|ECONDS||P\verb|OINTS|] [N\verb|ORMAL||R\verb|EVERSED|]

输入
----

WEIGHT v
    全局权重因子，取值为0至1；

DISTANCE v
    全局震中距，单位为 ；

DELAY v SECONDS|POINTS
    全局静时间延迟，单位为 或数据点数；

INCREMENT v SECONDS|POINTS
    全局静时间延迟的增量，单位为 或数据点数；

NORMAL|REVERSED
    正/负极性；

说明
----

该命令用于定义全局叠加属性，这些全局叠加属性用于叠加文件列表中的每个文件。可以使用
命令为某个文件单独设定叠加属性。
