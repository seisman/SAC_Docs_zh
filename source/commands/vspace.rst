vspace
======

概要
----

设置图形的最大尺寸和长宽比

语法
----

.. code-block:: bash

    VSPace [FULL|v]

输入
----

FULL
    使用整个 viewspace，这是最大窗口尺寸

v
    设置 viewspace 的纵横比为v，具有这个纵横比的最大区域即为 viewspace

缺省值
------

.. code-block:: bash

    vspace full

说明
----

viewspace 是屏幕上可以用于绘图的部分。viewspace 的形状和尺寸在不同图形
设备之间有很大的变化。

#. 尽管在尺寸上有很大不同，许多图形终端都具有0.75的纵横比
#. SGF 文件的纵横比为0.75，其大约是标准的8.5*11英寸纸张的纵横比
#. 由 XWindows 或 SunWindows 图形设备建立的窗口可以有你想要的任意纵横比

默认情况下绘图会占据整个 viewspace。该命令可以控制 viewspace 的纵横比，
从而使你能够控制图形的形状。如果确定了一个纵横比，则 viewspace 就是设备上
具有这个纵横比的最大区域。

当你使用 :doc:`/commands/plotc` 命令在交互设备上建立一张图，并且最终要
将它发送到 SGF 设备上，这个命令特别有用。在绘制任何图形之前，必须设置
纵横比为0.75。这将保证图形在 SGF 文件上与在交互设备上相同。如果你要建立
一个独立于图形设备的正方形 viewspace，则可以简单地设置纵横比为1.0。
