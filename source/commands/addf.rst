addf
====

概要
----

将一组数据加到内存中的另一组数据中

语法
----

.. code-block:: bash

    ADDF [Newhdr [ON|OFF]] filelist

输入
----

NEWHDR ON|OFF
    指定新生成的文件使用哪个文件的头段。
    ``OFF`` 表示使用内存中原文件的头段区，
    ``ON`` 表示使用 filelist 中文件的头段区。
    缺省值为 ``OFF``

filelist
    SAC 二进制文件列表

说明
----

简单地说，该命令要做的就是 C=A+B，其中 A 是已读入内存的文件，B 是磁盘中要加到
A 的文件，C 是两个文件相加的结果。该命令会将磁盘中的一组文件与内存中的另一组
文件分别相加。若内存中的文件数多于 filelsit 中文件数，则 filelist 的最后一个
文件将加到内存中余下的文件中；
若 filelist 中的文件数多于内存中的文件数，则 filelist 中多余的文件将被忽略。

要相加的两个文件必须满足如下条件才能执行加法操作：

-  为等间隔时间序列文件
-  有相同的采样间隔 ``delta``
-  有相同的数据点数 ``npts``
-  文件开始时间有相同的绝对时刻

若两个待相加的文件的时刻不完全匹配，则会给出警告，但相加操作会继续执行。
若采样间隔或数据点数不匹配，默认情况下 SAC 会认为这是致命（\ ``fatal``\ ）错误，
直接报错退出。可以通过 :doc:`/commands/binoperr`
命令将采样间隔或数据点数的不匹配设置为忽略（\ ``ignore``\ ）、
警告（\ ``warning``\ ）或致命（\ ``fatal``\ ）。

在将不匹配设置为 ``ignore`` 或 ``warning`` 的前提下，SAC 会忽略采样周期的不匹配，
直接对数据做加法，不论是否使用了 ``newhdr on`` 选项，都使用第一个数据文件的
采样周期作为生成数据的采样周期；对于数据点数不匹配的情况，则取最小的数据点数作为
最终结果文件的数据点数。

示例
----

将一个文件加到其他三个文件中：

.. code-block:: bash

    SAC> r file1 file2 file3
    SAC> addf file4

将两个文件分别加到另两个文件中：

.. code-block:: bash

    SAC> r file1 file2
    SAC> addf file3 file4

头段变量
--------

depmin、depmax、depmen、npts、delta
