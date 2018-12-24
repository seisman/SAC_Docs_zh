transfer
========

概要
----

反卷积以去除仪器响应，如果需要，还可以卷积其他仪器响应

语法
----

.. code-block:: bash

    TRANSfer [FROM type [options]] [TO type [options]] [FREQlimits f1 f2 f3 f4]
        [PREWHitening ON|OFF|n]

输入
----

FROM type
    要去除的仪器响应类型

TO type
    要加入的仪器响应类型

FREQLIMITS f1 f2 f3 f4
    压制大于 ``f4`` 以及低于 ``f1``\ 的频段

PREWHITENING ON|OFF|n
    预白化处理

缺省值
------

.. code-block:: bash

    trans from none to none

说明
----

FROM and TO
~~~~~~~~~~~

``transfer`` 命令的作用是将波形数据从一种仪器响应转换成另一种仪器
响应。\ ``FROM type`` 指定要从波形数据中去除的仪器响应，\ ``TO type``
指定了要加入到波形数据中的仪器响应。去仪器响应即反卷积，加仪器响应即卷积，
二者分别通过谱域的除法和乘法完成。

``type`` 为仪器类型，可以是 SAC 预定义的标准仪器类型（见附录中表
:ref:`table:instrument-type`\ ），还可以是如下几种特殊的“仪器类型”：

- ``none``: 表示“位移”
- ``vel``: 表示“速度”
- ``acc``: 表示“加速度”
- ``evalresp``: 表示使用 RESP 仪器响应文件
- ``polezero``: 表示使用 SAC PZ 仪器响应文件
- ``fap``: 表示使用 fap 仪器响应文件

``tranfser`` 命令的默认值是“``transfer from none to none``”，
即默认的输入和输出“仪器类型”都是位移。因而当不指定 ``FROM type`` 或
``TO type`` 时，SAC 会假定仪器类型为 ``NONE``\ 。

-  若输出的仪器类型为 ``NONE``\ ，即表示从波形中去除仪器响应得到
   位移，此时 SAC 头段中的 IDEP 设置为 ``IDISP``\ ，单位为 nm， 若输出类型为
   ``VEL`` 或 ``ACC``\ ，同理；
-  若输出的仪器类型不是 ``NONE``\ 、\ ``VEL`` 或 ``ACC``\ ，
   则内存中的波形会卷积上 ``TO type`` 所指定的仪器响应；
-  若不指定 ``FROM`` 选项，则假定原始波形数据是位移，且不会去除
   仪器响应；通常用于给理论地震图添加仪器响应；

freqlimits
~~~~~~~~~~

``freqlimits`` 用于在去除仪器响应时对波形的低频和高频部分进行压制。
当 ``TO type`` 为 ``NONE``\ 、\ ``VEL`` 或 ``ACC``\ 时，
必须使用该选项，且必须认真选择合适的参数。

所有地震仪在零频率处都具有零响应，在只进行反卷积时，需要在频率域做谱的
除法，此时可能会除以一个很小的值进而导致低频处有很大的谱振幅；在高频处，
信噪比通常很低，因而有必要对其响应进行压制。

``freqlimits`` 会在去仪器响应时对频谱做低通和高通尖灭，以实现对高频
和低频的压制。四个频率参数应满足 ``f1<f2<f3<f4``\ ，即尖灭函数在零到
``f1`` 之间为0，\ ``f1`` 到 ``f2`` 之间从0渐渐变成1，在 ``f2`` 和 ``f3``
之间保持为1，在 ``f3`` 到 ``f4`` 之间从1渐渐变成0，大于 ``f4``
的频段值为0。过渡带内分别为余弦波的四分之一周期。如下图所示：

.. figure:: /images/freqlimits.*
   :alt: Freqlimits 尖灭函数
   :width: 90.0%
   :align: center

   Freqlimits 尖灭函数

四个频率参数除了要满足 ``f1<f2<f3<f4`` 外，还应注意如下几条原则：

-  ``f4`` 应小于 Nyquist 采样率。比如若数据的采样周期为 0.01 s，
   则 Nyquist 采样率为 50 Hz，因而 ``f4`` 应小于 50 Hz
-  ``f3`` 不能与 ``f4`` 太接近
-  ``f2`` 与 ``f3`` 之间应尽可能宽，然后再根据具体需求进行滤波
-  ``f1`` 和 ``f2`` 不能太接近；
-  ``f1`` 的选取由具体需求决定，可以尝试不同的值并查看去仪器响应
   之后的效果来决定

若想要一个低通滤波器但在低频处不滤波，可以设置 ``f1=-2`` 和
``f2=-1``\ ； 若想要一个高通滤波器但在高频处不滤波，可以设置 ``f3``
等于Nyquist频率， ``f4`` 为 Nyquist 频率的两倍。

需要注意，该滤波器是零相位、非因果滤波器，因而，若数据点数不为2的指数幂次，
会导致在频段 ``(f1,f4)`` 之外振幅不完全为0。若想要数据点数为2的幂次方，
可以参考 SAC 中的 :doc:`/commands/cut` 命令。

prewhitening
~~~~~~~~~~~~

``prewhitening`` 用于控制数据的预白化。预白化可以将输入时间序列在
变换到频率域之前，进行谱的平化。这会减小谱值的动态范围，并提高数据在高频
的计算精度。参见 :doc:`/commands/whiten` 命令。打开预白化选项，会在谱操作
之前在频率域进行谱白化，并在谱操作后在时间域做谱白化的补偿，也可以设置
预白化选项的阶数。默认情况下，预白化选项是关闭的，阶数为 ``n=6``\ 。

示例
----

内置仪器类型
~~~~~~~~~~~~

SAC中内置了一堆预定义的仪器类型，可以在命令中直接使用。

从数据中去除 LLL 宽频带仪器响应。并卷积上 SRO 仪器响应，且对频带做尖灭及预白化：

.. code-block:: bash

    SAC> read abc.z
    SAC> rmean; rtr; taper
    SAC> trans from lll to sro freq .02 .05 1. 2. prew 2

当前的仪器类型为 RSTN 的子类型 nykm.z，为了去除该仪器响应并卷积上 DSS 仪器响应：

.. code-block:: bash

    SAC> read nykm.z
    SAC> rmean; rtr; taper
    SAC> trans from rstn subtype nykm.z to dss prew off

将电磁仪器响应转换成位移：

.. code-block:: bash

    SAC> r XYZ.Z
    SAC> trans from elmag freep 15. mag 750. to none

从波形中去除 WWSP 的仪器响应，得到位移波形：

.. code-block:: bash

    SAC> read xyz.z
    SAC> rmean; rtr; taper
    SAC> trans from WWSP to none freq 0.05 0.01 5 10
                    # 也可使用 to vel 或 to acc 得到速度或加速度

向合成的位移地震图中加入 WWSP 仪器响应：

.. code-block:: bash

    SAC> r syn.z
    SAC> trans from none to WWSP    # 简写为 trans to WWSP

evalresp 类型
~~~~~~~~~~~~~

``evalresp`` 类型并不代表真正意义上的仪器类型，而是表示从 RESP 仪器响应文件中
读取仪器响应信息。在使用 ``evalresp`` 选项时， :doc:`/commands/transfer`
依次从当前内存中的 SAC 波形数据中提取出各自的
头段信息，包括：\ ``kstnm``\ 、\ ``kcmpnm``\ 、\ ``kzdate``\ 、
``kztime``\ 、\ ``knetwk`` 和 ``locid``\ ，然后会在当前目录下
寻找文件名为“``RESP.<NET>.<STA>.<LOCID>.<CHN>``”的RESP文件
（比如“RESP.IU.COLA..BHZ”），并检测 RESP 文件中给出的台站信息是否与数据
中的台站信息匹配\ [1]_。

.. code-block:: bash

    SAC> r 2006.253.14.30.24.0000.TA.N11A..LHZ.Q.SAC
    SAC> rtr; rtr; taper
    SAC> trans from evalresp to none freq 0.004 0.007 0.2 0.4

该命令会首先从头段中提取台站信息，然后自动在当前目录下寻找文件
``RESP.TA.N11A..LHZ``\ ，一旦文件中的台站信息与数据中的台站信息匹配，
则使用该响应函数。

SAC 数据中的头段信息可以用一些选项来覆盖：

::

        STATION, CHANNEL, NETWORK, DATE, TIME, LOCID, FNAME

每个选项都必须有一个合适的值。若 ``DATE`` 在 SAC 头段中未设定且在选项
中未指定，则使用当前系统日期，\ ``TIME`` 同理；若 ``NETWORK``\ 未
指定，则默认使用任意台网名；若 ``LOCID`` 或 ``KHOLE`` 未指定，
则默认使用任意 LOCID。

假设台网 IU 的所有台站都具有完全相同的仪器响应函数，而此时你只有 COLA 台站的
RESP文件 ``RESP.IU.COLA..BHZ``\ 。为了给所有台站去除仪器响应，一种
办法是对 IU 台网的每一个台站复制一份 ``RESP.IU.COLA..BHZ``\ ，重命名，
并修改 RESP 文件中的台站信息。显然，这样很麻烦，利用上面的选项可以大大简化
这一过程：

.. code-block:: bash

    SAC> r *.IU.*.BHZ
    SAC> rmean; rtr; taper
    SAC> trans from evalresp STATION COLA to none freq 0.01 0.02 5 10

使用 ``STATION`` 选项覆盖了波形数据中的台站名，此时，对每一个波形数据，
``transfer`` 命令都会去使用 ``RESP.IU.COLA..BHZ``\ [2]_。

下面的命令会将三分量数据去仪器响应，并卷积上 BHZ 分量的仪器响应：

.. code-block:: bash

    SAC> r *.IU.COLA.00.BH?
    SAC> rmean; rtr; taper
    SAC> trans from evalresp to evalresp CHANNEL BHZ

操作完成后，BHZ 分量相当于没有进行操作，BH1 和 BH2 则去除了原本的仪器响应
并卷积上 BHZ 的仪器响应。

为了显示 IU 台网 COL 台站 BHZ通道，1992年01月02日16:42:05的仪器响应：

.. code-block:: bash

    SAC> fg impulse npts 16384 delta .05 begin 0.
    SAC> trans to evalresp sta COL cha BHZ net IU \
                        date 1992/2 time 16:42:05
    SAC> fft
    SAC> psp am

如果你的 RESP 文件名与 SAC 的标准格式不同，可以使用 ``FNAME`` 选项强制
指定要使用的 RESP 文件：

.. code-block:: bash

    SAC> r 2006.253.14.30.24.0000.TA.N11A..LHZ.Q.SAC
    SAC> rmean; rtr; taper
    SAC> trans from evalresp fname /tmp/Resp/RESP.TA.N11A..LHZ to none \
                            freq 0.004 0.007 0.2 0.4

``transfer`` 命令默认会使用 ``RESP.TA.N11A..LHZ`` 作为响应文件，
此处使用 ``FNAME`` 选项强制指定使用 ``/tmp/RESP/RESP.TA.N11A..LHZ``\ 。
需要注意的是，即便是使用 ``FNAME`` 强制指定了 RESP 文件，该命令还是
会检测台站信息是否匹配。

由于一个 RESP 文件中可以包含多个响应函数，因而可以将所有仪器响应文件合并到
一个总的 RESP 文件中：

.. code-block:: bash

    SAC> r *.SAC
    SAC> rmean; rtr; taper
    SAC> transfer from evalresp fname RESP.ALL to none freq 0.1 0.2 5 10

这个例子中，\ ``RESP.ALL`` 包含了所有数据的响应函数，\ ``transfer``
命令会读取 ``RESP.ALL`` 文件的内容，对于每一个波形数据，会从波形
数据中提取出台站信息，并与 ``RESP.ALL`` 中的众多响应函数进行匹配，
若匹配成功，则使用该响应函数。

polezero 类型
~~~~~~~~~~~~~

``polezero`` 类型并不代表真正意义上的仪器类型，而是表示从 SAC 零极点
文件中读取仪器响应函数。

polezero 类型会从数据波形中提取台站信息，但不会根据台站信息去寻找默认的
PZ 文件，用户必须使用 ``subtype`` 来指定要使用的 PZ 文件。若 PZ 文件
有注释行，则注释行中的台站信息必须与波形中的台站信息匹配，才能正确执行；
若 PZ 文件中无注释行，则不进行台站信息匹配的检测，直接执行。

.. code-block:: bash

    SAC> r *IU.COLA.BHZ
    SAC> rmean; rtr; taper
    SAC> trans from polezero subtype SAC_PZs.IU.COLA.BHZ to WWSP

一个 PZ 文件中可以包含多台站、多通道、多时间段的响应函数。可以将所有数据的
PZ 文件合并得到总的PZ文件。下面的例子中读入全部波形数据，并利用总 PZ 文件
进行去仪器响应：

.. code-block:: bash

    SAC> r *.SAC          # 读入全部数据
    SAC> rmean; rtr; taper
    SAC> trans from polezero s event.pz to none freq 0.05 0.1 10.0 15.0
    SAC> mul 1.0e9        # 需要乘以1.0e9 !!!
    SAC> w over

需要格外注意，在用 PZ 文件去仪器响应得到位移物理量时，得到的数据的单位是 m，
而 SAC 中默认的单位是 nm，因而需要将数据乘以 ``1.0e9`` 将数据的单位转换成 nm。
对于转换得到速度或加速度，同理。

fap 选项
~~~~~~~~

fap 选项表明使用 FAP 文件作为响应函数。

假设有 fapfile 文件 ``fap.n11a.lhz_0.006-0.2``\ ，其名字表示频率段为
0.006 Hz 到 0.2 Hz，要从波形 ``2006.253.14.30.24.0000.TA.N11A..LHZ.Q.SAC``
中移除该仪器响应：

.. code-block:: bash

    SAC> r 2006.253.14.30.24.0000.TA.N11A..LHZ.Q.SAC
    SAC> rtr
    SAC> taper
    SAC> trans from fap s fap.n11a.lhz_0.006-0.2 to none freq 0.004 0.006 0.1 0.2
    SAC> mul 1.0e9

.. [1] 即，要求 RESP 文件名以及 RESP 文件中的台站信息都与数据头段中的台站信息匹配
.. [2] 这里假定所有台站的 LOCID 都是未定义的
