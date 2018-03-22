grayscale
=========

概要
----

产生内存中数据的灰度图像 [1]_

语法
----

.. code:: bash

    G\verb|RAY|S\verb|CALE| [VIDEOTYPE NORMAL|REVERSED] [SCALE v] [ZOOM n]
        [XCROP n1 n2|ON|OFF] [YCROP n1 n2|ON|OFF]

输入
----

VIDEO NORMAL
    设置video类型为 ``normal``\ 。在Normal模式中，
    最小值附近的数据位黑色，最大值附近的数据为白色

VIDEO REVERSED
    设置video类型为 ``reversed``\ 。在Reversed模式
    中，最小值附近的数据位白色，最大值附近的数据为黑色

SCALE v
    改变数据的比例因子为v，The data is scaled by raising it to the vth
    power。小于1的值将平滑图像、降低峰和谷，大于1的值将伸展 整个数据

ZOOM n
    Image is increased to n times its normal size by pixel replication.

XCROP n1 n2
    Turn x cropping option on and change cropping limits to n1 and n2.
    The limits are in terms of the image size.

XCROP ON
    Turn x cropping option on and use previously specified cropping
    limits.

XCROP OFF
    Turn x cropping option off. All of the data in the x direction is
    displayed.

YCROP n1 n2
    Turn y cropping option on and change cropping limits to n1 and n2.
    The limits are in terms of the image size.

YCROP ON
    Turn y cropping option on and use previous specified cropping
    limits.

YCROP OFF
    Turn y cropping option off. All of the data in the y direction is
    displayed.

缺省值
------

grayscale videotype normal scale 1.0 zoom 1 xcrop off ycrop off

说明
----

这个命令可以用于绘制 :doc:`/commands/spectrogram`
命令输出的灰度图，用这个 命令显示的SAC数据须是“xyz”文件。

注意：SAC启动了一个脚本来运行图像操作和显示程序，然后再显示SAC的提示符。
对于大型图像或较慢的机器，这中间会有个明显的延迟。

限制
----

最大只能显示512*1000

头段变量改变
------------

需要：iftype、nxsize、nysize

错误消息
--------

SAC> getsun: Command not found. （需要Utah Raster
Toolkit提供一些工具程序）

.. [1]
   这个命令使用了未在SAC中发布的命令， 要使用这个命令你必须安装Utah
   Raster Toolkit。
