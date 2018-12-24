print
=====

概要
----

打印最近的 SGF 文件

语法
----

.. code-block:: bash

    PRINT [printer]

说明
----

这个命令会打印最近生成的 SGF 文件，因而在该命令前至少要产生一个 SFG 文件。
该命令会将 SGF 文件发送至打印机 printer，如果没有指定则使用系统默认打印机。
如果自从登录之后 SGF 设备一直保持关闭，那么 ``print`` 命令就不会工作。可以使用
:doc:`/commands/begindevices` 打开 SGF 设备，使用 SGF 命令设置 SGF 设备的属性。
