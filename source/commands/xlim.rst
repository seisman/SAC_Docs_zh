xlim
====

概要
----

设定图形中 X 轴的范围

语法
----

.. code-block:: bash

    XLIM [ON|OFF|pdw|SIGNAL]

输入
----

pdw
    打开 X 轴范围选项并设置范围为新的“partial data window”，参考 :ref:`subsec:pdw`

SIGNAL
    等同于输入 ``A -1 F +1``\ ，即初至前1秒到事件结束的后1秒

ON
    打开 X 轴范围选项，但不改变 X 轴范围值

OFF
    关闭 X 轴范围选项，即根据数据的自变量范围决定 X 轴范围

缺省值
------

.. code-block:: bash

    xlim off

说明
----

当此选项关闭时，会根据数据自变量的范围决定绘图时 X 轴的范围。当此选项
打开时，限定 X 轴的范围，可以通过此种方式“放大”当前内存中数据的图形。
