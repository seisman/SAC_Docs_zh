去均值、去线性趋势和波形尖灭
============================

**相关命令**\ ：\ :doc:`/commands/rmean`\ 、\ :doc:`/commands/rtrend`\ 、\ :doc:`/commands/taper`

通常，波形数据总会存在一个非零的均值或者存在一个长周期的线性趋势，
这会影响到数据的分析，必须在数据分析前去除。另一方面，在对数据进行
谱域操作（如FFT、滤波等）时，若数据的两端不为零，则会出现谱域假象，
因而实际数据经常需要做尖灭处理，使得数据两端在短时间窗内逐渐变成零值。

.. code-block:: bash

    SAC> fg seis
    SAC> rmean; rtr; taper

在 :numref:`figure:rmean-rtrend-taper` 中，波形从上到下依次为原始波形、去均值、
去线性趋势、和尖灭之后的波形。

.. _figure:rmean-rtrend-taper:

.. figure:: /images/rmean-rtrend-taper.*
   :alt: 去均值、去线性趋势和波形尖灭
   :width: 90.0%
   :align: center

   去均值、去线性趋势和波形尖灭
