echo
====

概要
----

控制输入输出回显到终端

语法
----

.. code-block:: bash

    ECHO ON|OFF Errors|Warnings|Output|Commands|Macros|Process

输入
----

ON|OFF
    打开/关闭列出的项的回显选项

ERRORS
    命令执行过程中生成的错误信息

WARNINGS
    命令执行过程中生成的警告信息

OUTPUT
    命令执行过程中生成的输出信息

COMMANDS
    终端键入的原始命令

MACROS
    宏文件中出现的原始命令

PROCESSED
    经过处理后的终端命令或宏文件命令，包括宏参数、黑板
    变量、头段变量、内联函数的计算和代入

缺省值
------

.. code-block:: bash

    echo on errors warnings output off commands macros processed

说明
----

该命令控制 SAC 输入输出流中哪一类要被回显到终端或屏幕。

输出分为三大类：错误消息、警告消息、输出消息；输入也分为三大类：终端键入
的命令、宏文件中执行的命令以及处理后的命令。处理后的命令指所有的宏参数、
黑板变量、头段变量、内联函数首先被计算，并代入到命令中而形成的命令。
你可以分别控制这些类的回显。

当在终端键入命令时，操作系统一般会显示用户键入的每个字符，因此该命令
在交互式会话中没有太大作用。设置显示宏命令以及处理后的命令在调试宏文件
时会很有用。
