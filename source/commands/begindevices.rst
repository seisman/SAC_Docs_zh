begindevices
============

概要
----

启动某个图像设备

语法
----

.. code-block:: bash

    BeginDevices Sgf|Xwindows

输入
----

SGF
    SAC 图像文件设备

XWINDOWS
    X Window 窗口显示系统

说明
----

该命令用于启动一种图像设备，之后的所有绘图都会被传送到该设备中，直到再次执行
``begindevices`` 启动其它图像设备或 :doc:`/commands/enddevices` 结束
该图像设备为止。

SAC 默认使用 ``xwindows`` 图像设备。具体用法参考 :doc:`/graphics/save-image`
一节的示例。
