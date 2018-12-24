rotate
======

概要
----

将成对的正交分量旋转一个角度

语法
----

.. code-block:: bash

    ROTate [TO Gcp|TO v|THrough v] [Normal|Reversed]

输入
----

TO GCP
    旋转到大圆弧路径（“great circle path”）。两个分量必须都是水平分量且
    头段中必须定义台站和事件的经纬度

TO v
    旋转一定角度使得第一个分量的方位角为 ``v`` 度。两个分量必须都是水平分量

THROUGH v
    顺时针旋转 ``v`` 度。其中一个分量可以是垂直分量

NORMAL|REVERSED
    输出分量为正/负极性

缺省值
------

.. code-block:: bash

    rotate to gcp normal

说明
----

此命令可以对多对分量旋转一定的角度，内存中的每两个文件为一对分量。每对
分量必须拥有相同的台站名、事件名、采样率和数据点数，且头段变量 ``cmpaz``
和 ``cmpinc`` 必须定义，程序会检查两个分量是否正交（允许 :math:`0.02^\circ`
的偏差）。

``THROUGH`` 选项表示将一对正交分量旋转一定的角度。这对正交分量可以
均为水平分量（\ ``cmpinc=90``\ ）或包含一个垂直分量（\ ``cmpinc=0``\ ）。
其中，水平面内的旋转是相对于北向顺时针的角度；垂直面内的旋转是相对于垂直
向上方向的角度。

``TO`` 选项表示将一对正交分量旋转\ **到**\ 一定的角度（方位角），这对正交
分量必须都是水平分量（\ ``cmpinc=90``\ ）。对于 ``TO v`` 而言，
表示将一对分量旋转一定角度，使得旋转后的第一个分量沿着方位角 v 的方向； 对
``TO GCP`` 而言，首先根据台站和事件经纬度计算出反方位角，并将
分量旋转一定角度，使得旋转后的第一个分量沿着反方位角
:math:`\pm 180 ^\circ` 的方向，
此时第一个水平分量由事件位置指向台站位置，即地震学中的径向（Radial）分量，
一般方位码用 ``R`` 表示；第二个水平分量垂直于 ``R`` 分量，
即地震学的切向（Tangential）分量，一般方位码用 ``T`` 表示。

``NORMAL`` 和 ``REVERSED`` 用于指定输出分量的极性，仅用于一对
水平分量的旋转中。在 ``rotate`` 命令中，就一对水平分量而言，若第二个
分量比第一个分量超前 :math:`90^\circ`\ （可以理解为方位角大 :math:`90^\circ`\ ）
则称为正极性；若第二个分量比第一个分量落后 :math:`90^\circ`
则称为负极性。对于一对输入分量而言，无论是N分量
在前还是E分量在前均可，该命令会自动判断一对输入分量是正极性还是负极性，
并对旋转公式进行调整，\ ``NORMAL`` 和 ``REVERSED`` 仅用于控制一对
输出分量的极性。

示例
----

将一对水平分量旋转 :math:`30^\circ`\ ：

.. code-block:: bash

    SAC> dg sub tele ntkl.[ne]          # 内存中的顺序是E分量先于N分量
    SAC> lh cmpinc cmpaz

      FILE: /opt/sac/aux/datagen/teleseis/ntkl.e - 1
     ------------------------------------------

         cmpinc = 9.000000e+01
          cmpaz = 9.000000e+01

      FILE: /opt/sac/aux/datagen/teleseis/ntkl.n - 2
     ------------------------------------------

         cmpinc = 9.000000e+01
          cmpaz = 0.000000e+00
    SAC> rot through 30                 # 顺时针旋转30度
    SAC> lh

      FILE: /opt/sac/aux/datagen/teleseis/ntkl.e - 1
     ------------------------------------------

         cmpinc = 9.000000e+01
          cmpaz = 1.200000e+02

      FILE: /opt/sac/aux/datagen/teleseis/ntkl.n - 2
     ------------------------------------------

         cmpinc = 9.000000e+01
          cmpaz = 3.000000e+01

旋转两对水平分量到大圆弧路径：

.. code-block:: bash

    SAC> read abc.n abc.e def.n def.e
    SAC> rotate to gcp
    SAC> w abc.r abc.t def.r def.t

上面的例子中若头段变量 ``baz`` 为 :math:`33^\circ`\ ，则径向分量指向
:math:`213^\circ`\ ，切向分量指向 :math:`303^\circ`\ ，如果设置反极性，
切向分量指向 :math:`123^\circ`\ 。

头段变量
--------

cmpaz、cmpinc
