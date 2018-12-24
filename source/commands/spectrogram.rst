spectrogram
===========

概要
----

使用内存中的所有数据计算频谱图

语法
----

.. code-block:: bash

    SPectroGram [WINDOW v] [SLICE v] [ORDER n] [CBAR ON|OFF]
        [SQRT|NLOG|LOG10|NOSCALING] [YMIN v] [YMAX v] [METHOD PDS|MEM|MLM]
        [COLOR|GRAY]

输入
----

WINDOW v
    设置滑动数据窗的长度为 v 秒，决定了 FFT 的尺寸

SLICE v
    设置数据滑动间隔为 v 秒，对每个滑动间隔将产生一个频谱图线

ORDER n
    指定用于计算谱估计的自相关中的点数

CBAR ON|OFF
    打开/关闭参考颜色条

SQRT|NLOG|LOG10|NOSCALING
    指定振幅的自然对数、以10为底的对数或平方根

YMIN v
    指定绘图的最小频率

YMAX v
    指定绘图最大频率

METHOD PDS|MEM|MLM
    指定使用的谱估计方法，\ ``PDS`` 代表功率 密度谱估计，\ ``MLM``
    代表最大似然，\ ``MEM`` 代表最大熵谱估计。

COLOR|GRAY
    指定是彩色图还是灰度图

缺省值
------

.. code-block:: bash

    spectrogram window 2 slice 1 method mem order 100 noscaling
        ymin 0 ymax fnyquist color

此处 ``fnyquist`` 代表 Nyquist 采样频率。

说明
----

频谱图是通过计算连续并可能重叠的数据时间窗的功率谱并将谱沿着时间轴绘制
产生的。谱是由一个使用 ``MLM`` 或 ``MEM`` 或 ``PDS`` 得
到的被截断的自相关函数。一般会选择高精度的 ``MLM`` 和 ``MEM``
方法，因为他们提高了精度且不会产生由于不同频率之间能量泄漏导致的人工干扰。
这些技术的介绍可以参考 Kanasewich(1981) 以及 Lacoss(1971)。被截断的互相关
函数的长度由 ``ORDER`` 参数决定。为了保持和SPE子程序的一致性， 设置了
``PDS`` 的默认 ``order`` 为200，\ ``MEM`` 和 ``MLM`` 的 ``order``
默认为100。在SAC中每个数据窗的长度由 ``window``
参数决定。沿着频谱图时间轴的谱之间的间隔由 ``slice``
参数决定。这两个参数的不同决定了临近时间窗的重叠量，如下图所示:

.. code-block:: bash

    Time ->
    0  1  2  3  4  5  6  7  8  9 10 11
    |.....|.....|.....|.....|.....|.....|.....|.....|.....|.....|..|
    |__^__| window 1, First time will be at the center of this window.
          |__^__| window 2
                |__^__| window 3

    |.....| Slice: 临近时间窗的开始时间的差

频谱图时间轴的起始和结束点依赖于要被分析的时间序列的长度以及 ``window``\ 、\
``slice`` 参数。频谱图的起始时间是时间序列起始时间迟半个窗对应的时间，
因为它被定义为第一个窗的中间时刻。SAC 不会对数据的前面补0。

限制
----

图形在频率方向的尺寸为512

问题
----

目前在头段检查以确定他们有相同的分量且在时间上连续方面还有些错误。

头段变量改变
------------

需要：delta

改变：npts、delta、b、e、iftype、depmin、depmax、depmen

创建：nxsize、xminimum、xmaximum、nysize、yminimum、ymaximum
