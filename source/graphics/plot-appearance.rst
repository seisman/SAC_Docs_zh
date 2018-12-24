图像外观
========

图像元素
--------

对于 SAC 而言，最基本的显示元素是将所有数据点用线连起来所构成的地震图。
除此之外，SAC 的绘图命令还会在图像的四个边绘制坐标轴以及刻度，为图像
添加标题、轴标签等。

在 :numref:`figure:plot-appearance` 中展示了一个完整的 SAC 图像所包含的所有元素。

.. _figure:plot-appearance:

.. figure:: /images/appearance.*
   :alt: 绘图外观及其相关命令
   :width: 90.0%
   :align: center

   绘图外观及其相关命令

   图中蓝色部分为对绘图外观的说明。

:numref:`figure:plot-appearance` 可以用如下命令绘制得到：

.. code-block:: bash

    SAC> fg seis                # 生成数据
    SAC> qdp on                 # 打开QDP选项（默认值即为开）
    SAC> grid on                # 显示网格
    SAC> title 'Seismic Trace'  # 设置标题
    SAC> xlabel "Time(s)"       # 设置x轴标签
    SAC> ylabel "Amplitude"     # 设置y轴标签
    SAC> filenumber on          # 显示文件号
    SAC> axes only left bottom  # left和bottom显示axes
    SAC> ticks only right       # right显示ticks
    SAC> border on              # top显示border
    SAC> p                      # 绘图

图像中显示的元素包括：

标签
~~~~

标签大致可以分为三种：标题、轴标签和通用标签。

TITLE
    图像的标题。\ :doc:`/commands/title` 命令可控制标题文本、位置和尺寸
XLABEL、YLABEL
    轴标签。\ :doc:`/commands/xlabel` 和 :doc:`/commands/ylabel`
    命令可指定 X 和 Y 轴标签文本、位置和尺寸。
PLABEL
    通用标签。\ :doc:`/commands/plabel` 可指定通用标签的文本、位置和尺寸。

标签文本需要用单引号或双引号包围，文本尺寸选项 ``size`` 可以选择
``tiny``\ 、\ ``small``\ 、\ ``medium`` 或 ``large``\ ， 文本位置选项
``location`` 则可以取 ``top``\ 、\ ``bottom``\ 、\ ``left`` 或 ``right``\ 。

可以通过 :doc:`/commands/plabel` 命令定义最多三个通用标签。通用标签与轴标
签类似，其更通用之处在于可以任意指定其位置。每个标签可以用
``position x y a`` 来指定其位置，其中 ``x``\ 、\ ``y`` 为标签位置相对于窗口尺寸
的比例，\ ``a`` 表示标签相对于水平方向顺时针旋转的角度；也可以用 ``below``
设置新标签位于上一标签的下方。

标记
~~~~

图像中包含了如下标记：

FILEID
    文件ID。\ :doc:`/commands/fileid` 用于控制文件 ID 的内容、位置及其格式。
FILENO
    文件号。\ :doc:`/commands/filenumber` 控制文件号显示与否。
PICKS
    到时标记。\ :doc:`/commands/picks` 用于控制是否显示到时标记以及显示效果。
QDP
    QDP因子。\ :doc:`/commands/qdp` 用于控制 qdp 因子的大小。

QDP，全称为“quick and dirty plot”。在开发 SAC 的那个年代，计算机的性能
一般，若在绘图时绘制全部数据点，则绘图过程会耗费大量时间。因而SAC采用了
“qdp”的方式：每隔若干个数据点绘制一个数据点\ [1]_。图中右下角的“2”即表示每两个
点中绘制一个点。目前计算机的性能已经足够强大，因而一般使用 ``qdp off``
命令关闭该选项。

底图边框
~~~~~~~~

每张图都有一个底图，每个底图有 TOP、BOTTOM、LEFT 和 RIGHT 四条边。

SAC 中，每条边都可以用四种不同的形式表示：

-  不绘制；\ :numref:`figure:plot-appearance` 中 TOP 边；
-  ticks：直线+刻度\ [2]_，即图中 RIGHT 边；
-  axes：直线+刻度+标注\ [3]_， 即图中 LEFT 边和 BOTTOM 边；

从上面的定义可以看到，四种形式的边存在包含与被包含的关系，因而在设
定边时，有如下规则：

#. 用 :doc:`/commands/axes` 控制在哪些边使用“axes”；
#. 只有不使用“axes”的边才可以用 :doc:`/commands/ticks` 命令控制是否使用“ticks”；
#. 只有不使用“axes”和“ticks”的边才可以使用 :doc:`/commands/border` 命令控制
   是否使用“border”；
#. 不使用“axes”、“ticks”和“borders”的边则不绘制。

除了边之外，还可以使用 :doc:`/commands/grid` 命令控制网格的显示以及网格的线型，
或使用 :doc:`/commands/xgrid`\ 、\ :doc:`/commands/ygrid` \ 分别控制横、纵方向
网格的显示和属性。

图像控制
--------

坐标轴
~~~~~~

SAC 使用了优秀的默认算法，根据要绘制的数据范围选择合适的刻度间隔和标注。
若对于默认的结果不满意，可以使用 SAC 提供的命令分别对 X、Y 坐标轴进行调整，
下面仅列出与 X 轴相关的命令。

xlim
    控制绘图的 X 轴范围
xdiv
    控制 X 轴刻度间隔
xfudge
    设定 fudge 因子，根据数据极值扩展 X 轴范围

坐标系
~~~~~~

绘制时间序列一般使用线性坐标系，SAC 也提供了一系列命令以指定 X、Y 轴为线性
坐标轴或对数坐标轴。这些命令包括：
:doc:`/commands/linlin`\ 、\
:doc:`/commands/linlog`\ 、\
:doc:`/commands/loglin`\ 、\
:doc:`/commands/loglog`\ 、\
:doc:`/commands/xlin`\ 、\
:doc:`/commands/xlog`\ 、\
:doc:`/commands/ylin`\ 、\
:doc:`/commands/ylog`\ 。

对于对数坐标轴，还有一些命令可以控制其外观，比如
:doc:`/commands/xfull`\ 、\
:doc:`/commands/loglab`\ 、\
:doc:`/commands/floor`\ 。

线条属性
--------

线条的属性包括线型（\ :doc:`/commands/line`\ ）、线宽（\ :doc:`/commands/width`\ ）、
颜色（\ :doc:`/commands/color`\ ）和符号（\ :doc:`/commands/symbol`\ ）。

下面的命令展示了如何修改线条的属性。

.. code-block:: bash

    SAC> fg seis
    SAC> line 3         # 线型为3
    SAC> width 2        # 线宽为2
    SAC> color red      # 红色
    SAC> p

.. figure:: /images/attribution1.*
   :alt: 线条属性
   :width: 70.0%
   :align: center

   线条属性

在绘制多个波形数据时，可以设置线条的属性按照某个列表递增。下面的命令
一次绘制四个波形文件，使每个数据的线型和颜色都按照默认列表递增。

.. code-block:: bash

    SAC> dg sub teleseis ntkl.z nykl.z onkl.z sdkl.z
    SAC> line incre
    SAC> color black incre
    SAC> p

.. figure:: /images/attribution2.*
   :alt: 线条属性递增
   :width: 70.0%
   :align: center

   线条属性递增

:doc:`/commands/line` 命令不仅可以设置线条的线型，同时可以对波形数据进行颜色填充：

.. code-block:: bash

    SAC> fg seis
    SAC> qdp off
    SAC> rmean; rtr; taper
    SAC> line 0 fill red/blue
    SAC> p

.. figure:: /images/linefill.*
   :alt: 颜色填充图
   :width: 70.0%
   :align: center

   颜色填充图

.. [1] 本质上就是绘图时的一次“减采样”，但是没有做抗混淆处理。
.. [2] 刻度专指每条边上的短线。
.. [3] 标注专指每条边上的数字。
