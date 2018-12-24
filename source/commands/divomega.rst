divomega
========

概要
----

在频率域进行积分操作

语法
----

.. code-block:: bash

    DIVOMEGA

说明
----

根据傅里叶变换的微分性质：

.. math:: \mathcal{F}[f'(x)]= i \omega \mathcal{F}[f(x)]

其中 :math:`\omega = 2 \pi f`\ ，即函数积分在频率域可以用简单的除法来表示。

该命令仅可对谱文件进行操作，谱文件可以是振幅-相位型或实部-虚部型。
对于正常的谱数据来说还是很方便的，但不适用于谱跨越几个量级的数据。
比如，假设你使用 ``dif`` 命令对数据进行预白化，然后对数据进行
Fourier 变换，用此命令在频率域积分可以去除时间域微分的效应。

若为振幅-相位型：

.. math::

   \mathcal{F}[f(x)] = \frac{\mathcal{F}[f'(x)]}{i \omega}
                     = \frac{A(\omega)e^{\theta(\omega)}}{i \omega}
                     = \frac{A(\omega)}{\omega}e^{\theta(\omega)-\pi/2}

若为实部-虚部型：

.. math::

   \mathcal{F}[f(x)] = \frac{\mathcal{F}[f'(x)]}{i \omega}
                     = \frac{a(\omega)+ib(\omega)}{i \omega}
                     = \frac{b(\omega)}{\omega}-i\frac{a(\omega)}{\omega}

在零频部分，直接设置其值为0比避免除以0的问题。

示例
----

.. code-block:: bash

    SAC> read file1
    SAC> dif                # 微分预白化
    SAC> fft amph           # FFT
    SAC> divomega           # 积分

头段变量
--------

depmin、depmax、depmen
