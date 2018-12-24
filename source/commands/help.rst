help
====

概要
----

在终端显示 SAC 命令的语法和功能信息

语法
----

.. code-block:: bash

    Help [item ... ]

输入
----

item
    命令（全称或简写）、模块、子程序等等。若 item 为空，则显示 SAC 的帮助文档的介绍

说明
----

SAC 的官方帮助文档位于 ``$SACHOME/aux/help`` 目录中，该命令实际上是从
该目录中读取相应的文件并输出到终端中。item 列表中每一项会按照顺序依次显示
在终端中，若输出超过一屏，可以使用 PgUp、PgDn、Enter、空格、方向键等实现
翻页。直接输入 ``q`` 则退出当前 item 的文档并显示下一 item 的文档。

示例
----

.. code-block:: bash

    SAC> h                  # 获得帮助文档包的介绍
    SAC> h r cut bd p       # 一次显示多个命令的文档
