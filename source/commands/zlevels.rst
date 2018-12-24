zlevels
=======

概要
----

控制后续等值线图上的等值线间隔

语法
----

.. code-block:: bash

    ZLEVELS [SCALE] [RANGE v1 v2] [INCREMENT v] [NUMBER n] [LIST v1 v2 ... vn]

输入
----

SCALE
    根据数据自动确定等值线的标尺范围

RANGE v1 v2
    用户设置等值线的范围为 ``v1`` 到 ``2``\ 。
    可以使用 ``SCALE`` 选项，也可以使用 ``RANGE`` 选项，但不可同时使用二者

INCREMENT v
    设置等值线之间的增量为 ``v``

NUMBER n
    设置等值线的条数为 ``n``\ ，\ ``INCREMENT`` 和 ``NUMBER`` 选项只能二选一

LIST v1 v2 .. vn
    设置一系列等值线上的值为v1、v2等等，如果使用这个选项，则其他选项均被忽略

缺省值
------

.. code-block:: bash

    zlevels scale number 20

示例
----

参考 :doc:`/graphics/plot-contour` 中的相关示例。

限制
----

等值线的最多数目为40
