systemcommand
=============

概要
----

在SAC内部执行系统命令

语法
----

.. code:: bash

    SystemCommand command [options]

输入
----

command
    系统命令名

options
    命令需要的选项

说明
----

在SAC中是可以执行大部分系统命令的，比如常见的 ``ls``\ 、\ ``cp``
等。但某些命令无法直接在SAC中执行，比如用于查看PS文件的 ``gs`` 命令
会首先被SAC解释为 :doc:`/commands/grayscale` 
的简写，故而在SAC中无法直接 调用 ``gs`` 命令。

另一个经常使用但无法直接调用的命令是 ``rm``\ 。为了避免在读入数据时
将命令 ``r *.SAC`` 误敲成 ``rm *.SAC`` 而导致数据文件被误删除，
故而在SAC中禁止直接调用 ``rm`` 命令。

``systemcommand`` 的作用就是为了能够在SAC内部间接调用这些无法
被SAC直接调用的系统命令。

示例
----

调用系统命令 ``rm`` 删除某些SAC文件：

.. code:: bash

    SAC> rm junks           # 无法直接调用rm命令
     ERROR 1106: Not a valid SAC command.
    SAC> sc rm junks        # 通过sc间接调用rm命令
