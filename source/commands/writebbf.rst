writebbf
========

概要
----

将黑板变量文件写入到磁盘

语法
----

.. code-block:: bash

    WriteBBF [file]

输入
----

file
    黑板变量文件的文件名

缺省值
------

.. code-block:: bash

    writebbf bbf

说明
----

该命令让你能够将当前会话的所有黑板变量写入到磁盘文件中，稍后可以使用
:doc:`/commands/readbbf` 命令将黑板变量文件重新读入 SAC，该特性允许你保存
某次 SAC 会话的信息，并用于另一次 SAC 会话中。你也可以在自己的程序中调用
SAC 函数库以访问黑板变量文件中的信息。
