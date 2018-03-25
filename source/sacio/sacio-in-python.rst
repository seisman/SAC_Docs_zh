Python脚本中的SAC I/O
=====================

ObsPy [1]_ 是用Python写的一个专用用于
地震学数据处理的模块，这一节介绍如何利用ObsPy模块读写SAC文件。

安装obspy
---------

obspy可以通过Python自带的模块管理工具pip来安装，目前obspy的最新版本为
0.10.2：

.. code:: console

    $ pip install obspy

读写SAC文件
-----------

下面的例子读取了当前目录下的多个SAC文件，对每个文件进行滤波，将滤波前后
的波形放在一张图上进行对比，最后将滤波后的数据写到文件中。

.. literalinclude:: obspy-example.py
   :language: Python

其他
----

ObsPy是一个相对完整的数据处理模块，SAC的读写只是其中的一小部分。个人
感觉，ObsPy在读写SAC文件时还存在如下几个问题：

-  Trace类中没有包含文件名的信息，导致无法用简单的办法将波形写回原 文件
-  无法只读取波形数据中的一小段，即没有实现cut的功能

除了obspy之外，其他人也写了一些用于读写SAC文件的模块，列举如下，可供参考：

#. https://github.com/eost/sacpy
#. https://github.com/emolch/pysacio

.. [1] http://www.obspy.org
