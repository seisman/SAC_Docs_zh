数据命名规则
############


用 ``rdseed`` 程序从标准 SEED 格式中解压得到的 SAC 文件，通常都具有
固定格式的文件名。具体格式为：

::

        yyyy.ddd.hh.mm.ss.ffff.NN.SSSSS.LL.CCC.Q.SAC

其中

-  ``yyyy.ddd.hh.mm.ss.ffff`` 是 SAC 文件中第一个数据点对应的时间

   -  ``yyyy`` 为年；
   -  ``ddd`` 为一年的第多少天；
   -  ``hh.mm.ss`` 为时、分、秒；
   -  ``ffff`` 为毫秒；需要注意的是 :math:`1 s=1000 ms`\ ， 这里毫秒用了4位来表示。

-  ``NN`` 为台网名\ [1]_，长度不超过2个字符；
-  ``SSSSS`` 为台站名，长度不超过5个字符；
-  ``LL`` 为位置码，为空或两字符；
-  ``CCC`` 为通道名；
-  ``Q`` 为质量控制标识；
-  ``SAC`` 为文件后缀；

位置码
======

关于位置码的详细介绍，见
`IRIS: DS Newsletter: Vol. 1, No.1 <http://ds.iris.edu/ds/newsletter/vol1/no1/1/specification-of-seismograms-the-location-identifier>`_\ 。

位置码用于区分同一个台站下多个传感器的不同数据，或者同一个传感器传来的多个数据流。
通常来说，同一个台站不同位置码的两个地震数据具有极为相似但有略有不同的波形。

常见的位置码为空，偶尔会见到 ``00`` 、 ``01`` 、 ``10`` 这样的，也有遇到
``60`` 这样的。

质量控制
========

质量控制符 ``Q`` 用于表征当前SAC数据的数据质量。该标识符可以取如下四种：

-  ``D`` 不确定状态的数据
-  ``M`` 已合并的数据
-  ``R`` 原始波形数据
-  ``Q`` 经过质量控制的数据

常见的质量控制符为 ``M`` 或 ``Q``\ 。

通道名
======

通道名用三个字符来表示，这三个字符分别代表了频带码（Band Code）、
仪器码（Instrument Code）和方位码（Orientation Code）。

频带码
------

频带码是通道名的第一个字符，代表了仪器的采样率以及响应频带等信息。

.. _table:bandcode:

.. table:: 频带码

   +-----------------+-----------------+-----------------+-----------------+
   | 频带码          | 频带类型        | 采样率（Hz）    | 拐角周期（sec） |
   +=================+=================+=================+=================+
   | F               | ...             | 1000-5000       | > 10            |
   +-----------------+-----------------+-----------------+-----------------+
   | G               | ...             | 1000-5000       | < 10            |
   +-----------------+-----------------+-----------------+-----------------+
   | D               | ...             | 250-1000        | < 10            |
   +-----------------+-----------------+-----------------+-----------------+
   | C               | ...             | 250-1000        | > 10            |
   +-----------------+-----------------+-----------------+-----------------+
   | E               | Extremely Short | 80-250          | < 10            |
   |                 | Period          |                 |                 |
   +-----------------+-----------------+-----------------+-----------------+
   | S               | Short Period    | 10-80           | < 10            |
   +-----------------+-----------------+-----------------+-----------------+
   | H               | High Broad Band | 80-250          | < 10            |
   +-----------------+-----------------+-----------------+-----------------+
   | B               | Broad Band      | 10-80           | > 10            |
   +-----------------+-----------------+-----------------+-----------------+
   | M               | Mid Period      | 1-10            | > 10            |
   +-----------------+-----------------+-----------------+-----------------+
   | L               | Long Period     | :math:`\approx` |                 |
   |                 |                 | 1               |                 |
   +-----------------+-----------------+-----------------+-----------------+
   | V               | Very Long       | :math:`\approx` |                 |
   |                 | Period          | 0.1             |                 |
   +-----------------+-----------------+-----------------+-----------------+
   | U               | Ultra Long      | :math:`\approx` |                 |
   |                 | Period          | 0.01            |                 |
   +-----------------+-----------------+-----------------+-----------------+
   | R               | Extremely Long  | 0.0001-0.001    |                 |
   |                 | Period          |                 |                 |
   +-----------------+-----------------+-----------------+-----------------+
   | P               | Order of 0.1 to | 0.00001-0.0001  |                 |
   |                 | 1 days          |                 |                 |
   +-----------------+-----------------+-----------------+-----------------+
   | T               | Order of 1 to   | 0.000001-0.0000 |                 |
   |                 | 10 days         | 1               |                 |
   +-----------------+-----------------+-----------------+-----------------+
   | Q               | Greater than 10 | < 0.000001      |                 |
   |                 | days            |                 |                 |
   +-----------------+-----------------+-----------------+-----------------+
   | A               | Administrative  | variable        | NA              |
   |                 | Instrument      |                 |                 |
   |                 | Channel         |                 |                 |
   +-----------------+-----------------+-----------------+-----------------+
   | O               | Opaque          | variable        | NA              |
   |                 | Instrument      |                 |                 |
   |                 | Channel         |                 |                 |
   +-----------------+-----------------+-----------------+-----------------+

仪器码
------

仪器码是通道名的第二个字符，代表了不同的仪器传感器。

.. table:: 仪器码
   :align: center

   ======== ===========================
   仪器码   说明
   ======== ===========================
   ``H``    High Gain Seismometer
   ``L``    Low Gain Seismometer
   ``G``    Gravimeter
   ``M``    Mass position Seismometer
   ``N``    Accelerometer
   ======== ===========================

常见的是高增益（H）仪器，记录地面运动速度。

方位码
------

方位码表示了传感器记录的地面运动的方向。地震学中常见的方位码有如下几种：

.. table:: 方位码
   :align: center

   =========== =========================================================
   方位码      说明
   =========== =========================================================
   ``N E Z``   南北向、东西向、垂向
   ``1 2 3``   3为垂向；1、2为水平方向，正交但与正东西、正南北向有偏离
   ``T R Z``   T为切向、R为径向，通常R方向是震中到台站的大圆连线方向
   =========== =========================================================

通常情况下，若仪器的方向与正东西方向的夹角小于2度时，方位码取为 ``E``\ ；
当与正东西方向夹角大于2度时，方位码取为 ``1`` 或 ``2``\ 。因而，方位码为 ``E``
并不意味着分量是正东西方向的，真实的分量方向应以 SAC 头段中的 ``cmpaz``
和 ``cmpinc`` 为准。更进一步，由于仪器放置过程中的技术问题，SAC 头段中的
``cmpaz`` 在某些情况下也会产生一定的误差。

.. [1] 所有永久或临时台网的台网名列表： http://www.fdsn.org/networks/
