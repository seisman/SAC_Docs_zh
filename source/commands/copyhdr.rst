copyhdr
=======

概要
----

从内存中的一个文件复制头段变量给其他所有文件

语法
----

.. code:: bash

    COPYHDR [FROM name|n] hdrlist

输入
----

FROM name
    从内存中文件名为 ``name`` 的文件中复制头段变量

FROM n
    从内存中第n个文件中复制头段变量

hdrlist
    要复制的头段变量列表

缺省值
------

.. code:: bash

    copyhdr from 1

说明
----

该命令允许你从内存中的一个文件复制任意头段变量值到内存中其他所有文件，
让数据有相同的头段使得数据易于处理。

示例
----

假设你使用 ``ppk`` 命令在文件FILE1中标记了多个时间，并将其储存到
头段变量 ``T3`` 和 ``T4`` 中。为了将这些时间标记复制到到
FILE2和FILE3中：

.. code:: bash

    SAC> r FILE1
    SAC> ppk
    SAC> ... use cursor to mark times T3 and T4.
    SAC> r more FILE2 FILE3
    SAC> copyhdr from 1 T3 T4

假设你读取了很多文件，想要复制文件ABC中的头段变量 ``evla`` 和 ``evlo``
到其他所有文件中去，这时使用文件名而非数字会更简单：

.. code:: bash

    SAC> copyhdr from abc stla stlo
