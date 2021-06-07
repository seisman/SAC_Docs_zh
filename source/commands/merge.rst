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
    如何处理数据间断。
    ``ZERO`` 表示将数据间断处补零值；
    ``INTERP`` 表示对数据间断处进行线性插值

OVERLAP COMPARE|AVERAGE
    如何处理数据重叠。
    ``COMPARE`` 表示对重叠的时间段内的数据进行比较，若不匹配则退出；
    ``AVERAGE`` 表示对重叠时间段内的数据进行平均

TOLERANCE_DELTA v
    将要合并的前后文件的时间间隔（calc_delta）和头段变量\ ``delta``\ 可能不相同。
    如果二者的差的绝对值大于了TOLERANCE_DELTA，将按照出现数据间断或重叠进行处理，
    否则当作是数值计算误差处理。
    TOLERANCE_DELTA 的默认值是 1e-6

filelist
    SAC 二进制数据文件列表

说明
----

该命令用于将一系列时间上相邻的数据文件首尾相连合并成一个文件。在合并数据时，
会先检查要合并的文件是否有相同的 ``kstnm``\ 、\ ``knetwk``\ 、
\ ``kcmpnm``\ 、\ ``delta``\ 。

``merge`` 命令会尝试将内存和 filelist 中的全部文件合并成单个文件。
若内存中无数据，则只合并 filelist 中的数据文件；若 filelist 为空，则只合并内存中的数据文件。
``merge`` 命令可以合并任意数目和任意顺序的数据文件。

若要合并的数据之间存在间断，可以通过补零或线性插值的方式弥补间断；若数据之间
存在重叠，可对重叠的部分进行比较，判断重叠的区域内振幅是否匹配，或者直接进行振幅的平均。

TOLERANCE_DELTA
----------------

时间上相邻的前、后两个文件在合并的时候，SAC 会计算所谓的 calc_delta.
calc_delta 等于前一个文件的最后一个采样点和后一个文件的第一个采样点之间的时间间隔。
不难理解，calc_delta 在理想情况下等于数据的采样间隔，即头段变量\ ``delta``\。
然而，当数据具有高采样率和（或）长持续时间的时候，
calc_delta 可能因为数值计算精度的原因而和\ ``delta``\不完全相等。
当 calc_delta 和 \ ``delta``\ 的差的绝对值不大于 TOLERANCE_DELTA 时，
SAC 会认为二者的差异是数值计算误差，将修正后一个文件的开始时刻 \ ``b``\，让二者相等。
当 calc_delta 和 \ ``delta``\ 的差的绝对值大于 TOLERANCE_DELTA 时，
SAC 会按照文件之间存在重叠（overlap）或者间断（gap）来处理。

如果使用了 VERBOSE 选项，``merge``命令会显示相关细节：

.. code-block:: console

    SAC> merge verbose *.SAC
      merge calculating delta
      merge calculated delta: 4.000000000000000e-03 (assuming no-gaps)
            delta in header 4.000000189989805e-03 (first file)
            difference: 1.899898e-10 = abs( calc_delta - delta )
            tolerance:  1.000000e-06
            using calulcted delta
      merging 24 files => 3600000 data points

在上面的例子中，因为 calc_delta 和 \ ``delta``\ 的差的绝对值小于 TOLERANCE_DELTA，
因此 SAC 认为相关差异是计算精度造成的。
相反，如果 TOLERANCE_DELTA 设置为 0，即只要 calc_delta 和 \ ``delta``\ 不完全相同
就会被当作是重叠或间断来处理：

.. code-block:: console

    SAC> r *.SAC
    SAC> merge verbose tol 0.0
      merging 24 files => 3599999 data points
      merge: Gap zero fill: [n: 899999 t: 3599.996171]
      merge: Gap zero fill: [n: 1049999 t: 4199.996199]
      .....

示例
----

下面看一个数据合并的示例：

.. code-block:: console

    SAC> read file1 file2
    SAC> merge file3 file4

这个例子的结果是，文件 file1、file2、file3、file4
合并成文件 file1，此时内存中只有一个文件 file1。

下面介绍几个 ``merge`` 命令的用法示例。

多个文件合并成单个文件的一种方法：

.. code-block:: console

    SAC> r file1                        # 读取一个文件
    SAC> merge file2 file3 file4        # merge 其余文件
    SAC> w over

另一种合并办法：

.. code-block:: console

    SAC> r file1 file2 file3 file4
    SAC> merge                      # 合并内存中的所有文件
    SAC> w over                     # 合并后的文件写入到 file1 中

再一种合并方法：

.. code-block:: console

                                        # 内存中无数据
    SAC> merge file1 file2 file3 file4  # 合并 filelist 中的全部文件
    SAC> w over                         # 保存到 file1 中

头段变量改变
------------

npts、depmin、depmax、depmen、e
