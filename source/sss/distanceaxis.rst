.. _sss:distanceaxis:

distanceaxis
============

概要
----

定义剖面图的距离轴参数

语法
----

.. code:: bash

    D\verb|ISTANCE|A\verb|XIS| F\verb|IXED| v | S\verb|CALED| v

输入
----

FIXED v
    固定距离轴的长度为v厘米

SCALED v
    设定距离轴的长度为总距离范围除以v，v的单位为 。

缺省值
------

distanceaxis fixed 35

示例
----

若剖面图的距离范围为 150 到 300，则如下命令设置 距离轴长度为 75：

.. code:: bash

    SAC> distanceaxis scaled 2.0
