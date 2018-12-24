plotsp
======

概要
----

用多种格式绘制谱数据

语法
----

.. code-block:: bash

    PlotSP [ASIS|RLIM|AMPH|RL|IM|AM|PH] [LINLIN|LINLOG|LOGLIN|LOGLOG]

输入
----

ASIS
    按照谱文件当前格式绘制分量

RLIM
    绘制实部和虚部分量

AMPH
    绘制振幅和相位分量

RL|IM|AM|PH
    只绘制实部/虚部/振幅/相位分量

LINLIN|LINLOG|LOGLIN|LOGLOG
    设置 x-y 轴为线型还是对数型，与单独的 :doc:`/commands/linlin`
    等命令区分开

缺省值
------

.. code-block:: bash

    plotsp asis loglog

说明
----

SAC 数据文件可能包含时间序列文件或谱文件，\ ``IFTYPE`` 决定文件所有
哪种类型。多数绘图命令只能对时间序列文件起作用，这个命令则可以绘制谱文件。

你可以使用这个命令绘制一或两个分量。每一个分量绘制在一张图上。你也可以设
置横纵坐标为线型或对数型，其仅对该命令有效.

示例
----

获得一个谱文件振幅的对数-线性的绘图：

.. code-block:: bash

    SAC> read file1
    SAC> fft
    SAC> plotsp am loglin
