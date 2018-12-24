hilbert
=======

概要
----

应用 Hilbert 变换

语法
----

.. code-block:: bash

    HILBERT

说明
----

一个实序列 :math:`f(t)` 的 Hilbert 变换定义为

.. math::

   H(f(t)) = f(t) * (\frac{1}{\pi t}) =
       \frac{1}{\pi} \int_{-\infty}^{+\infty} \frac{f(t)}{t-\tau} d\tau

其中星号表示卷积。

由于 :math:`\frac{1}{\pi t}` 的 Fourier 变换为
:math:`-i sgn(\omega)=-e^{i\pi/2} sgn(\omega)`\ ，
因而对一个信号做 Hilbert 变换可以理解为先将信号做 Fourier 变换，然后乘以
:math:`-e^{i\pi/2} sgn(\omega)`\ ，再做反 Fourier 变换。
即 Hilbert 变换的一个重要性质是对信号产生 :math:`\frac{\pi}{2}` 的相移\ [1]_。

该命令通过将原始信号与一个201点 FIR 滤波器进行时间域卷积以实现 Hilbert 变换。
此 FIR 滤波器是通过对理想 Hilbert 变换的脉冲响应加 Hanning 窗获得的。在频率域，
每个频率处的振幅响应为1，相位为90度。Hilbert 变换后的结果将替代内存中的
原始信号。

需要注意的是，此操作在零频和 Nyquist 频率附近的小区域内是不精确的。若要
对很低频率的数据进行 Hilbert 变换（比如长周期面波），则需要先对信号进行
减采样。由于该变换是在时间域完成的，所以计算时在原地使用重叠储存算法，
其对于文件长度没有限制。

理论上，Hilbert 变换可以从振幅谱的对数中计算最小延迟相位，本质上 Hilbert
变换是一个非带限的低通滤波器，因而本命令中的 Hilbert 变换无法用于计算最小
延迟相位。

SAC 提供了 Hilbert 变换的函数库，可以直接在 C 或 Fortran 程序中调用，详情参考
:doc:`/libs/libsac` 一节。

头段变量
--------

depmin、depmax、depmen

.. [1] 本段内容不够严谨，正负号可能有误，其中的细节也被省略，因而仅供参考。
