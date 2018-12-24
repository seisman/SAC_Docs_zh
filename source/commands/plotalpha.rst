plotalpha
=========

概要
----

从磁盘读入字符数据型文件到内存并将数据绘制出来

语法
----

.. code-block:: bash

    PlotAlpha [MORE] [DIR CURRENT|name] [FREE|FORMAT text] [CONTENT text] [filelist]

输入
----

MORE
    将新读入的文件加到内存中老文件之后。如果没有这个选项，新文件
    将代替内存中的老文件。参见 :doc:`/commands/read` 命令

DIR CURRENT
    从当前目录读取并绘制所有文件

DIR name
    从文件夹name中读取并绘制所有文件，其可以是相对或绝对路径

FREE
    以自由格式（以空格分隔数据各字段）读取并绘制 filelist 中的数据文件

FORMAT text
    以固定格式读取并绘制 filelist 中的数据文件，格式声明位于 ``text`` 中

CONTENT text
    定义 filelist 中数据每个字段的含义。\ ``text`` 的含义参见
    :doc:`/commands/readtable`

filelist
    字符数字型文件列表，其可以包含简单文件名、绝对/相对路径、通配符。

缺省值
------

.. code-block:: bash

    plotalpha free content y. dir current

说明
----

参考 :doc:`/commands/readtable` 命令的相关说明。该命令与 ``readtable`` 之后
再 :doc:`/commands/plot` 不同，因为它允许你在每个数据点上绘制标签。

示例
----

读取并绘制一个自由格式的X-Y数据，且其第一个字段是标签：

.. code-block:: bash

    SAC> plotalpha content lp filea
