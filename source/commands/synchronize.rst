synchronize
===========

概要
----

同步内存中所有文件的参考时刻

语法
----

.. code-block:: bash

    SYNChronize [Round ON|OFF] [Begin ON|OFF]

输入
----

ROUND ON
    打开 ``ROUND``\ 选项。若打开该选项，则会对每个文件的
    开始时间做微调以使得开始时间是采样间隔的整数倍

ROUND OFF
    关闭 ``ROUND`` 选项

BEGIN ON
    设置每个文件的开始时间为0

BEGIN OFF
    保持参考时间的绝对时刻不变

缺省值
------

.. code-block:: bash

    synchronize round off begin off

说明
----

该命令用于同步内存中所有文件的参考时刻。通过检查所有文件的参考时间和文件
起始时间（B），找到所有文件中最晚的文件起始时刻，并取该时刻作为内存中
所有文件共同的参考时刻，最后再计算每个文件中所有相对时间相对于新参考时刻
的值。

当数据文件具有不同的参考时刻时，对数据使用 :doc:`/commands/cut` 或
:doc:`/commands/xlim` 命令就会有些麻烦，因而可以使用该命令使得所有数据的
参考时刻一致。

如果使用了 ``BEGIN`` 选项，则会将所有文件的 ``kzdate`` 和 ``kztime``
设置为同样的值，并将所有文件的开始时间（B）设置为零，
这样做会使得数据丢失绝对时间信息。

示例
----

假定你读取两个不同参考时间的文件到内存：

.. code-block:: bash

    SAC> read file1 file2
    SAC> listhdr b kztime kzdate

      FILE: FILE1
      -
      B = 0.
      KZTIME = 10:38:14.000
      KZDATE = MAR 29 (088), 1981

      FILE: FILE2
      -
      B = 10.00
      KZTIME = 10:40:10.000
      KZDATE = MAR 29 (088), 1981

这些文件有相同的参考日期，不同的参考时刻以及不同的开始时间偏移量。可以
执行 ``synchronize`` 同步参考时刻：

.. code-block:: bash

    SAC> synchronize
    SAC> listhdr

      FILE: FILE1
      -
      B = -126.00
      KZTIME = 10:40:20.000
      KZDATE = MAR 29 (088), 1981

      FILE: FILE2
      -
      B = 0.
      KZTIME = 10:40:20.000
      KZDATE = MAR 29 (088), 1981

现在内存中的所有文件有相同的参考时间，如果头段中有任何已定义的时间标记，
它们的值也会调整以保证其绝对时刻是不变的。
