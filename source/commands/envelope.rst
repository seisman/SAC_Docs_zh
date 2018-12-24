envelope
========

概要
----

利用 Hilbert 变换计算包络函数

语法
----

.. code-block:: bash

    ENVELOPE

说明
----

该命令用于计算内存中数据的包络函数。

原始信号为 :math:`s(t)`\ ，对其做 Hilbert 变换得到 :math:`H(t)`\ ，将这两个
信号合并起来构成复信号

.. math:: C(t) = s(t) + i*H(t)

复信号不仅可以用“实部-虚部”形式表示，也可以用“振幅-相位”形式表示：

.. math:: C(t) = A(t) e^{i\Phi(t)}

其中 :math:`A(t)` 即为包络函数，其可以进一步表示为

.. math:: A(t) = \sqrt{s(t)^2+H(t)^2}

和 :doc:`/commands/hilbert` 一样，数据点数不得少于201，且超长周期的数据需要
在处理之前进行减采样。

头段变量
--------

depmin、depmax、depmen
