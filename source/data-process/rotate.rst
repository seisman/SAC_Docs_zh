分量旋转
========

相关命令：\ :doc:`/commands/rotate`

相关头段：\ ``cmpinc``\ 、\ ``cmpaz``

相关脚本： :ref:`Perl 脚本 <subsec:rotate.pl>` 、 :ref:`Python 脚本 <subsec:rotate.py>`

三个正交的地震传感器即可完全记录地面运动矢量。因此可以将三个正交的
分量任意旋转到其它三个正交的方向上。

出于仪器安装的考虑，地震仪三分量一般都是N、E、U向的。而地震学里，
由于SH波与P-SV波的解偶，更常处理的是R、T、Z向的三分量数据。因而地震
信号的旋转是有必要的。

SAC提供了 :doc:`/commands/rotate`
命令，用于旋转任意两个相互正交的分量。 旋转前，SAC会检查两个分量的
``cmpinc`` 和 ``cmpaz``\ ，以确 定两个分量是正交的。

.. code:: bash

    SAC> dg sub teleseis ntkl.[enz]
    /opt/sac/aux/datagen/teleseis/ntkl.e ...ntkl.n ...ntkl.z
    SAC> w ntkl.e ntkl.n ntkl.z
    SAC> r ./ntkl.n ./ntkl.e
    SAC> lh cmpinc cmpaz
      FILE: ./ntkl.n - 1
     --------------
         cmpinc = 9.000000e+01
          cmpaz = 0.000000e+00
      FILE: ./ntkl.e - 2
     --------------
         cmpinc = 9.000000e+01
          cmpaz = 9.000000e+01
    SAC> rotate to gcp              // 旋转到大圆路径
    SAC> lh cmpinc cmpaz
      FILE: ./ntkl.n - 1
     --------------
         cmpinc = 9.000000e+01
          cmpaz = 2.440466e+01
      FILE: ./ntkl.e - 2
     --------------
         cmpinc = 9.000000e+01
          cmpaz = 1.144047e+02
    SAC> w ntkl.r ntkl.t            // 保存为R分量和T分量

在 :numref:`figure:rotate` 中，左图从上至下为N、E、Z分量，右图从上至下
为R、T、Z分量。旋转到R、T分量后，可以很容易地识别出Rayleigh和Love波。

读入两个水平分量时，读入的顺序不重要，不管是先读N分量还是先读E分量，
旋转后始终是R分量在前，T分量在后。

.. _figure:rotate:

.. figure:: /images/rotate.*
   :alt: 将N、E分量旋转到R、T分量。
   :width: 95.0%
   :align: center

   将N、E分量旋转到R、T分量。
