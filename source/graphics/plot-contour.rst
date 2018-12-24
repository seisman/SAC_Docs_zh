等值线图
========

SAC 中 :doc:`/commands/spectrogram` 等命令可以生成 IXYZ 数据（即 3D 数据），
这种数据需要用等值线图来展示。
:doc:`/commands/contour` 命令用于等值线，
:doc:`/commands/zcolors`\ 、\ :doc:`/commands/zlabels`\ 、\ :doc:`/commands/zlevels`\ 、
:doc:`/commands/zlines`\ 、\ :doc:`/commands/zticks`
分别用于控制等值线的颜色、 标签、间距、线型以及刻度。

下面的例子中，读入了 XYZ 文件 contourdata，从头段中找出Z数据的范围。
选择等值线范围为 700 km 到 1150 km，增量为 25 km。

选择包括四种线型的线型表，其中第一个为实线。这个列表将每四条等值线重复
一次。然后给等值线图起了个名字，最后绘制出来:

.. code-block:: bash

    SAC> r ./contourdata
    SAC> lh iftype depmin depmax

           IFTYPE = GENERAL XYZ (3-D) FILE
           DEPMIN = 6.977119e+02
           DEPMAX = 1.154419e+03
    SAC> zlevels range 700 1150 increment 25
    SAC> zlines list 1 2 3 4
    SAC> title 'Katmai topography from survey data [inc = 25 km]'
    SAC> contour

.. figure:: /images/contour1.*
   :alt: contour绘制等值线I
   :width: 90.0%
   :align: center

   contour绘制等值线I

下面的例子中，使用同样的文件，但是显示选项不同。每四条等值线有一个整数
标签。每条等值线之间都有一个指向向下的箭头。所有等值线为实线型：

.. code-block:: bash

    SAC> r ./contourdata
    SAC> zlevels range 700 1150 increment 25
    SAC> zlabels on list int off off off
    SAC> zticks on direction down
    SAC> zlines list 1
    SAC> title 'Katmai topography from survey data [labels and ticks]'
    SAC> contour

.. figure:: /images/contour2.*
   :alt: contour绘制等值线图II
   :width: 90.0%
   :align: center

   contour绘制等值线图II
