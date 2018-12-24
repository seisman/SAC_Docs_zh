image
=====

概要
----

利用内存中的数据文件绘制彩色图

语法
----

.. code-block:: bash

    IMAGE [COLOR|GREY] [BINARY|FULL]

输入
----

COLOR|GREY
    绘制彩图或者灰度图

BINARY|FULL
    绘图时所有正值是一个颜色，所有负值是另一种颜色，或者根据数据值不同变换颜色

缺省值
------

.. code-block:: bash

    image color full

说明
----

该命令允许用户用SAC三维数据绘制彩图或灰度图。

三维数据可以用 :doc:`/commands/spectrogram`\ 、\ :doc:`/commands/sonogram` 或
:doc:`/commands/bbfk` 命令产生，也可以自己生成 SAC 格式的三维数据。可以使用
:doc:`/commands/xlim` 和 :doc:`/commands/ylim` 以控制要显示的绘图效果，也可以
使用其他命令对数据做振幅上的操作。

示例
----

以 SAC v101.5c 自带的 contourdata 为例：

.. code-block:: bash

    SAC> r contourdata
    SAC> image

.. figure:: /images/image.*
   :alt: image 示意图
   :width: 90.0%
   :align: center

   image 示意图

头段变量
--------

需要：iftype （设为“IXYZ”）、nxsize、nysize

使用：xminimum、xmaximum、yminimum、ymaximum
