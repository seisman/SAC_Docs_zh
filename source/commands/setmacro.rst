setmacro
========

概要
----

定义 SAC 宏文件的搜索路径

语法
----

.. code-block:: bash

    SETMACRO [MORE] directory [directory ...]

输入
----

directory
    放置 SAC 宏文件的目录，可以是相对路径或绝对路径

MORE
    将 ``directory`` 加到已有的路径列表之后

说明
----

该命令让你能够定义一系列执行宏文件时搜索路径，最多可以定义100个。

当 ``setmacro`` 使用 ``more`` 选项时，指定的路径会追加到
已存在的路径列表的后面；若没有使用 ``more`` 选项，则已存在的列表
将被新列表取代。

当执行 ``macro`` 命令时，SAC 会先搜索当前目录，若没有找到则搜索
``setmacro`` 指定的目录，若依然没有找到则在全局宏目录中寻找。
