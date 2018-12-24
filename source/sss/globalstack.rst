globalstack
===========

概要
----

设置全局叠加属性

语法
----

.. code-block:: bash

    GlobalStack [Weight v] [DIstance v] [DElay v [Seconds|Points]]
        [Increment v [Seconds|Points] [Normal|Reversed]

输入
----

WEIGHT v
    全局权重因子，取值为0至1；

DISTANCE v
    全局震中距，单位为 km；

DELAY v SECONDS|POINTS
    全局静时间延迟，单位为 s 或数据点数；

INCREMENT v SECONDS|POINTS
    全局静时间延迟的增量，单位为 s 或数据点数；

NORMAL|REVERSED
    正/负极性；

说明
----

该命令用于定义全局叠加属性，这些全局叠加属性用于叠加文件列表中的每个文件。可以使用
:doc:`/sss/addstack` 命令为某个文件单独设定叠加属性。
