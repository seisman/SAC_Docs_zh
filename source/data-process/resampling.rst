数据重采样
==========

**相关命令**\ ：\ :doc:`/commands/decimate`\ 、\ :doc:`/commands/interpolate`

如下情形，需要对数据进行重采样：

-  不同仪器的采样周期可能不同，需要将所有的数据重采样到相同的采样周期；
-  数据的采样周期很小，导致数据量很大，而实际研究中不需要如此小的采样
   周期，因而可以对数据做减采样以减小数据量；
-  数据的采样周期过大，实际研究中需要更小的采样周期，此时需对数据做增采样；
-  数据为不等间隔数据，需要插值成为等间隔数据；

decimate
--------

:doc:`/commands/decimate` 专门用于解决上面所说的第二种情形，即等间隔数据的
减采样。在减采样过程中，根据 Nyquist 采样定理，可能会出现混叠现象，而
``decimate`` 对数据自动做了低通滤波，以避免混叠现象的产生。

下面的示例中，将一个等间隔数据减采样10倍：

.. code-block:: bash

    SAC> fg seis
    SAC> lh delta npts

         delta = 1.000000e-02       # 采样间隔delta=0.01
          npts = 1000
    SAC> decimate 5; decimate 2     # 减采样10倍
    SAC> lh delta npts

         delta = 9.999999e-02       # 采样间隔delta=0.1，忽略浮点数误差
          npts = 100

interpolate
-----------

与 :doc:`/commands/decimate` 相比，\ :doc:`/commands/interpolate` 命令功能
更加强大，其可以对等间隔或不等间隔数据进行增采样或减采样。

比如增采样，即插值：

.. code-block:: bash

    SAC> fg seis
    SAC> lh delta npts

         delta = 1.000000e-02
         npts = 1000
    SAC> interp delta 0.005         # 增采样2倍
    SAC> lh

         delta = 5.000000e-03
         npts = 1999

对于减采样，\ ``interpolate`` 与 ``decimate`` 的功能略有重复，但
``interpolate`` 在减采样时不会对数据进行低通滤波，因而使用
``interpolate`` 进行减采样时可能会出现混叠现象，故而需要手动进行
低通滤波。

下面的示例将数据减采样到 20 Hz。根据 Nyquist 采样定理，为了保证
不产生混叠现象，应首先对数据做 10 Hz 的低通滤波。

.. code-block:: bash

    SAC> fg seis
    SAC> lh npts delta

         npts = 1000
         delta = 1.000000e-02
    SAC> lp c 10
    SAC> interpolate delta 0.05
    WARNING potential for aliasing. new delta: 0.0500 data delta: 0.0100
        #  在做了lowpass之后，此处的警告可忽略
