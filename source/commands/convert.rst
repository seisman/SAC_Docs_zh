convert
=======

概要
----

实现数据文件格式的转换

语法
----

.. code-block:: bash

    CONVert [FROM] [format] infile [TO [format] outfile]|[OVER [format]]

输入
----

infile
    输入文件名

outfile
    输出文件名

OVER
    覆盖输入文件

format
    可以取 ``SAC`` 或 ``ALPHA``\ ，分别表示二进制格式和字母数字格式的SAC文件

缺省值
------

.. code-block:: bash

    convert from sac infile over sac

说明
----

该命令将单个文件从一种格式转换为另一种格式。该命令已经逐渐被
:doc:`/commands/read`  和 :doc:`/commands/write` 命令所取代，
``convert`` 命令已经不再需要，保留该命令只是为了兼容性考虑。
