getbb
=====

概要
----

获取或打印黑板变量的值

语法
----

.. code-block:: bash

    GETBB [TO TERMinal|filename] [NAMES ON|OFF] [NEWLINE ON|OFF]
        ALL|variable [variable ...]

输入
----

TO TERMINAL
    打印值到终端

TO filename
    将值追加到文件 filename 后

NAMES ON
    输出格式为“黑板变量名=黑板变量值”

NAMES OFF
    只打印黑板变量值

NEWLINE ON
    打印每个黑板变量后换行

NEWLINE OFF
    打印黑板变量后不换行

ALL
    打印当前定义的全部黑板变量

variable
    打印列表指定的黑板变量

缺省值
------

.. code-block:: bash

    getbb to terminal names on newline on all

说明
----

该命令用于获取或打印黑板变量的值。可以控制打印哪些黑板变量以及具体的
打印格式。可以将黑板变量打印到终端或者文本文件中。可以使用这些选项对
一系列数据文件进行测量，将结果保存到文本文件中，然后用
:doc:`/commands/readtable` 命令将这个文件读回 SAC，绘图或者进行更多的分析。

示例
----

假设你已经设置了一些黑板变量：

.. code-block:: bash

    SAC> setbb c1 2.45 c2 4.94

稍后可以这样打印他们的值：

.. code-block:: bash

    SAC> getbb c1 c2
     c1 = 2.45
     c2 = 4.94

想要在一行内只打印其值：

.. code-block:: bash

    SAC> getbb names off newline off c1 c2
     2.45 4.94

假设你有一个宏文件叫 GETXY，其可以对单个文件进行某些分析操作，并将结果
储存在两个头段变量中 X 和 Y 中。你想要对当前目录中所有垂直分量进行操作，
保存每对X和Y的值，然后绘图。下面的宏文件的第一个参数是用于储存这些结果的
文本文件：

.. code-block:: bash

    DO FILE WILD *Z
      READ FILE
      MACRO GETXY
      GETBB TO 1 NAMES OFF NEWLINE OFF X Y
    ENDDO
    GETBB TO TERMINAL
    READALPHA CONTENT P 1
    PLOT

最终这个文本文件将包含成对的X-Y数据点，每行一个，对应一个垂直分量的数据
文件。为了关闭文本文件并清空缓存区，最后将输出重定向到终端的 ``getbb``
命令是必要的。
