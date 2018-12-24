writespe
========

概要
----

写一个包含谱估计的 SAC 文件

语法
----

.. code-block:: bash

    WriteSPE [file]

输入
----

file
    要写入的 SAC 文件名

缺省值
------

.. code-block:: bash

    writespe spe

说明
----

频谱估计文件包含从0到截止频率的频谱。频谱估计由 FFT 算法计算得出，文件中的
采样点数是FFT使用的长度的一半再加上1，选择这种格式以使由 SPE 计算出的多个
频谱能通过 :doc:`/commands/plot2` 绘制函数来进行比较而无需事先为绘图而剪裁文件。
