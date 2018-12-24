read
====

概要
----

从磁盘读取 SAC 文件到内存

语法
----

.. code-block:: bash

    Read [MORE] [DIR CURRENT|name] [XDR|ALPHA|SEGY] [SCALE ON|OFF] [filelist]

所有的选项必须位于 filelist 之前。

输入
----

MORE
    将读入的新文件添加到内存中老文件之后。若选项此忽略，则读入
    的新数据将替代内存中的老数据

DIR CURRENT
    从“当前目录”读取文件列表中的文件。“当前目录”为启动 SAC 的目录

DIR name
    从目录 name 中读取文件列表中的文件，可以为绝对路径或相对路径\ [1]_

XDR
    读取 XDR 格式的文件。此格式用于实现不同构架的二进制数据的转换

ALPHA
    输入文件是 SAC 的字符数字型文件，该选项与 XDR 选项不兼容

SEGY
    读取 IRIS/PASSCAL 定义的 SEGY 格式文件。该格式允许一个文件包含一个波形

SCALE
    只能和 SEGY 选项搭配使用，该选项默认是关闭的。当 ``SCALE``
    选项为 OFF 时，SAC 直接从 SEGY 文件中读取数据值；当 ``SCALE`` 为 ON 时，
    SAC 将每个数据值乘以以文件中给定的 ``SCALE`` 因子。
    若 ``SCALE`` 为 OFF，则这个文件中的 ``SCALE`` 值将储存在 SAC 头段 ``SCALE`` 中；
    若 ``SCALE`` 为ON，SAC的 ``SCALE`` 头段将被设置为1.0。

filelist
    文件列表。可以是简单的文件名，也可以包含相对或绝对路径，也可以使用通配符

缺省值
------

.. code-block:: bash

    read dir current

说明
----

该命令将 SAC 文件从磁盘读入到内存中，默认状态下会读取每个磁盘文件中的全部
数据点。

:doc:`/commands/cut` 命令可以用于指定读取文件的一部分数据。在2000年之后产生
的 SAC 文件会被假定年份为四位数字。年份为两个数字的文件被假定为20世纪，
会被加上1900。

在使用 ``read`` 命令时，正常情况下内存中的老数据会被新读取的数据
所替代。若使用 ``more`` 选项，则新数据将被读入内存并放在老数据的
后面。在如下三种情况下 ``more`` 选项可能会有用：

-  文件列表太长无法在一行中键入
-  在长文件列表中某个文件名拼错而没有读入，可以使用 ``more`` 选项再次读入
-  一个文件被读入，作了些处理，然后与原始数据比较

示例
----

``read`` 命令的简单示例位于 :doc:`/basis/read-and-write` 一节。

如果你想要对一个数据进行高通滤波，并与原始数据进行对比：

.. code-block:: bash

    SAC> r f01
    SAC> hp c 1.3 n 6
    SAC> r more f01
    SAC> p1

假设SAC的启动目录位于 ``/me/data``\ ，你想要处理其子目录 ``event1`` 和
``event2`` 下的文件。

.. code-block:: bash

    SAC> read dir event1 f01 f02

读取了目录 ``/me/data/event1`` 下的文件。

.. code-block:: bash

    SAC> read f03 g03

相同目录下的文件被读入。

.. code-block:: bash

    SAC> read dir event2 *

``/me/data/event2`` 下的全部文件被读入。

.. code-block:: bash

    SAC> read dir current f03 g03

目录 ``/me/data`` 下的文件被读入。

头段变量
--------

e、depmin、depmax、depmen、b

.. [1] 关于dir选项，有一个很大的陷阱，详见 :doc:`/tricks-and-traps/read-dir`\ 。
