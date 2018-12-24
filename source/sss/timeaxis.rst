timeaxis
========

概要
----

控制剖面图的时间轴属性

语法
----

.. code-block:: bash

    TimeAxis Fixed v | Scaled v

输入
----

FIXED v
    固定时间轴的长度为v cm

SCALED v
    设定时间轴的长度为总时间窗长的v倍，v的单位为 cm/s

缺省值
------

.. code-block:: bash

    timeaxis fixed 23.0

示例
----

如果你在做多个不同时间窗长的剖面图，并希望剖面图中每秒对应0.5厘米长：

.. code-block:: bash

    SAC> timeaxis scaled 0.5
