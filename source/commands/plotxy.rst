plotxy
======

概要
----

以一个文件为自变量，一个或多个文件为因变量绘图

语法
----

.. code-block:: bash

    PlotXY name|number name|number [name|number ...]

输入
----

name
    数据文件表中的一个文件名

number
    数据文件表中的一个文件号

说明
----

你选择的第一个文件（通过文件名或文件号）为自变量，沿着 X 轴绘制。
余下的数据为因变量，沿着 Y 轴绘制。
所有的图形环境命令比如 :doc:`/commands/title`\ 、\ :doc:`/commands/line` 和
:doc:`/commands/symbol` 都可以使用以控制绘图的属性。
这个命令用于绘制由 :doc:`/commands/readtable` 命令读入的多列数据。
在多数情况下，其可以看作像用绘图命令一样作出的图表。

示例
----

假设你有一个 ASCII 文件，其包含4列数。你想要将其读入 SAC 并绘图。下面的命令
读入这个文件，将其储存为 SAC 内部4个分开的文件，打开线型增量开关，然后以
第二列为自变量，其他列为因变量绘图：

.. code-block:: bash

    SAC> readalpha content ynnn myfile
    SAC> line increment on
    SAC> plotxy 2 1 3 4
