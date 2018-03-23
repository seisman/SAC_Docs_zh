distanceaxis
============

概要
----

定义剖面图的距离轴参数

语法
----

.. code:: bash

    D!ISTANCE!A!XIS! F!IXED! v | S!CALED! v

输入
----

FIXED v
    固定距离轴的长度为v厘米

SCALED v
    设定距离轴的长度为总距离范围除以v，v的单位为 。

缺省值
------

.. code:: bash

    distanceaxis fixed 35

示例
----

若剖面图的距离范围为 150km 到 300km，则如下命令设置 距离轴长度为 75cm：

.. code:: bash

    SAC> distanceaxis scaled 2.0
