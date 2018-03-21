样本数据
========

想要学习SAC，手头必须有SAC格式的数据，SAC提供了两个命令可以用于生成SAC
格式数据，分别是 `funcgen </commands/funcgen.html>`__ 和
`datagen </commands/datagen.html>`__\ 。

funcgen
-------

`funcgen </commands/funcgen.html>`__\ （简写为 ``fg``\ ）表示“function
generator”，
即该命令可以生成一些特定的函数，比如脉冲、阶跃、正弦等等，还可以生成
一个地震波形样本：

.. code:: bash

    SAC> fg impulse         // 生成脉冲函数

上面的命令生成了一个脉冲函数并存储在SAC的内存中，可以用命令
`plot </commands/plot.html>`__\ （写为
``p``\ ）在图形界面上查看这个函数的样子：

.. code:: bash

    SAC> p

在学习SAC的过程中，\ ``funcgen`` 可以生成地震波形样本：

.. code:: bash

    SAC> fg seismogram      // 生成地震波形样本，简写为fg seis

这个命令在SAC内存中产生了一个地震波形样本，同时删除了内存中刚才生成的
脉冲信号，可以使用 ``plot`` 命令查看地震波形。这个地震波形样本在
以后的教程中经常用到。

datagen
-------

`datagen </commands/datagen.html>`__\ （简写为 ``dg``\ ）表示“data
generator”。 顾名思义，就是用来生成数据的。

下面的示例在内存中生成了CDV台站记录到的一个近震的三分量波形数据  [1]_，
并用 `plot1 </commands/plot1.html>`__\ （简写
``p1``\ ）将三个波形画在一张图上：

.. code:: bash

    SAC> dg sub local cdv.?
    SAC> p1

更多示例参考 `datagen </commands/datagen.html>`__ 命令的语法说明。

.. [1]
   101.4的软件包中没有自带波形数据，因而无法使用该命令。
