zticks
======

概要
----

用方向标记标识等值线

语法
----

.. code-block:: bash

    ZTICKS [ON|OFF] [Spacing v] [LEngth v] [Direction DOWN|UP] [List c1 c2 ... cn]

输入
----

ON|OFF
    打开/关闭等值线方向标记

SPACING v
    在每条线段上设置项链标识之间的间隔为 ``v``\ （视口坐标系）

LENGTH v
    设置每个标识的长度为 ``v``\ （视口坐标系）

DIRECTION DOWN|UP
    标识在z值减小/增加的方向上

LIST c1 c2 . cn
    设置要使用的等值线标识表。在这个表上的每个输入
    都用于相应的等值线。如果等值线数多于这个列表的长度，则重复使用整个
    标识表。\ ``ON`` 意味着标识画在等值线上，\ ``OFF`` 意味着标识
    不画在等值线上

缺省值
------

.. code-block:: bash

    zticks off spacing 0.1 length 0.005 direction down list on

示例
----

参考 :doc:`/graphics/plot-contour` 中的相关示例。
