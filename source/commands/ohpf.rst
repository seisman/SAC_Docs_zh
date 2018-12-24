ohpf
====

概要
----

打开一个 HYPO 格式的震相文件

语法
----

.. code-block:: bash

    OHPF [file]

输入
----

file
    要打开的文件名。如果文件已经存在，则打开并将新的震相加到文件底部

缺省值
------

.. code-block:: bash

    OHPF HPF

说明
----

SAC 产生的 HYPO 震相拾取文件可以用于程序 ``HYPO71`` 以及其他类似事件定位程序的
输入。由 :doc:`/commands/apk` 和 :doc:`/commands/plotpk` 得到的震相拾取
信息被写入这个打开的文件中，这个文件可以使用 :doc:`/commands/chpf` 关闭。
打开一个新的 HYPO 文件会自动关闭前一个已经打开的文件。打开一个已经存在的
HYPO 文件的同时也会自动删除文件的最后一行，这一行原本有一个指令标记10作为
HYPO 文件的结束标志符，删除最后一行意味着可以在其后添加新的拾取。终止 SAC
也会自动关闭任何已经打开的拾取文件，事件分割符能够用
:doc:`/commands/whpf` 命令写入震相拾取文件。
