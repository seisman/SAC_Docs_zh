wiener
======

概要
----

设计并应用一个自适应 Wiener 滤波器

语法
----

.. code-block:: bash

    WieNeR [Window pdw] [Ncoeff n] [MU OFF|ON|v] [EPSilon OFF|ON|e]

输入
----

WINDOW pdw
    设置滤波器设计窗口为 pdw，详情见 :ref:`subsec:pdw`

NCOEFF n
    设置滤波器系数为 ``n`` 个

MU off|on|v
    设置自适应步长参数

MU Off
    设置自适应步长参数为0

MU ON
    设置自适应步长为 1.95/Rho(0)，其中 Rho(0) 是 ``pdw`` 中延迟为0时的自相关系数

MU v
    设置自适应步长为v

EPSILON ON|OFF|e
    设置岭回归（ridge regression）参数为。
    若为 ``OFF``\ ，则 SAC 将依次设置 epsilon 值为0.0、\ :math:`10^{-5}`\ 、\
    :math:`10^{-4}`\ 、\ :math:`10^{-3}`\ 、\ :math:`10^{-2}`\ ，直到滤波器
    稳定为止。若 epsilon=0 不稳定，则会给出警告信息，若所有值均不稳定，
    则会给出错误信息。

缺省值
------

.. code-block:: bash

    wiener window b 0 10 ncoeff 30 mu off epsilon off

说明
----

对文件的 ``pdw`` 内的数据估计自相关函数，并利用 Yule-Walker 方法设计
预测误差滤波器，然后将滤波器应用到整个信号，即信号被误差序列替换。
该滤波器可以用作预白化或用作瞬时信号的检测预处理器。若 mu 指定为非0值，则
滤波器为时域自适应的，大值 mu 可能会导致不稳定。

岭回归（ridge regression ）参数通过给自相关矩阵的对角线元素加上 epsilon
以达到稳定wiener滤波器的目的。

示例
----

下面的命令将应用一个非自适应滤波器，将第一个十秒指定为数据窗：

.. code-block:: bash

    SAC> wiener window b 0 10 mu 0.

下面命令将应用带40个系数的滤波器，指定设计窗为从文件开始到第一个到时前1秒：

.. code-block:: bash

    SAC> wiener ncoeff 40 window b a -1

头段变量
--------

depmin、depmax、depmen
