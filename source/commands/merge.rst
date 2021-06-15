merge
=====

概要
----

将多个数据文件合并成一个文件

语法
----

.. code-block:: console

    MERGE [Verbose] [Gap Zero|Interp] [Overlap Compare|Average]
        [TOLerance_delta v] [filelist]

输入
----

VERBOSE
    合并数据时在终端显示合并的细节

GAP ZERO|INTERP
    设置出现数据间断时的处理方式。
    ``ZERO`` 表示将数据间断处补零值；
    ``INTERP`` 表示对数据间断处进行线性插值

OVERLAP COMPARE|AVERAGE
    设置出现数据重叠时的处理方式。
    ``COMPARE`` 表示对重叠的时间段内的数据进行比较，若不完全相同则不合并；
    ``AVERAGE`` 表示对重叠时间段内的数据进行平均

TOLERANCE_DELTA v
    将要合并的前后文件的时间间隔（calc_delta）和头段变量\ ``delta``\ 可能不相同。
    如果二者的差的绝对值大于了 TOLERANCE_DELTA，将按照出现数据间断或重叠进行处理，
    否则当作是数值计算误差处理。
    TOLERANCE_DELTA 的默认值是 1e-6

filelist
    SAC 二进制文件列表

说明
----

该命令用于将一系列时间上相邻的 SAC 文件首尾相连合并成一个文件。
``merge`` 命令会尝试将已经读取的全部文件和 filelist 中的全部文件合并成一个 SAC 文件。
若没有已读取的文件，则只合并 filelist 中的文件；若 filelist 为空，则只合并已读取的文件。
``merge`` 命令可以合并任意数目和任意顺序的数据文件。

在合并前，``merge`` 命令会先检查这些文件的头段变量 
\ ``kstnm``\ 、\ ``knetwk``\ 、\ ``kcmpnm``\ 和 \ ``delta``\ 是否相同。
如果不完全相同，SAC 会报错，因为在物理上这四个头段变量不同的文件不应该合并。

除了进行头段变量的检查外，``merge`` 命令还会检查数据在时间上是否存在间断（GAP）、重叠（OVERLAP）等问题。
将要合并的、时间上相邻的前后两个文件之间是存在时间间隔的，
即前一个文件的最后一个采样点和后一个文件的第一个采样点之间存在时间间隔。
理想情况下，这个时间间隔应该和头段变量 \ ``delta``\ 相等。
然而，实际情况二者可能不想等。如果二者的差异不大于 TOLERANCE_DELTA 给定的值（或其默认值），
SAC 会认为二者没有差异，即便有也是数值计算造成的。
当 SAC 文件的采样很高，或者数据的总持续时间很长就会出现这样的情况。
如果二者差异大于了 TOLERANCE_DELTA 给定的值（或其默认值），
SAC 会认为数据存在间断（GAP）或重叠（OVERLAP），会按照GAP或OVERLAP两个选项进行处理。

.. code-block:: console

    SAC> merge verbose *.SAC # 使用了 VERBOSE 选项，会显示相关细节
      merge calculating delta
      merge calculated delta: 4.000000000000000e-03 (assuming no-gaps)
            delta in header 4.000000189989805e-03 (first file)
            difference: 1.899898e-10 = abs( calc_delta - delta )
            tolerance:  1.000000e-06
            using calulcted delta
      merging 24 files => 3600000 data points

在上面的例子中，
因为 calc_delta，即前文说的文件间的时间间隔和 \ ``delta``\ 的差的绝对值小于 TOLERANCE_DELTA，
因此 SAC 认为差异是数值计算误差。
相反，如果 TOLERANCE_DELTA 设置为 0，即只要 calc_delta 和 \ ``delta``\ 不完全相同
就会被当作是重叠或间断来处理：

.. code-block:: console

    SAC> r *.SAC
    SAC> merge verbose tol 0.0
      merging 24 files => 3599999 data points
      merge: Gap zero fill: [n: 899999 t: 3599.996171]
      merge: Gap zero fill: [n: 1049999 t: 4199.996199]
      .....

在 SAC 的源代码中，calc_delta 等于所有文件间时间间隔的平均值。

示例
----
下面介绍使用 ``merge`` 命令的几种形式：

合并内存中的所有数据

.. code-block:: console

    SAC> r file1 file2 file3 file4
    SAC> merge
    SAC> w over

合并 ``merge`` 命令的文件列表内的文件

.. code-block:: console

    SAC> merge file1 file2 file3 file4
    SAC> w over

同时合并内存中已有的文件和 ``merge`` 命令的文件列表的文件

.. code-block:: console

    SAC> r file1 file2
    SAC> merge file3 file4
    SAC> w over

头段变量改变
------------

npts、depmin、depmax、depmen、e

BUGS
----

-  101.6a 版的 ``merge`` 命令的文件列表不支持通配符，但 102.0 版已修正。
