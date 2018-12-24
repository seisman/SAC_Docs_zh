writecss
========

概要
----

将内存中的数据以 ``CSS 3.0`` 格式写入磁盘

语法
----

.. code-block:: bash

    WriteCSS [Binary|Ascii] [DIR ON|OFF|CURRENT|name] name

输入
----

ASCII
    以标准 ASCII 格式写入磁盘

BINARY
    以 ``CSS 3.0`` 二进制文件输出

DIR ON
    打开目录选项，但不改变目录名

DIR OFF
    关闭目录选项，即写入当前目录

DIR CURRENT
    打开目录选项并设置写目录为当前目录

DIR name
    打开目录选项并设置写目录为 ``name``\ 。将所有文件写入目录 ``name``
    中，其可以是相对路径或绝对路径

name
    以文件名 ``name`` 写入磁盘。只能指定一个名字其不能包含通配符。对于
    ``ASCII`` 型输出，以 ``name`` 为基础，在其后加上各个 CSS 表所对应的后缀（比如：
    ``name.wfdisc``\ 、\ ``name.origin``\ ）。 对于 ``BINARY`` 输出，则
    ``name`` 是输出文件名

缺省值
------

.. code-block:: bash

    wirtecss ascii dir off

说明
----

该命令允许你在数据处理过程中将数据以 CSS 3.0 格式保存到磁盘中。在 ASCII 模式
下（默认模式），会写入一个或多个 ASCII 文件到磁盘。输出的具体文件依赖于数据
来源，但输出可以是下面列出的 CSS 表中的任意一个或多个：

::

    wfdisc, wftag, origin, arrival, assoc, sitechan, site, affiliation,
    origerr, origin, event, sensor, instrument, gregion, stassoc, remark sacdata

在 BINARY 模式下，所有的 CSS 表以及波形数据都会以二进制格式写入到同一个文件中。
