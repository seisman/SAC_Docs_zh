Python 中的 SAC I/O
===================

ObsPy
-----

`ObsPy <http://www.obspy.org>`_ 是用 Python 写的一个专用用于地震学数据处理的模块，这一节介绍如何
利用 ObsPy 模块读写 SAC 文件。

安装 obspy
++++++++++

obspy 可以通过 Python 自带的模块管理工具 pip 来安装：

.. code-block:: console

    $ pip install obspy

读写 SAC 文件
+++++++++++++

下面的例子读取了当前目录下的多个 SAC 文件，对每个文件进行滤波，将滤波前后
的波形放在一张图上进行对比，最后将滤波后的数据写到文件中。

.. literalinclude:: obspy-example.py
   :language: Python

obspy目前存在的问题
+++++++++++++++++++

ObsPy 是一个相对完整的数据处理模块，SAC 的读写只是其中的一小部分。个人感觉，
ObsPy 在读写 SAC 文件时还存在如下几个问题：

-  Trace 类中没有包含文件名的信息，导致无法用简单的办法将波形写回原文件
-  无法只读取波形数据中的一小段，即没有实现 cut 的功能

其他
----

除了 obspy 之外，其他人也写了一些用于读写 SAC 文件的模块，列举如下，可供参考：

#. https://github.com/pysmo/pysmo
#. https://github.com/eost/sacpy
#. https://github.com/emolch/pysacio
