evaluate
========

概要
----

对简单算术表达式求值

语法
----

.. code-block:: bash

    EVALuate [TO TERM|name] [v] op v [op v ...]

其中 ``op`` 可以取下面中的一个：

.. code-block:: bash

    ADD|SUBTRACT|MULTIPLY|DIVIDE|POWER|SQRT|EXP|ALOG|ALOG10|
    SIN|ASIN|COS|ACOS|TAN|ATAN|EQ|NE|LE|GE|LT|GT

其中，\ ``ADD|SUBTRACT|MULTIPLY|DIVIDE|POWER`` 可以分别用
``+``\ 、\ ``-``\ 、\ ``*``\ 、\ ``/``\ 、\ ``**`` 替代。

输入
----

TO TERM
    结果写入终端

TO name
    结果写入黑板变量 name

v
    浮点数或整数。SAC 中所有的运算都是浮点运算，整数会首先转换为浮点型

op
    算术或逻辑操作符

缺省值
------

.. code-block:: bash

    evaluate to term 1. * 1.

说明
----

这个命令允许你对算术或逻辑表达式求值。算术表达式可以是包含多个操作符的
复合表达式，在这种情况下表达式由左向右计算，不支持嵌套功能。逻辑表达式
只能包含一个操作符。计算结果可以写入用户终端或者指定的黑板变量。你可以
通过 :doc:`/commands/getbb` 命令使用该黑板变量的值。

示例
----

一个简单的例子：

.. code-block:: bash

    SAC> eval 2*3
     6
    SAC> eval tan 45
    1.61978

下面将一个以度为单位的角度转换为弧度并计算其正切值：

.. code-block:: bash

    SAC> eval 45*pi/180
     0.785398
    SAC> eval tan 0.785398
     1

下面将计算的结果保存到黑板变量：

.. code-block:: bash

    SAC> evaluate to temp1 45*pi/180
    SAC> evaluate tan %temp1%
     1
