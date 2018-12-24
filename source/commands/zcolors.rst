zcolors
=======

概要
----

控制等值线的颜色显示

语法
----

.. code-block:: bash

    ZCOLORS [ON|OFF] LIST c1 c2 ... cn

输入
----

ON
    打开等值线颜色显示开关

OFF
    关闭等值线颜色显示开关

LIST c1 c2 . cn
    设置等值线要使用的颜色列表，每一个颜色对应一条
    等值线，如果等值线数目多于这个列表长度，则整个列表不断重复

cn
    SAC 当前颜色表的颜色名

缺省值
------

.. code-block:: bash

    zcolors off list red green blue

示例
----

参考 :doc:`/graphics/plot-contour` 中的相关示例。
