pause
=====

概要
----

发送信息到终端并暂停，直到终端输出换行符

语法
----

.. code-block:: bash

    PAUSE [MESSAGE text] [PERIOD ON|OFF|v]

输入
----

MESSAGE text
    暂停前发送到终端的文本，若文本包含空格则用引号括起来

PERIOD v
    打开 ``period`` 选项并设置暂停的时间长度为 ``v`` 秒

PERIOD ON
    打开 ``period`` 选项但不改变暂停的长度，若改选项为开，SAC 会暂停
    一段时间然后自动恢复执行

PERIOD OFF
    关闭 ``period`` 选项开关。当该选项关闭时，SAC 将暂停直到终端输入回车键

缺省值
------

.. code-block:: bash

    pause message 'Pausing' period off

说明
----

该命令使你能够暂停 SAC 宏文件的执行。当该命令被执行时，SAC 发送信息到终端、
暂停，然后等待用户在终端输入回车或者暂停时间结束。当你想要研究一个特定
命令的输出时可以让宏文件暂停执行再继续。
