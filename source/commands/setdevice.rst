setdevice
=========

概要
----

定义后续绘图时使用的默认图形设备

语法
----

.. code-block:: bash

    SETDEVICE name

输入
----

name
    图形设备名

说明
----

SAC 的默认图形设备为 X11 图形窗口，你可以使用该命令修改默认的图形设备，也
可以使用 :doc:`/commands/begindevices` 命令随时用新的图形设备取代默认图形设备。

BUGS
----

-  使用该命令似乎会直接段错误退出（v101.6a）
