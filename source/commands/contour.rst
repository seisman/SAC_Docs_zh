contour
=======

概要
----

利用内存中的数据绘制等值线图

语法
----

.. code-block:: bash

    CONTour [Aspect ON|OFF]

输入
----

ASPECT ON
    打开视图比开关。当这个开关打开时，等值线图的视口将会
    调整保持数据中 Y 与 X 的比值

ASPECT OFF
    关闭视图比开关，这时将使用整个视口

缺省值
------

.. code-block:: bash

    contour aspect off

说明
----

这个命令用于绘制二维数组数据的等值线图，包括 :doc:`/commands/spectrogram`
命令的输出。这个文件操作的SAC文件必须“XYZ”类型的（SAC头段中 ``IFTYPE``
为 ``IXYZ``\ ）。有些命令可以控制数据显示的方式：

-  :doc:`/commands/zlevels`  控制等值线的数目以及间隔
-  :doc:`/commands/zlines`  控制等值线的线型
-  :doc:`/commands/zlabels`  控制等值线标签
-  :doc:`/commands/zticks`  控制方向标记
-  :doc:`/commands/zcolors`  控制等值线颜色

根据 ``contour`` 选项的不同，有两种不同的绘制等值线算法。一种快速
扫描方法用于既不选择实线型也没有时标和标识的情况。另一种慢一点的方法，
在绘图之前要组合全部的线段。你可以使用快速扫描方法粗看你的数据，然后选择
其他选项绘制最终图形。

示例
----

参考 :doc:`/graphics/plot-contour` 中的相关示例。

头段变量改变
------------

要求：iftype （为“IXYZ”）、nxsize、nysize

使用：xminimum、xmaximum、yminimum、ymaximum
