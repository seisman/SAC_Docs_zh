transcript
==========

概要
----

将 SAC 终端信息输出到副本文件中

语法
----

.. code-block:: bash

    TRANSCRIPT [OPEN|CREATE|CLOSE|CHANGE|WRITE|HISTORY] [FILE filename]
        [CONTENTS ALL|Errors|Warnings|Output|Commands|Macros|Processed]
        [MESSAGE text]

输入
----

OPEN
    打开副本文件，若文件已存在，则将输出追加到文件的尾部，相当于重定向符号 ``>>``

CREATE
    创建一个新的副本文件，相当于重定向符号 ``>``

CLOSE
    关闭一个已打开的副本文件

CHANGE
    修改一个已打开的副本文件的内容

WRITE
    将信息写入副本文件，不改变其状态或内容

HISTORY
    将命令行历史保存到文件

FILE filename
    定义副本文件的名字

MESSAGE text
    向副本文件中写入文本。这个信息可以用于指定正在进行的
    进程或指定正在处理的不同事件，在两次执行这个命令的过程中这个信息不保存

CONTENTS ALL
    定义副本文件的内容为全部输入输出的信息

CONTENTS ERRORS
    定义副本内容为执行命令时产生的错误消息

CONTENTS WARNINGS
    定义副本内容为执行命令时产生的警告消息

CONTENTS OUTPUT
    定义副本内容为执行命令时的输出消息

CONTENTS COMMANDS
    定义副本内容为终端输入的原始命令

CONTENTS MACROS
    定义副本内容为宏文件中出现的原始命令

CONTENTS PROCESSED
    定义副本内容为经终端或宏处理之后的命令

缺省值
------

.. code-block:: bash

    transcript open file transcript contents all

说明
----

副本文件用于记录 SAC 执行的整个过程，其可以记录一次或多次执行 SAC 时的信息。
同一时间，用户最多可以使用5个活动的副本文件，每个副本文件用于追踪不同的
输出信息。

示例
----

创建一个新的副本文件，文件名为 ``mytran``\ ，包含了除已处理命令之外的其他
全部输出内容：

.. code-block:: bash

    SAC> transcript create file mytran cont err warn out com macros

若之后不想把宏命令送入这个副本文件中，则可以使用 ``CHANGE`` 选项：

.. code-block:: bash

    SAC> transcript change file mytran contents e w o c

定义一个名为 ``myrecord`` 的副本文件，其记录了终端输入的命令：

.. code-block:: bash

    SAC> transcript create file myrecord contents commands

经过适当的编辑，该副本文件即可用作宏命令文件，去自动执行相同的一组命令。

假设你需要彻夜处理许多事件。你可以设置每个事件一个副本文件（用不同的副本文件名）
去记录处理的结果。另外你可以将处理所有事件得到的任何错误消息保存到一个副本文件中：

.. code-block:: bash

    SAC> transcript open file errortran contents errors
    SAC> transcript write message 'processing event 1'

将这些命令放在批量处理的宏文件中。对于每个事件，都会将运行信息和出错信息
添加到副本文件的最后。第二天检查一下副本文件的内容，就可以快速查阅在处理
期间是否出现了错误。

为了保存一个命令行副本，以记录SAC当前和将来要运行的命令：

.. code-block:: bash

    SCA> transcript history file .sachist

这就在当前目录创建并写入了一个副本文件 “``./.sachist``”。任何储存在
那里的文件将被载入命令历史中。如果这个命令位于你的启动初始化宏文件中，
则每次你运行SAC时将在当前目录产生一个单独的命令行历史。在一个新执行的SAC中，
上下键将浏览完整的命令历史，你可以修改以前输入的命令并再次执行它，如果你
没有在SAC内或初始化宏文件中输入这个命令，则命令行历史将自动保存到
``~/.sac_history``\ 。
