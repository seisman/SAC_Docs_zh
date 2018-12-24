distanceaxis
============

概要
----

定义剖面图的距离轴参数

语法
----

.. code-block:: bash

    DistanceAxis Fixed v | Scaled v

输入
----

FIXED v
    固定距离轴的长度为v厘米

SCALED v
    设定距离轴的长度为总距离范围除以v，v的单位为 cm/km。

缺省值
------

.. code-block:: bash

    distanceaxis fixed 35

示例
----

若剖面图的距离范围为 150 km 到 300 km，则如下命令设置距离轴长度为 75 cm：

.. code-block:: bash

    SAC> distanceaxis scaled 2.0
