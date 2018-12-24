plotstack
=========

概要
----

绘制叠加文件列表中的文件

语法
----

.. code-block:: bash

    PlotStack [Sum ON|OFF] [Perplot ON|OFF|n] [Weight ON|OFF] [Polarity ON|OFF]

输入
----

SUM ON|OFF
    若打开该选项，则首先绘制叠加后的波形再绘制叠加文件列表中的文件；
    若关闭该选项，则只回执叠加文件列表中的文件

PERPLOT ON|OFF
    若打开该选择，则每次只绘制固定数目的文件；
    若关闭该选项，则一次绘制叠加列表中的全部文件

PERPLOT n
    打开 PERPLOT 选项，并设置每次绘制n个文件

WEIGHT ON|OFF
    打开/关闭文件权重选项

POLARITY ON|OFF
    打开/关闭文件极性选项

缺省值
------

.. code-block:: bash

    plotstack sum on perplot off weight on polarity on

说明
----

该命令绘制叠加文件列表中的文件，所有的文件首先根据静/动延迟进行时移，
该命令可以控制绘制文件时是否考虑权重因子和极性。

该命令的用法与 :doc:`/commands/plot1` 类似，在每个子图的左上角会显示文件名
以及其他非默认的属性值。
