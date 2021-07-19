图形设备
========

SAC 支持两种图形设备，分别是 xwindows 和 sgf，默认的图形设备是 xwindows。
可以使用 :doc:`/commands/begindevices` 和 :doc:`/commands/enddevices` 命令
开启/关闭指定的图形设备；同时也可以使用 :doc:`/commands/setdevice` 命令
设定默认的图形设备。

xwindows
--------

xwindows 即 X Window System，也称为 X11 或 X，是一种以位图方式显示的软件
窗口系统。几乎所有的现代操作系统都能支持与使用 X，Linux 下知名的桌面
环境 GNOME 和 KDE 也都是以 X 窗口系统为基础建构成的。

.. _figure:window:

.. figure:: /images/window.*
   :alt: SAC绘图窗口
   :width: 90.0%
   :align: center

   SAC绘图窗口

在 :numref:`figure:window` 展示了 SAC 中的 xwindows 图形设备的外观，它是 SAC
默认的图形设备。同很多其它软件界面类似，xwindows 窗口在左上角显示图标，右上角
显示“最小化”、“最大化”、“还原”和“关闭”按钮。窗口的中间部分为
真正的绘图区，本文档的其余插图将只给出绘图区的图像而不再包含窗口部分。

左上角的“Graphics Window: 1”指明了当前绘图窗口的编号为“1”，SAC 最多
支持同时打开10个 X 窗口，编号为1–10。默认情况下只启动并使用1号 X 窗口。\
:doc:`/commands/beginwindow` 命令用于启动指定编号的 X 窗口；\
:doc:`/commands/window` 命令还可以设置每个X窗口的长宽比以及X窗口相对于屏幕的位置。

sgf
---

SGF，全称 SAC Graphic File，即 SAC 图形文件，是 SAC 自定义的一种文件格式，
其包含了绘制一个图件所需要的全部信息，可以通过 :doc:`/tools/sgftops`
等工具转换到其它图形设备或图形文件格式。

若启用了 SGF 图形设备，每次绘制的图件将分别保存到单独的 sgf 文件中。默认
情况下，sgf 图形文件的文件名格式为 ``fnnn.sgf`` ，其中“nnn”为图件
编号，起始编号为001，每生成一个图件该编号递增。\ :doc:`/commands/sgf`
命令可以控制 SGF 图形设备的选项，比如文件名前缀（默认为 ``f``\ ）、
起始编号（默认从 ``001`` 开始）、保存目录、文件尺寸等。
