.. _sss:timeaxis:

timeaxis
========

概要
----

控制剖面图的时间轴属性

语法
----

.. code:: bash

    T\verb|IME|A\verb|XIS| F\verb|IXED| v | S\verb|CALED| v

输入
----

FIXED v
    固定时间轴的长度为v

SCALED v
    设定时间轴的长度为总时间窗长的v倍，v的单位为

缺省值
------

timeaxis fixed 23.0

示例
----

如果你在做多个不同时间窗长的剖面图，并希望剖面图中每秒对应0.5厘米长：

.. code:: bash

    SAC> timeaxis scaled 0.5
