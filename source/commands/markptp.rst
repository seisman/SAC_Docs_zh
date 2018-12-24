markptp
=======

概要
----

测量并标记信号在测量时间窗内的最大峰峰值

语法
----

.. code-block:: bash

    MARKPtp [Length v] [To marker]

输入
----

LENGTH v
    设置滑动窗的长度为 ``v`` 秒

TO marker
    指定某个时间标记头段用于保存最小值的所对应的时刻；
    最大值所对应的时刻保存在下一个时间标记头段中。时间标记头段 marker
    可以取 ``Tn``\ （n=0–9）。

缺省值
------

.. code-block:: bash

    markptp length 5.0 to t0

说明
----

该命令会计算信号在测量时间窗内的最大峰峰值。所谓最大峰峰值，即最大振幅
与最小振幅的振幅差。测量结果中，最小值（波谷）所对应的时刻会写到
``TO marker`` 中所指定的时间标记头段中，最大值（波峰）所对应的时刻
会写到相应的下一个时间标记头段中。最大峰峰值保存到 ``user0`` 中，
``kuser0`` 中的值为 ``PTPAMP``\ 。如果使用 :doc:`/commands/oapf`
打开了字符数字型震相拾取文件，则该命令的结果也会写入到文件中。

默认情况下，测量时间窗为整个信号，可以使用 :doc:`/commands/mtw`
命令设置 新的测量时间窗。同时，在测量时还需要设置滑动时间窗（sliding time window）的
长度。滑动窗的工作原理是，首先将长度为 ``v`` 的滑动窗置于
测量时间窗的起始位置，搜索该滑动窗内的最大峰峰值，然后将长度为 ``v`` 的滑动
窗向右移动一个数据点，并搜索该滑动窗内的最大峰峰值，以此类推，直到滑动窗
的右边界与测量时间窗的右边界重合为止，此时将有多个最大峰峰值，最后返回
所有最大峰峰值中最大的一个。

对于滑动时间窗（sliding time window）的长度，若 stw 的长度大于 mtw 的长度，
则 ``stw=mtw``\ ；若 stw 的长度小于等于零，则 ``stw=mtw/2``\ 。

示例
----

设置测量时间窗为头段 ``T4`` 和 ``T5`` 之间，并使用默认的滑动时间窗长和时间标记：

.. code-block:: bash

    SAC> mtw t4 t5
    SAC> markptp
    SAC> lh t0 t1 user0 kuser0

设置测量时间窗为初动之后的 30 s，滑动时间窗为 3 s，起始时间标记为 ``T7``\ ：

.. code-block:: bash

    SAC> mtw a 0 30
    SAC> markptp l 3. to t7
    SAC> lh t7 t8 user0 user1

头段变量
--------

Tn、KTn、user0、kuser0

源码
----

``src/smm/xmarkptp.c``\ 、\ ``src/smm/ptp.c``
