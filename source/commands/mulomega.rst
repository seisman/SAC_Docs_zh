mulomega
========

概要
----

在频率域进行微分操作

语法
----

.. code-block:: bash

    MULOMEGA

说明
----

根据傅里叶变换的微分性质：

.. math:: \mathcal{F}[f'(x)]= i \omega \mathcal{F}[f(x)]

其中 :math:`\omega = 2 \pi f` ，即函数微分在频率域可以用简单的乘法来表示。

该命令仅可对谱文件进行操作，谱文件可以是振幅-相位型或实部-虚部型。

若为振幅-相位型：

.. math::

   \mathcal{F}[f'(x)]= i \omega \mathcal{F}[f(x)] = i \omega (A(\omega)e^{\theta(\omega)})
       = (A(\omega)\omega)e^{\theta(\omega)+\pi/2}

若为实部-虚部型：

.. math::

   \mathcal{F}[f'(x)]= i \omega \mathcal{F}[f(x)] = i \omega (a(\omega)+ib(\omega))
       = -b(\omega)\omega+ia(\omega)\omega

头段变量
--------

depmin、depmax、depmen
