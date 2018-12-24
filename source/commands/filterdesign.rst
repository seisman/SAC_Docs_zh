filterdesign
============

概要
----

产生一个滤波器的数字和模拟特性的图形显示，包括：振幅、相位、脉冲响应和群延迟

语法
----

.. code-block:: bash

    FilterDesign [FILE [prefix]] [filteroptions] [delta]

输入
----

FILE prefix
    生成的三个SAC文件的前缀

filteroptions
    与 SAC 中其他的滤波命令相同，包括滤波器类型

delta
    数据的采样间隔。

缺省值
------

``delta`` 缺省值为 0.025 s，其他参数无缺省值

说明
----

``filterdesign`` 命令调用了函数 ``xapiir``\ （一个递归数字滤波器包）。
``xapiir`` 通过模拟滤波器原型的双线性变换实现标准递归数字滤波器的设计。
这些原型滤波器由零点和极点给定，然后使用模拟谱变换，变换到高通、带通和带
阻滤波器。

``filterdesign`` 用实线显示数字滤波器响应，用虚线显示模拟滤波器响应。
在彩色显示器上，数字曲线是蓝色的而模拟曲线是琥珀色的。

生成的三个SAC文件分别为 ``prefix.spec``\ 、\ ``prefix.grd``\ 、
``prefix.imp``\ 。其中 ``prefix.spec`` 为该命令产生的振幅相位信息，
为振幅-相位格式谱文件。\ ``prefix.grd`` 为该命令产生的群延迟信息，
是时间序列文件。需要注意的是，尽管这个文件是时间序列文件，但是实际上群
延迟是频率的函数。用户要记住，虽然绘图时横轴单位是秒，实际的单位却是
Hz。\ ``prefix.imp`` 是时间序列文件，包含脉冲响应信息。

在这三个SAC文件中，用户自定义头段变量 ``USERn``\ 、\ ``KUSERn``
设置如下：

-  user0：表示通带代码。1 代表 LP；2 代表 HP；3 代表 BP；4 代表 BR；
-  user1：滤波器类型代码。1 代表 BU，2 代表 BE，3 代表 C1，4 代表 C2；
-  user2：number of poles
-  user3：number of passes
-  user4：tranbw
-  user5：attenuation
-  user6：delta
-  user7：first corner
-  user8：second corner if present, or -12345 if not
-  kuser0：pass (lowpass, highpass, bandpass, or bandrej)
-  kuser1：type (Butter, Bessel, C1, or C2 )

示例
----

下面的例子展示了如何使用 ``filterdesign`` 命令产生一个高通，拐角频率为 2 Hz，
六极、双通滤波器的数字和模拟响应曲线，数据采样间隔为 0.025 s：

.. code-block:: bash

    SAC> fd hp c 2 n 6 p 2 delta .025
