history
=======

概要
----

打印最近执行的 SAC 命令列表

语法
----

.. code-block:: bash

    HISTORY

说明
----

该命令可以打印最近执行的命令历史，也可用于重复执行命令历史中某个特定的命令：

-  ``!!`` 重复上一命令
-  ``!n`` 重复第 n 行的命令
-  ``!-n`` 重复倒数第 n 个命令
-  ``!str`` 重复最近的以字符串 ``str`` 开头的命令

示例
----

打印命令历史列表：

.. code-block:: bash

    SAC> history

重复命令1：

.. code-block:: bash

    SAC> !1

重复最后一条命令：

.. code-block:: bash

    SAC> !!

重复倒数第二个命令：

.. code-block:: bash

    SAC> !-2

重复以 ``ps`` 开头的命令：

.. code-block:: bash

    SAC> !ps
