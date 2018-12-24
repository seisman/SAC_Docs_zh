comcor
======

概要
----

控制 SAC 的命令校正选项

语法
----

.. code-block:: bash

    COMCOR [ON|OFF]

缺省值
------

.. code-block:: bash

    comcor off

输入
----

ON|OFF
    打开/关闭命令校正选项

缺省值
------

.. code-block:: bash

    comcor off

说明
----

SAC 会检查你输入的每个命令的格式和内容。当 SAC 发现错误时，会给你发送一个
错误消息并告诉错误是原因及其位置。若开启了命令校正选项，SAC 将允许你修正
这个命令然后 SAC 自动重新执行它。若关闭校正，SAC 只是打印错误消息，将控制权
返回给你。
