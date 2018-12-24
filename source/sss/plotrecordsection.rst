plotrecordsection
=================

概要
----

用叠加文件列表中的文件绘制剖面图

语法
----

.. code-block:: bash

    PlotRecordSection [Lables ON|OFF|headerfield] [Origin Default|Reversed]
        [Referenceline ON|OFF] [Size v] [Weight ON|OFF] [Polarity ON|OFF]
        [Cursor ON|OFF] [REDuced ON|OFF|Phase phasename|Velocity velocity]
        [Aspect ON|OFF] [ORIEnt Portrait|Landscape] [Ttime ON|OFF|Default|TEXT]
        [Xlabel ON|OFF|Default|TEXT] [Ylabel ON|OFF|Default|TEXT]

输入
----

LABELS ON|OFF
    打开/关闭标签选项。若打开，则每个文件都用头段变量进行标签

LABELS headerfield
    打开标签选项，病设置头段变量名

ORIGIN DEFAULT|REVERSED
    在 Portrait 模式中，距离沿着 Y 轴，默认情况下距离原点位于左上角。
    在 landscape 模式下，距离沿着 X 轴，默认情况下原点位于左下角。

REFERENCELINE ON|OFF
    开启/关闭参考线选项。若打开，则每个文件在距离属性值对应的地方绘制一条垂直虚线

SIZE v
    ?

WEIGHT ON|OFF
    打开/关闭权重选项

POLARITY ON|OFF
    打开/关闭极性选项

CURSOR ON|OFF
    打开/关闭光标显示选项

REDUCED ON|OFF|VELOCITY vel|PHASE phase
    reduced走时曲线。可以指定reduce速度或者一个参考震相

ORIENT PORTRAIT|LANDSCAPE
    portrait 模式中，水平轴为时间，纵轴为震中距；
    landscape 模式下，水平轴为震中距，垂直轴为时间

TTIME ON|OFF|DEFAULT|TEXT
    绘制走时曲线。需要首先用 :doc:`/sss/traveltime` 命令计算走时曲线

XLABEL ON|OFF|DEFAULT|TEXT
    打开/关闭/设置X轴标签

YLABEL ON|OFF|DEFAULT|TEXT
    打开/关闭/设置Y轴标签

缺省值
------

.. code-block:: bash

    plotrecordsection labels filename origin default referenceline on size 0.1
        weight on polarity on orient portrait reduced off cursor off ttime off

说明
----

该命令将利用叠加文件列表中绘制剖面图。在 portrait 模式下，X 轴为时间，Y 轴为震中距，
在 landscape 模式下则交换 XY 轴。每个文件的零振幅将会画在距离轴上对应的震中距处。

为了能够正确绘图，叠加列表中的所有文件必须定义震中距属性，该属性可以来自于文件
头段，也可以在 :doc:`/sss/globalstack`\ 、\ :doc:`/sss/addstack`\ 、\
:doc:`/sss/changestack` 等命令的 DISTANCE 选项中定义。

:doc:`/sss/distancewindow` 和 :doc:`/sss/timewindow` 命令可以控制要显示的数据窗。
:doc:`/sss/distanceaxis` 和 :doc:`/sss/timeaxis` 命令控制横纵轴的尺寸。
:doc:`/sss/velocitymodel` 定义了速度模型，用于计算动态延迟。
:doc:`/sss/velocityroset` 命令用于控制速度rosette的显示效果。

光标模式
--------

在光标模式下，有两个额外的功能：缩放和决定视速度。

缩放功能需要用户指定要显示的区域。用户首先将光标放在当前图形区域的一个角落，键入
``c1`` ，再将光标移动到对角的另一个角落，键入 ``c2`` 。两次键入
确定了唯一的矩形区域，也确定了要绘制的区域的时间范围和距离范围，此时，会自动重新
绘制缩放后的剖面图，用户可以键入 ``o`` 命令重新绘制原始图形。缩放功能最多
可以递归5次。

视速度确定功能需要用于移动光标，并分别键入 ``v1`` 和 ``v2`` 以标记点，
SAC会自动计算视速度，显示在输出设备上并保持到黑板变量vapp中。可以多次设置v2，但
只有最后一次的值会保存到黑板变量中。

除了c1、c2、v1、v2之外，光标模式下还有一个命令，即 ``q``\ ，用于退出光标模式。
