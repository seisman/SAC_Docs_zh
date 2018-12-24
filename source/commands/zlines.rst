zlines
======

概要
----

控制后续等值线绘图上的等值线线型

语法
----

.. code-block:: bash

    ZLINES  [ON|OFF] [LIST n1 n2 ... nn] [REGIONS v1 v2 ... vn]

输入
----

ON|OFF
    打开/关闭等值线显示选项

LIST n1 n2 .. nn
    设置要使用的线型表，这个表上的每个输入用于
    相应的等值线。如果等值线的数目大于这个表中给出的线型的数目，则
    使用整个线型表

REGIONS v1 v2 .. vn
    设置等值线范围表。这个表的长度应小于线型表的
    长度，小于范围值的等值线使用线型表中相应的线型。超过最后一个范围值的
    等值线采用线型表中最后一个线型的值

缺省值
------

.. code-block:: bash

    zlines on list 1

示例
----

循环四种不同线型，建立等值线：

.. code-block:: bash

    SAC> zlines list 1 2 3 4

设置虚线表示低于0.0等值线，实线表示高于0.0的等值线：

.. code-block:: bash

    SAC> zlines list 2 1 regions 0.0
