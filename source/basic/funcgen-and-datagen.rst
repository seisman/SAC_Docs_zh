样本数据
========

想要学习 SAC，手头必须有 SAC 格式的数据，SAC 提供了两个命令可以用于生成 SAC
格式数据，分别是 :doc:`/commands/funcgen` 和 :doc:`/commands/datagen`\ 。

funcgen
-------

:doc:`/commands/funcgen`\ （简写为 ``fg``\ ）表示“function generator”，即该
命令可以生成一些特定的函数，比如脉冲、阶跃、正弦等等，还可以生成一个地震波形样本::

    SAC> fg impulse         # 生成脉冲函数

上面的命令生成了一个脉冲函数并存储在 SAC 的内存中，可以用命令 :doc:`/commands/plot`
（简写为 ``p``\ ）在图形界面上查看这个函数的样子::

    SAC> p

在学习SAC的过程中，\ ``funcgen`` 可以生成地震波形样本::

    SAC> fg seismogram      # 生成地震波形样本，简写为 fg seis

这个命令在 SAC 内存中产生了一个地震波形样本，同时删除了内存中刚才生成的
脉冲信号，可以使用 ``plot`` 命令查看地震波形。这个地震波形样本在
以后的教程中经常用到。

datagen
-------

:doc:`/commands/datagen`\ （简写为 ``dg``\ ）表示“data generator”。顾名思义，
就是用来生成数据的。

下面的示例在内存中生成了 CDV 台站记录到的一个近震的三分量波形数据\ [1]_，
并用 :doc:`/commands/plot1`\ （简写\ ``p1``\ ）将三个波形画在一张图上::

    SAC> dg sub local cdv.?
    SAC> p1

更多示例参考 :doc:`/commands/datagen` 命令的语法说明。

.. [1] v101.4 的软件包中没有自带波形数据，因而无法使用该命令。
