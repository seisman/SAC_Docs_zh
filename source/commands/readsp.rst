.. _cmd:readsp:

readsp
======

概要
----

读取 nameref-spe-writespe 写的谱文件

语法
----

.. code:: bash

    R\verb|EAD|SP [AMPH|RLIM|SPE] [filelist]

输入
----

RLIM
    读入实部和虚部分量

AMPH
    读入振幅和相位分量

SPE
    读取谱估计子程序文件，这个数据被从功率转换为振幅，相位分量设置为0

filelist
    SAC二进制数据文件列表

缺省值
------

READSP AMPH

说明
----

`writesp </commands/writesp.html>`__
命令将每个谱数据分量作为一个单独的文件写入磁盘，
你可以分别处理每个分量。这个命令让你能从两个分量重建谱数据，参见
`writesp </commands/writesp.html>`__\ 。 SPE选项允许你读取并转换由
nameref-spe-writespe 写出的谱文件格式。 这也使你可以使用
`mulomega </commands/mulomega.html>`__ 和
`divomega </commands/divomega.html>`__ 命令。
