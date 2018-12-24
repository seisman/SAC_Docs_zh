sonogram
========

概要
----

计算一个频谱图，其等价于同一个谱图的两个不同的平滑版本的差

语法
----

.. code-block:: bash

    SONOgram [WINDOW v] [SLICE v] [ORDER n] [CBAR ON|OFF] [YMIN v] [YMAX v]
        [FMIN v] [FMAX v] [BINARY|FULL] [METHOD PDS|MEM|MLM] [COLOR|GRAY]

输入
----

WINDOW v
    设置滑动数据窗的长度为 ``v`` 秒，窗长决定了 FFT 的尺寸

SLICE v
    设置数据滑动间隔为 ``v`` 秒，对每个滑动间隔将产生一个频谱图线

ORDER n
    指定用于计算谱估计的自相关中的点数

CBAR ON|OFF
    打开/关闭参考颜色条

BINARY|FULL
    产生一个双色或彩色图像

YMIN v
    指定绘图的最小频率

YMAX v
    指定绘图最大频率

FMIN v
    指定每次滑动频谱图被平滑的最小带宽

FMAX v
    指定每次滑动频谱图被平滑的最大带宽

METHOD PDS|MEM|MLM
    指定使用的谱估计方法，\ ``PDS`` 代表功率 密度谱估计，\ ``MLM``
    代表最大似然，\ ``MEM`` 代表最大熵谱估计。

COLOR|GRAY
    指定是彩色图还是灰度图

缺省值
------

.. code-block:: bash

    sonogram window 2 slice 1 method mem order 100 ymin 0 ymax fnyquist
        fmin 2.0 fmax 6.0 full color

此处 ``fnyquist`` 代表 Nyquist 采样频率。

说明
----

``sonogram`` 命令计算了一个谱图，其等效于同一谱图两种不同平滑版本的差。
依赖于平滑参数 ``fmin`` 和 ``fmax`` 的选择，结果谱图可以加强小
幅度谱特性，而其在传统谱图中很难观测到。这个在矿井爆炸的地震信号中寻找
高频谱时很有用。

限制
----

图形在频率方向的尺寸为512

问题
----

目前在头段检查以确定他们有相同的分量且在时间上连续方面还有些错误。

头段变量
--------

需要：delta

修改：npts、delta、b、e、iftype、depmin、depmax、depmen

创建：nxsize、xminimum、xmaximum、nysize、yminimum、ymaximum
