loadctable
==========

概要
----

允许用户在彩色绘图中选择一个新的颜色表

语法
----

.. code-block:: bash

    LoadCTable n|[DIR CURRENT|name] [filelist]

输入
----

n
    标准 SAC 颜色表对于的号，\ ``n``\ 可以取1–17

DIR CURRENT
    从当前目录载入颜色表，当前目录指的是你启动SAC的目录

DIR name
    从目录 ``name`` 中载入颜色表，这是一个相对或绝对目录名

filelist
    颜色表文件列表

说明
----

该命令允许用户选择一个新的颜色表或者通过指定颜色表的文件以及路径提供他们
自己的颜色表。如果未使用 ``DIR`` 选项，SAC将首先在 ``$SACAUX`` 中
寻找颜色表，然后在用户的工作目录中寻找.

在 ``$SACAUX/ctables`` 下有21个文件，其中一个为 ``gmt.cpt``\ ，用于
在SAC中绘制与GMT有关的彩色图形，另外20个文件为三列数据，应该就是颜色表了，
前面说的 ``n`` 取1到17可能有些过时了。具体谁对应谁还不清楚，just try them！
