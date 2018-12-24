floor
=====

概要
----

对数数据的最小值

语法
----

.. code-block:: bash

    FLOOR [ON|OFF|v]

输入
----

ON
    打开 floor 选项开关但不改变其值

OFF
    关闭 floor 选项开关

v
    打开 floor 选项开关并改变阈值

缺省值
------

.. code-block:: bash

    floor 1.0e-10

说明
----

当坐标轴取对数坐标时，对于X和Y轴，当其值小于 ``floor`` 设置的值时，
则在绘图前将这些值改为 ``floor`` 设置的值。floor 使用一个小的正值，
对于非正数的对数运算是不允许的。
