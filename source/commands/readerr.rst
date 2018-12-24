readerr
=======

概要
----

控制在执行 :doc:`/commands/read` 命令过程中的错误的处理方式

语法
----

.. code-block:: bash

    ReadERR [Badfile Fatal|Warning|Ignore] [Nofiles Fatal|Warning|Ignore]
              [Memory Save|Delete]

输入
----

BADFILE
    当文件不可读或不存在时出现的错误

NOFILES
    文件列表中没有文件可读时出现的错误

FATAL
    设置错误条件为 fatal，发送错误消息并停止执行命令

WARNING
    发送警告消息，但继续执行命令

IGNORE
    忽略错误，继续执行命令

MEMORY
    如果无文件可读则对内存中原有的数据进行处理

DELETE
    内存中的原数据将被删除

SAVE
    内存中的原数据将保留在内存中

缺省值
------

.. code-block:: bash

    readerr badfile warning nofiles fatal memory delete

说明
----

当你试着使用 :doc:`/commands/read` 命令将数据文件读入内存时可能会发生错误。
文件可能不存在或虽然存在但不可读。当 SAC 遇到这些 badfiles 时，一般会发送
警告消息，然后试着读取文件列表中的其余文件。如果你想要SAC在遇到坏文件时
停止读取文件可以设置 ``BADFILE`` 为 ``FATAL``\ 。如果你不想看到
警告信息，可以设置 ``BADFILE`` 为 ``INGORE``\ 。如果文件列表中的
文件均不可读，SAC 将发送错误信息并停止处理，如果你想要 SAC 发送警告信息或
完全忽略这个问题，设置 ``NOFILES`` 为 ``INGORE``\ 。当然，SAC 内存
中先前的文件也可以从内存中删除或者保留在内存中。
