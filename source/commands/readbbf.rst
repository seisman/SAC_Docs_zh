.. _cmd:readbbf:

readbbf
=======

概要
----

将黑板变量文件读入内存

语法
----

.. code:: bash

    R\verb|EAD|BBF [file]

输入
----

file
    黑板变量文件名，可以是简单文件名或相对/绝对路径

缺省值
------

readbbf bbf

说明
----

该命令使你能够读取一个黑板变量文件。该文件必须是先前通过
`writebbf </commands/writebbf.html>`__
命令写入磁盘的文件。该特性让你能够将某个SAC会话的信息保存起来并用在
另一次SAC会话中。也可以在自己的程序中调用SAC函数库以读取黑板变量文件中
的黑板变量，这使得你可以在SAC和自己的程序之间互相传送信息。
