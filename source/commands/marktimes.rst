marktimes
=========

概要
----

根据一个速度集得到走时并对数据文件进行标记

语法
----

.. code-block:: bash

    MARKTimes [To marker] [Distance Header|v] [Origin Header|v|GMT time]
        [Velocities v ... ]

输入
----

TO marker
    定义头段中用于储存结果的第一个时间标记。对下一个的速度使用下一个时间

marker
    ``T0|T1|T2|T3|T4|T5|T6|T7|T8|T9``

DISTANCE HEADER
    使用头段中的 ``dist`` 代表距离用于走时计算

DISTANCE v
    使用 ``v`` 作为走时计算中的距离

ORIGIN HEADER
    使用头段中的参考时间（\ ``O``\ ）用于走时计算

ORIGIN v
    使用相对参考时间偏移 ``v`` 秒用于走时计算

ORIGIN GMT time
    使用 GMT 时间作为参考时间

time
    GMT 时间包含六个整数：年、儒略日、时、分、秒、毫秒

VELOCITIES v ...
    设置用于走时计算的速度集，最多可以输入10个速度

缺省值
------

.. code-block:: bash

    marktimes velocities 2. 3. 4. 5. 6. distance header origin header to t0

说明
----

这个命令在头段中标记震相的到时，给定事件的发生时间，震中距以及速度即可
计算到时。下面的方程用于简单估计走时：

.. math:: time(j) = origin + \frac{distance}{velocity(j)}

结果被写入指定的时间标记中

示例
----

使用默认的速度集，强制距离为 340 km，第一个时间标记为 ``T4``\ ：

.. code-block:: bash

    SAC> marktimes distance 340. to t4

选择一个不同的速度集：

.. code-block:: bash

    SAC> markt v 3.5 4.0 4.5 5.0 5.5

设置新的参考时间并将结果保存在 ``T2`` 中：

.. code-block:: bash

    SAC> markt origin gmt 1984 231 12 43 17 237 to t2

头段变量改变
------------

Tn、KTn
