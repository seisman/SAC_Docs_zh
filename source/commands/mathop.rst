mathop
======

概要
----

控制数学操作符的优先级

语法
----

.. code-block:: bash

    MATHOP NORMAL|MATH|FORTRAN|NONE|OLD

输入
----

NORMAL|MATH|FORTRAN
    使用正常的数学操作符优先级

NONE|OLD
    不使用操作符优先级

缺省值
------

.. code-block:: bash

    mathop NORMAL

说明
----

该命令控制数学操作符的优先级。正常情况下，乘法和除法的优先级要比加法和
减法高，指数运算拥有最高的优先级。

101.6之前的版本中，SAC在进行代数运算时没有考虑操作符的优先级，整个表达式
按照从左到右的顺序依次进行计算。

SAC在101.6之后的版本中，默认使用正常的操作符优先级。对于一些在老版本SAC
下写的脚本或宏来说，可能依赖于旧的优先级顺序。可以考虑修改脚本以适应新版
本的优先级或者直接设定适应 ``OLD`` 优先级。

示例
----

正常的操作符优先级：

.. code-block:: bash

    SAC> mathop normal
    SAC> eval 1+2*3
     7
    SAC> eval 1+(2*3)
     7

旧的操作符优先级：

.. code-block:: bash

    SAC> mathop old
    SAC> eval 1+2*3
     9
    SAC> eval 1+(2*3)
     7
