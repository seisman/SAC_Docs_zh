printhelp
=========

概要
----

调用打印机打印帮助文档

语法
----

.. code-block:: bash

    PrintHelp [item ...]

输入
----

item
    命令、模块、子程序、特性的全称或简称

说明
----

该命令与 :doc:`/commands/help` 命令的用法相同，其调用系统命令
``lpr`` 将文档传递给默认打印机。若 ``lpr`` 未设置默认打印机，则报错。
