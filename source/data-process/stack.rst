信号叠加
========

**相关命令**\ ：\ :doc:`/sss/liststack`\ 、\ :doc:`/sss/zerostack`

信号叠加是消除噪声、增强有效信号的常用手段。SAC 通过提供一个子程序
Signal Stack Subprocess（简称 sss）来实现。

sss 的进入和退出
----------------

在 SAC 中键入 ``sss`` 即可进入该子程序；在子程序中键入 :doc:`/commands/quitsub`
即可退出子程序并回到主程序；也可键入 :doc:`/commands/quit` 直接从子程序中退出 SAC。

添加文件
--------

首先，需要让 SAC 读入要叠加的 SAC 文件。

.. code-block:: bash

    SAC> sss   # 进入 sss 子程序
    Signal Stacking Subprocess.
    SAC/SSS> addstack a.SAC weight 1 delay 20 seconds

上面的示例中读入了文件 ``a.SAC``\ ，\ ``weight 1`` 设置了文件在叠加中的权重，
即用 1 乘以 SAC 文件的每一个点的值，权重可以是 0 到 1 的数。\ ``delay 20 seconds``
表示将波形向后延迟 20 秒。

在 SAC 主程序中读入的文件，在进入子程序时会保留。如下面的例子所示：

.. code-block:: bash

    SAC> r a.SAC    # 读取了文件 a.SAC
    SAC> sss   # 进入 sss 子程序
    Signal Stacking Subprocess.
    SAC/SSS> addstack a.SAC delay 10 s    # 添加文件 a.SAC，并延迟 10s
    SAC/SSS> addstack b.SAC               # 添加文件 b.SAC
    SAC/SSS> liststack    # 列出叠加文件列表中的文件属性

     filename  weight      delayt      delayn     delayvm   polarity   distance
                               delayti     delayni      begin       end
     a.SAC         1.000       0.000       0.000       0.000   NORMAL   -12345.000
                                 0.000       0.000      10.000      14.000
     a.SAC         1.000       10.00       0.000       0.000   NORMAL   -12345.000
                                 0.000       0.000      10.000      14.000
     b.SAC         1.000       0.000       0.000       0.000   NORMAL   -12345.000
                                 0.000       0.000      20.000      24.000
     Time Window:       0.000       0.000
     Stack Velocity Model 1 OFF
     Stack Velocity Model 2 OFF

叠加文件
--------

本小节首先生成两个脉冲函数文件，然后尝试用多种方式把它们叠加起来。

.. code-block:: bash

    SAC> funcgen impulse npts 10 delta 1 begin 0
    # 生成一个脉冲函数，数据点数 10 个，采样间隔 1s， 头段 b 为 0
    SAC> w a.SAC
    SAC> funcgen impulse npts 10 delta 1 begin 10
    # 生成一个脉冲函数，数据点数 10 个，采样间隔 1s， 头段 b 为 10
    SAC> w b.SAC
    SAC> sss
     Signal Stacking Subprocess.
    SAC/SSS> zerostack         # 清除之前添加的文件及各种设置
    SAC/SSS> addstack a.SAC
    SAC/SSS> addstack b.SAC
    SAC/SSS> timewindow 0 19    # 确定时窗，必选设定
    SAC/SSS> sumstack    # 叠加波形

.. figure:: /images/stack-without-delay.*
   :alt: 不做动校正的叠加
   :width: 80.0%
   :align: center

   不做动校正的叠加

执行后，SAC 会自动弹出叠加后的波形图，此时可以看到两个脉冲信号。
叠加的方式需要注意两点：一是波形是按相对时刻对齐的；
二是叠加后会做归一化，所以最大振幅只有 0.5。

下面尝试把 ``a.SAC`` 和 ``b.SAC`` 叠加起来，并做动校正让脉冲信号重合，并且
振幅就是简单的求和使其等于 2。

.. code-block:: bash

    SAC/SSS> zero stack
    SAC/SSS> addstack a.SAC delay 10 s
    SAC/SSS> addstack b.SAC
    SAC/SSS> timewindow 0 19
    SAC/SSS> sumstack n off

结果如图：

.. figure:: /images/stack-with-delay.*
   :alt: 做动校正的叠加
   :width: 80.0%
   :align: center

   做动校正的叠加
