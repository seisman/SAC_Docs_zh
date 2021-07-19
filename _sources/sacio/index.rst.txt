SAC I/O
#######

SAC 提供的命令可以帮助用户实现地震数据的预处理，但无法实现所有的数据
分析功能。日常科研中会需要自己写一套算法对数据进行处理，以得到想要的
结果。这就需要能够在自己的程序中读写 SAC 文件，即 SAC I/O。

根据 SAC 格式的定义，SAC 格式文件分为固定长度的头段区和非固定长度的数据区，
通常的做法是先读入头段区，然后从中提取出数据点数等信息，然后再据此读入
数据区，由此即可实现 SAC 数据的读写。

这一章将介绍如何在 C、Fortran、Matlab、Python、Julia 中读写 SAC 文件。

.. toctree::

   sacio-in-c
   sacio-in-fortran
   sacio-in-matlab
   sacio-in-python
   sacio-in-julia
