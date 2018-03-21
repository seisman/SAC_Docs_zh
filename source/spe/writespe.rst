.. _spe:writespe:

writespe
========

概要
----

写一个包含谱估计的SAC文件

语法
----

.. code:: bash

    W\verb|RITE|SPE [file]

输入
----

file
    要写入的SAC文件名

缺省值
------

writespe spe

说明
----

频谱估计文件包含从0到截止频率的频谱。频谱估计由FFT算法计算得出，文件中的
采样点数是FFT使用的长度的一半再加上1，选择这种格式以使由SPE计算出的多个
频谱能通过 :doc:`/commands/plot2`
绘制函数来进行比较而无需事先为绘图而剪裁文件。
