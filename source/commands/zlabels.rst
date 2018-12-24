zlabels
=======

概要
----

根据等值线的值控制等值线的标记

语法
----

.. code-block:: bash

    ZLABELS [ON|OFF] [SPACING v1 [v2 [v3]]] [SIZE v] [ANGLE v] [LIST c1 c2 ... cn]

``LIST`` 选项只能放在这个命令的最后

输入
----

ON|OFF
    打开/关闭等值线标签选项开关

SPACING v1 v2 v3
    设置相邻标签名的最小、适中和最大间隔（视口坐标系）分别为
    ``v1``\ 、\ ``v2`` 和 ``v3``\ 。如果第二、三个值省略则使用前面一个值

SIZE v
    设置标签的尺寸（高度）为 ``v``

ANGLE v
    设置标签文本最大角度为 ``v``\ （自水平方向起算的角度， 单位为度）

LIST c1 c2 . cn
    设置使用的等值线标签的列表。在这个表上的每个输入
    用于相应的等值线，如果等值线数目大于这个表的长度，则重复使用整个等值线表

cn
    可以取 ``ON|OFF|INT|FLOATn|EXPn|text``

ON
    在相应的等值线上放置标签，使用 Fortran 自由格式，用等值线值形成标签名

OFF
    在相应的等值线上不放置标签名

INT
    在相应的等值线上放置整数标签名

FLOATn
    在相应的等值线上放置小数点后面n位的浮点数作为标签名。
    如果n被忽略则使用先前值

EXPn
    在相应的等值线上放置小数点后面n位数的指数幂形式标签名，
    如果n忽略则使用先前值

text
    使用文本标注相应的等值线

缺省值
------

.. code-block:: bash

    zlabels off spacing 0.1 0.2 0.3 size 0.0075 angle 45.0 list on

示例
----

参考 :doc:`/graphics/plot-contour` 中的相关示例。
