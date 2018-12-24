xvport
======

概要
----

定义 X 轴的视口

语法
----

.. code-block:: bash

    XVPort xvmin xvmax

输入
----

xvmin
    X轴视口的最小值，范围为 ``0.0`` 到 ``xvmax``

xvmax
    X轴视口的最大值，范围为 ``xmin`` 到 ``1.0``

缺省值
------

.. code-block:: bash

    xvport 0.1 0.9

说明
----

视口（viewport）是视窗（viewspace）的一部分。在 SAC 中，定义视口时使用的是
相对坐标系，即坐标系在 X 和 Y 方向都是0到1的范围。视窗左下角的坐标为
``(0.0, 0.0)``\ ，右上角的坐标为 ``(1.0, 1.0)``\ 。该坐标系是与
输出设备无关的，因而可以很方便地指定一个图形的位置。

``xvport`` 和 ``yvport`` 定义了视口相对于视窗的位置，后续的
命令将在定义的视口中绘图。默认值 ``xvport 0.1 0.9`` 在 X 方向上使用了
视窗的80%，在图形的左右两边留下一些空间绘制坐标轴、标签和标题。

当与 :doc:`/commands/beginframe` 和 :doc:`/commands/endframe` 命令一起使用时，
可以让你能够在一个视窗内绘制若干不同的图形，构成复杂的组合图。

示例
----

参见 :doc:`/graphics/composite-plots` 一节。
