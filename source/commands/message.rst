message
=======

概要
----

发送信息到用户终端

语法
----

.. code-block:: bash

    MESsage text

输入
----

text
    要发送到终端的信息文本。若文本中有空格则必须用引号括起来

说明
----

此命令用于在 SAC 宏文件执行时发送状态或其他信息给用户，在交互式模式下一般
没有用（除非你想自己跟自己聊天，如示例所示）。

示例
----

发送无空格的信息：

.. code-block:: bash

    SAC> message finished
     finished

发送带有空格的信息，需要加上单引号或双引号：

.. code-block:: bash

    SAC> message 'Job has finished.'
     Job has finished.
