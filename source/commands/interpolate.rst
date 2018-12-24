interpolate
===========

概要
----

对等间隔或不等间隔数据进行插值以得到新采样率

语法
----

.. code-block:: bash

    INTERPolate [Delta v|Npts v] [Begin v]

输入
----

DELTA v
    设置新采样率为 ``v``\ 。数据的时间跨度（E-B）保持不变，
    ``npts``\ 变化，\ ``E`` 由于需要与 ``b`` 的间距为 ``delta``
    的整数倍，所以可能会有微调

NPTS n
    强制设置插值后文件的数据点数为 ``n``\ 。时间宽度不变，\ ``delta``
    发生变化。

BEGIN v
    在 ``v`` 处开始插值，该值将作为插值文件的起始时间。\ ``BEGIN`` 可以和
    ``DELTA`` 或 ``NPTS`` 选项一起使用。

说明
----

该命令使用 Wiggins 的 weighted average-sloped 插值方法将不等间隔数据转换为
等间隔数据，以及对等间隔数据插值得到新的采样率。不像三次样条插值，在输入
样本数据点间不会存在极值。如果要降低采样率，即减采样，由于该命令没有
抗混叠滤波器，所以最好使用 :doc:`/commands/decimate` 命令。

``DELTA`` 选项和 ``NPTS`` 选项只能同时使用一个，若二者同时使用，
则命令中的后者起作用。

``BEGIN`` 选项用于控制输入数据的插值起点，也可以通过
:doc:`/commands/cut` 命令设置 ``b`` 和 ``e`` 再进行插值操作。

示例
----

假定 filea 是等间隔数据，采样间隔为 0.025 s，为了将转换到采样间隔为 0.02 s：

.. code-block:: bash

    SAC> r filea
    SAC> interp delta 0.02

由于新 ``delta`` 小于原数据 ``delta``\ ，可能会出现混叠现象，所以会输出警告信息。

假定 fileb 数据点数为3101，想要保持其时间跨度，并采样至4096个点：

.. code-block:: bash

    SAC> r fileb
    SAC> interp npts 4096

假设 filec 是不等间隔数据，为了将其转换为采样率为 0.01 s 的等间隔数据：

.. code-block:: bash

    SAC> read filec
    SAC> interpolate delta 0.01

头段变量
--------

delta、npts、e、b、leven
