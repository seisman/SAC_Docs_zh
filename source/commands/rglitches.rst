rglitches
=========

概要
----

去掉信号中的坏点

语法
----

.. code:: bash

    RGLitches [THreshold v] [TYpe Linear|Zero] [Window ON|OFf|pdw]
        [METHOD Absolute|Power|Runavg]

输入
----

WINDOW ON|OFF|pdw
    指定需要做校正的数据段。缺省值为OFF，即校正
    整个数据文件； :ref:`subsec:pdw` 指定了时间窗，表示仅对该时间窗
    内的数据进行检测和校正；ON表示只校正上一次 ``pdw`` 定义的时间
    窗内的数据；

THRESHOLD v
    设置阈值水平为 ``v``\ 。当某个特定的指标大于该
    阈值时即认为是坏点，并做校正

METHOD ABSOLUTE
    若数据点的绝对值大于或等值阈值 ``v``\ ，则做校正

METHOD POWER
    用向后差分法计算信号的能量，若能量超过阈值v则做校正

METHOD RUNAVG
    将一个长为 ``SWINLEN`` 的窗从整个数据的末尾以
    一个数据点的增量移动到数据的开头，并计算每个滑动窗内的平均值和标准差。
    若某个点与当前窗的均值的差的绝对值大于标准差\ ``THRESH``\ 的2倍，
    且大于 ``MINAMP``\ ，则认为其是坏点，其值将用当前窗的均值代替。
    此方法不受 ``WINDOW`` 选项的影响，总是适用于整段波形数据。

对于RUNAVG方法，另有三个与之相关的选项：

SWINLEN v
    设置滑动平均窗的长度为v

THRESH2 v
    设置坏点的阀值

MINAMP v
    设置坏点的最小幅度

缺省值
------

.. code:: bash

    rglitches threshold 1.0e+10 type linear window off method absolute
        swinlen 0.5 thresh2 5.0 minamp 50

说明
----

此命令可以用于由于平滑数据采集系统故障或测试 [1]_
而产生的坏点。该命令会检查每一个数据点是否超过指定的阈值，然后将这些坏点
置零或者线性插值。使用RUNAVG方法，甚至可以去掉那些比整个数据的最大值要小
的坏点。

头段变量
--------

depmin、depmax、depmen

.. [1]
   有些台网会在每天的
   指定时间生成若干个人工脉冲，以检测数据采集系统是否正常运行。
