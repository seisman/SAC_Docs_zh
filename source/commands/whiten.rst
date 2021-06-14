whiten
======

概要
----

对输入的时间序列的频谱进行平滑

语法
----

.. code-block:: console

    WhITen n

输入
----

n
    阶数（极点数目）。阶数越大，结果数据就越平滑。高阶可以更好地
    清除一些数据，但是也可能会导致对数据处理过多而丢掉一些重要的数据。
    默认值为6。

缺省值
------

.. code-block:: console

    whiten 6

说明
----

该命令对数据中加入白噪声，以平滑输入时间序列的频谱。在谱相关命令（比如
子程序 SPE 中的命令、\ ``transfer``\ 、\ ``spectrogram``\ ）之前执行，
可以减少频谱值的动态范围，提高了对地震数据高频操作的精度。

``whiten`` 可以在 SPE 子程序内部调用，也可以在 SAC 主程序中调用。SPE 中的
``whiten`` 和主程序中的 ``whiten``\ ，阶数是相互独立的，即在主程序中修改
``whiten`` 的阶数，不会影响 SPE 中 ``whiten`` 的阶数。
与此同时，主程序中的 ``whiten`` 命令与 ``transfer`` 命令的
``prewhiten`` 选项共用一个阶数；SPE 中 ``whiten`` 命令与 SPE 中的 ``cor``
命令的 ``prewhiten`` 选项共用一个阶数。
