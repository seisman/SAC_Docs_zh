.. _cmd:report:

report
======

概要
----

报告SAC中的各参数的当前状态

语法
----

.. code:: bash

    REP\verb|ORT| APF|COLOR|CUT|DEVICES|FILEID|GTEXT|HPF|LINE|MEMORY|MTW|PICKS|
        SYMBOL|TITLE|XLABEL|XLIM|YLABEL|YLIM

输入
----

APF
    字符数字型震相拾取文件的文件名

COLOR
    当前颜色属性。只有当某个图像设备被激活时，其值才有意义

CUT
    当前数据截窗的状态

DEVICES
    当前系统上可用的图形设备

FILEID
    当前文件ID显示属性

GTEXT
    当前图形文本属性

HPF
    HYPO震相拾取文件名

LINE
    当前线型属性

MEMORY
    内存管理器的可用内存块

MTW
    当前的测量时间窗状态

PICKS
    当前时间拾取显示属性

SYMBOL
    当前符号绘制属性

TITLE
    当前绘制标题属性

XLABEL
    当前x轴标签属性

XLIM
    当前x轴范围

YLABEL
    当前y轴标签属性

YLIM
    当前y轴范围

说明
----

该命令会报告SAC的某些选项的当前值，并将其值打印到终端。

示例
----

为了获取当前颜色属性的列表：

.. code:: bash

    是
    SAC> report color
     COLOR option is ON
     DATA color is YELLOW
     INCREMENT data color is OFF
     SKELETON color is BLUE
     BACKGROUND color is NORMAL

为了获取HYPO文件名：

.. code:: bash

    SAC> report apf hpf
     Alphanumeric pick file is MYPICKFILE
     HYPO pick file is HYPOPICKFILE
