merge
=====

概要
----

将多个数据文件合并成一个文件

语法
----

.. code-block:: bash

    MERGE [Verbose] [Gap Zero|Interp] [Overlap Compare|Average] [filelist]

输入
----

VERBOSE
    合并数据时在终端显示合并的细节

GAP ZERO|INTERP
    如何处理数据间断。
    ``ZERO`` 表示将数据间断处补零值；
    ``INTERP`` 表示对数据间断处进行线性插值

OVERLAP COMPARE|AVERAGE
    如何处理数据重叠。
    ``COMPARE`` 表示对重叠的时间段内的数据进行比较，若不匹配则退出；
    ``AVERAGE`` 表示对重叠时间段内的数据进行平均

filelist
    SAC 二进制数据文件列表

说明
----

该命令用于将一系列时间上相邻的数据文件首尾相连合并成一个文件。在合并数据时，
会先检查要合并的文件是否有相同的 ``kstnm``\ 、\ ``knetwk``\ 、\
``kcmpnm``\ 、\ ``delta``\ 。

在 SAC v101.6 中完全重写了该命令，因而该命令的功能和语法与之前的版本有所不同。

在v101.6之前的版本中，\ ``merge`` 命令的用法与 :doc:`/commands/addf` 命令的
用法相似。该命令会将内存中的文件依次分别与 filelist 中的文件进行合并，且
内存中的文件的开始时刻必须早于 filelist 中的文件的开始时刻。因而在将多个数据
文件合并成一个文件时，只能先读取第一段数据，然后 ``merge`` 第二段数据，
再 ``merge`` 第三段数据，依次不断循环执行。

旧版本的 ``merge`` 命令用起来相对复杂。需要多次执行 ``merge`` 命令，且
需要用户自己判断波形文件的先后顺序。

v101.6之后的新版 ``merge`` 命令，会将内存中的全部数据文件以及 filelist 中的
全部文件合并成单个文件。若内存中无数据，则只合并 filelist 中的数据文件；
若 filelist 为空，则只合并内存中的数据文件。且新版的 ``merge`` 命令可以合并
任意数目和任意顺序的数据文件。

若要合并的数据段之间存在间断，可以通过补零或线性插值的方式弥补间断；若数据段之间
存在重叠，可对重叠的部分进行比较，判断重叠的区域内振幅是否匹配，或者直接进行振幅的平均。

示例
----

下面看一个数据合并的示例：

.. code-block:: bash

    SAC> read file1 file2
    SAC> merge file3 file4

在 v101.6 之前的版本中，本示例的运行结果是：file3 与 file1 合并成文件 file1，
file4 与 file2 合并成文件 file2，此时内存中有两个文件 file1 和 file2。
而在 v101.6 及其之后的版本中，这个例子的结果是，文件 file1、file2、file3、file4
合并成文件 file1，此时内存中只有一个文件 file1。这样的修改使得不同版本的语法
不兼容，但实际使用时新版的 ``merge`` 命令要更方便也更符合人的正常思维。

下面介绍几个新版本的 ``merge`` 命令的用法示例。

多个文件合并成单个文件的一种方法：

.. code-block:: bash

    SAC> r file1                        # 读取一个文件
    SAC> merge file2 file3 file4        # merge 其余文件
    SAC> w over

另一种合并办法：

.. code-block:: bash

    SAC> r file1 file2 file3 file4
    SAC> merge                      # 合并内存中的所有文件
    SAC> w over                     # 合并后的文件写入到 file1 中

再一种合并方法：

.. code-block:: bash

                                        # 内存中无数据
    SAC> merge file1 file2 file3 file4  # 合并 filelist 中的全部文件
    SAC> w over                         # 保存到 file1 中

头段变量改变
------------

npts、depmin、depmax、depmen、e

BUGS
----

-  ``filelist`` 不支持通配符（v101.6a）
