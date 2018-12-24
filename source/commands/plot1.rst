plot1
=====

概要
----

绘制多波形多窗口图形

语法
----

.. code-block:: bash

    Plot1 [Absolute|Relative] [Perplot ON|OFF|n]

输入
----

ABSOLUTE|RELATIVE
    绝对/相对绘图模式

PERPLOT n
    每张图上绘制 ``n`` 个文件

PERPLOT ON
    每张图绘制 ``n`` 个文件，使用 ``n`` 的旧值

PERPLOT OFF
    所有文件绘制在一张图上

缺省值
------

.. code-block:: bash

    plot1 absolute perplot off

说明
----

``plot1`` 用于一次性绘制多个波形，多个波形共用同一个 X 轴，但各自拥有
一个单独的 Y 轴。绘图的总尺寸由当前视口决定（\ :doc:`/commands/xvport` 和
:doc:`/commands/yvport`\ ）。每一个子图的大小由视口大小以及要绘制的波形数目
决定。绘图的 X 轴范围可以是固定的（\ :doc:`/commands/xlim`\ ）也可以是与数据长度
成比例的。每个子图的Y轴范围由文件极值决定或者可以通过 :doc:`/commands/ylim`
命令自己设置。

多个波形共用 X 轴时，有 ``absolute`` 和 ``relative`` 两种绘图模式。在
``absolute`` 模式下，所有波形将按照其绝对时刻对齐，即 X 轴
表示相对于某个固定参考时刻的秒数；在 ``relative`` 模式下，所有数据
将按照文件开始时间对齐，X 轴的范围为0到最大时间差（所有文件中结束时间和
开始时间的最大时间差，即最大 ``e-b``\ ），每个波形从X轴的零点开始绘制，
该零点所对应的真实时刻，会在图中以 ``OFFSET: xxx`` 的形式标出。

示例
----

下面的例子是由 LLNL DSS 的4个台站 Elko、Kanab、Landers 和 Mina 记录到的美国
西部的一个地震。参考时间为事件发生时刻：

.. code-block:: bash

    SAC> cut -5 200
    SAC> read *v
     elk.v knb.v lac.v mnv.v
    SAC> fileid location ul type list kstcmp
    SAC> title 'regional earthquake:  &1,kztime&  &1,kzdate&'
    SAC> qdp 2000
    SAC> plot1
