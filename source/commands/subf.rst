subf
====

概要
----

使内存中的一组数据减去另一组数据

语法
----

.. code-block:: bash

    SUBF [Newhdr [ON|OFF]] filelist

输入
----

NEWHDR ON|OFF
    指定新生成的文件使用哪个文件的头段。
    ``OFF`` 表示使用内存中原文件的头段区，
    ``ON`` 表示使用filelist中文件的头段区。
    缺省值为 ``OFF``

filelist
    SAC 二进制文件列表

说明
----

参见 :doc:`/commands/addf` 命令的相关说明。

头段变量
--------

depmin、depmax、depmen、npts、delta
