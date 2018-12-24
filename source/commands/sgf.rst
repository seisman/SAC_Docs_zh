sgf
===

概要
----

控制 SGF 设备选项

语法
----

.. code-block:: bash

    SGF [Prefix text] [Number n] [Directory CURRENT|pathname]
        [Size Normal|Fixed v|Scaled v] [Overwrite ON|OFF]

输入
----

PREFIX text
    设置 SGF 的文件名前缀为 ``text``\ （最多24字符长）

NUMBER n
    设置下一个 SGF 的编号为 n。若 n 为0，则 SAC 搜索 SGF 文件目录下的 SGF
    文件最大编号，并将其值加1

DIRECTORY CURRENT
    将 SGF 文件放在当前目录

DIRECTORY pathname
    将 SGF 放在指定目录下

SIZE NORMAL
    产生一个常规大小绘图，常规图形有一个10*7.5英寸的viewspace（最大绘图区域）。
    viewport（viewspace 中除轴和标签之外的、绘图区）的默认值为8*5英寸

SIZE FIXED v
    产生一个在 X 方向 viewport 为 v 英寸长的图形

SIZE SCALED v
    产生一个视口在 X 方向上为 v 乘以 X 坐标极限值的图形

OVERWRITE ON|OFF
    当打开时，文件号不递增，每个新文件将擦除先前的文件

缺省值
------

.. code-block:: bash

    sgf prefix f number 1 directory current size normal

说明
----

该命令控制 SGF 文件的命名规则和后续 SGF 文件的图形尺寸。SGF 文件名由4部分
组成，分别为：

-  ``pathname`` 目录路径名，默认为当前目录
-  ``prefix`` 前缀，默认值为 ``f``
-  ``number`` 三位数的 frame 编号，默认值为 ``001``
-  ``.sgf`` 用于表示 SAC 图形文件的后缀

因而 SGF 的第一个文件名为 ``f001.sgf``\ 。每次新建一个 frame 时，frame
编号加1。可以强制 frame 编号从某个给定的值开始。如果你为准备一个报告需要
工作几天时间，而同时又希望所有图形都按一个统一的顺序排列，那么令 frame
编号不从1开始便很有用了。

有多个选项可以控制绘图的尺寸，常规的绘图为10*7.5英寸的 veiwport 范围，
使用默认的 viewport 的结果是产生一个近似为8*5英寸的图形区。你可强制 viewport
的 X 方向为固定长度或将 viewport 的 X 方向与整个坐标范围成比例。尺寸信息
会被写入 SGF 文件中，然后由其他转换程序负责将SGF转换成合适大小的图片。

示例
----

设置 SGF 文件的保存目录为非当前目录，并重置 frame 编号：

.. code-block:: bash

    SAC> sgf dir /mydir/sgfstore frame 0

设置 viewport 的 X 方向长度为3英寸：

.. code-block:: bash

    SAC> sgf size fixed 3.0

创建一个大小相当于海报的图形：

.. code-block:: bash

    SAC> sgf size fixed 30.0

设置 vierport 的 X 方向的尺寸与地震数据的时间长度成比例：

.. code-block:: bash

    SAC> sgf size scaled 0.1  # 10s的数据长度为1英寸

本例中，持续60秒的数据图形将有6英寸长，而持续600秒的数据将有60英寸长，
过长的图形需要特殊的后期处理。
