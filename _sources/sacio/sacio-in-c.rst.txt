C 程序中的 SAC I/O
==================

SAC 自带的函数库中提供了一系列用于读写 SAC 文件的子函数，具体细节可以参考
一节，这些子函数可以直接在 C 程序中调用。但这些子函数用起来不太方便，比如：

-  函数参数太多太复杂，有些参数基本不会用到，但还是需要定义；
-  读文件时无法只读取部分文件，即没有截窗的功能；
-  要获取某个头段变量的值，必须单独调用相应的子函数；

在了解了 SAC 文件的具体格式后，可以很容易的写一套函数来实现 SAC 文件的读写。

Prof. Lupei Zhu 实现了一套相对比较易用的 SAC I/O 函数库，可以在 C 或 Fortran
程序中直接调用，姑且称之为 ``sacio``\ 。

``sacio`` 函数库与 Prof. Lupei Zhu 的其他程序一起发布。你可以从 Prof. Lupei Zhu
的主页下载 ``fk``\ [1]_\ 软件包，并从中提取出源文件 ``sac.h`` 和 ``sacio.c``\ 。

``sacio`` 简单易用，但也存在一些潜在的 Bug 及缺陷。seisman 在 ``sacio`` 的基础上
重写了 SAC I/O 函数库以及 SAC 相关工具，项目地址为
https://github.com/seisman/SACTools\ ，仅供有兴趣的读者参考。

sacio 函数接口
--------------

``sac.h`` 中 SAC 格式的头段区被定义为 ``SACHEAD`` 类型的结构体，
每一个头段变量都是结构体的成员。\ ``sacio.c`` 定义了一系列用于读写
SAC 文件的函数，\ :numref:`table:sacio-function` 中列出了 ``sacio``
提供的函数接口。

.. _table:sacio-function:

.. table:: ``sacio`` 函数列表

   ================= =========================
   函数名            功能
   ================= =========================
   ``read_sachead``  仅读取 SAC 文件的头段部分
   ``read_sac``      读取整个 SAC 文件
   ``read_sac2``     读取 SAC 文件中一部分
   ``write_sac``     将数据写到 SAC 文件中
   ``sachdr``        初始化 SAC 头段
   ================= =========================

调用 SAC I/O 接口的程序，可以通过如下方式编译：

.. code-block:: console

    $ gcc -c sacio.c
    $ gcc -c prog.c
    $ gcc sacio.o prog.o -o prog -lm

写成 Makfile 会更简单一些：

.. code-block:: make

    all: prog clean

    prog: sacio.o prog.o
        $(CC) -o $@ $^ -lm

    clean:
        -rm *.o

读写 SAC 文件
-------------

下面的示例展示了如何在 C 程序中读取一个 SAC 二进制文件，经过简单的数据处理后，
最后写回到原文件中：

.. literalinclude:: readsac.c
   :language: C

``read_sac`` 函数将 SAC 文件的头段区保存到结构体 ``SACHEAD hd`` 中，
可以通过 ``hd.npts``\ 、\ ``hd.delta`` 这样的方式引用 SAC 头段变量的值。
SAC 文件的数据区保存到指针/数组 ``float *data`` 中，\ ``read_sac`` 会根据
头段中的数据点数为指针 ``data`` 分配内存空间并读入数据，在用完
之后要记得用 ``free(data)`` 释放已分配的内存，以避免内存泄露。

仅读取 SAC 头段区
-----------------

有时候只需要 SAC 文件头段区的一些信息，若读取整个文件就有些浪费了，
``read_sachead`` 仅读取 SAC 头段区而不读取数据区。

.. literalinclude:: readsachead.c
   :language: C

读 SAC 数据的一段
-----------------

有些时候，数据可能很长，但用户只需要其中的一小段。为了读取一小段数据
而把整个文件都读入进去实在太浪费了。SAC 中的 :doc:`/commands/cut`
命令可以实现数据的截取，\ ``read_sac2`` 则是实现了类似的功能。下面的例子截取了
数据中以 ``T0`` 为参考的 :math:`-0.5` 到 :math:`2.5` 秒，即相当于
``cut t0 -0.5 2.5``\ 。

.. literalinclude:: readsac2.c
   :language: C

``read_sac2`` 与 ``read_sac`` 相比，多了三个用于定义时间窗的参数，其中 ``tmark``
表示参考时间标记，可以取值为：

- ``-5``\ ：以 ``B`` 作为时间标记
- ``-3``\ ：以 ``O`` 作为时间标记
- ``-2``\ ：以 ``A`` 作为时间标记
- ``0–9``\ ：以 ``T0-T9`` 中的某个为时间标记

这里只读入了数据的一小部分数据，但子程序中对头段中的 ``b``\ 、\ ``e``\ 、\ ``npts``
等做了修改，因而返回的头段与数据是相互兼容的。

.. note::

   tmark 的有效取值为什么是-5、-3、-2、0-9？

   在头段区中，若以 T0 作为参考位，T3 是 T0 后的第 3 个变量，T7 是 T0 后
   的第 7 个变量，B 是 T0 前的第 5 个变量， O 是 T0 前的第 3 个变量。

   ``sacio.c`` 的代码中使用了 ``tref = *((float *)hd + 10 + tmark)``
   来获取某个时间头段变量的值。首先将结构体指针 ``hd`` 强制转换成 ``float`` 型，
   加上 ``10`` 使得指针指向结构体的成员 ``T0`` 所在的位置，然后
   ``tmark`` 取不同的值，则将指针相应地前移或后移
   相应的浮点变量，最后取指针所在位置的浮点变量值。由此即可很简单地获取某个
   时间标记头段中的值。这种用法在自己的程序中也会经常用到。

从零创建 SAC 文件
-----------------

在做合成数据时，经常需要从无到有完全创建一个SAC文件。这相对于一般的
“读\ :math:`\rightarrow`\ 处理\ :math:`\rightarrow`\ 写”而言要更复杂一些，
因为必须首先构建一个基本的头段区。下面的例子展示了如何用 ``sachdr`` 构建一个
最基本的头段区，并填充其他一些头段，最后将创建的头段及数据写入到文件中。

.. literalinclude:: writesac.c
   :language: C

.. [1] http://www.eas.slu.edu/People/LZhu/downloads/fk3.2.tar
