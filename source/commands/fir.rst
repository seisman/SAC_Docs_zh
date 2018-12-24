fir
===

概要
----

应用一个有限脉冲响应滤波器

语法
----

.. code-block:: bash

    FIR [REC|FFT] file

输入
----

FFT
    通过 FFT 变换方法应用 FIR 滤波器

REC
    递归应用 FIR 滤波器

file
    包含 FIR 滤波器的文件名

缺省值
------

.. code-block:: bash

    fir fft fir

说明
----

该命令中使用的滤波器必须首先用 DFIR 交互式滤波器设计。该滤波器通过变换方法
应用，除非你要求使用递归方法或者数据点数对于变换方法来说太大。这些滤波器
都没有相位失真但在脉冲信号前会产生前驱波。

头段变量
--------

depmin、depmax、depmen

限制
----

变换方法的最大数据点数是4096。
