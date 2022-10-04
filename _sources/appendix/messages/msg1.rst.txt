1028 External command does not exist
------------------------------------

执行 :doc:`/commands/load` 命令时找不到外部命令。产生该错误的原因很多，可能
是环境变量 ``LD_LIBRARY_PATH`` 不包含要载入的共享库的所在目录，或 ``$SACSOLIST``
中不包含要载入的共享库的名字。

1103 No help package is available
---------------------------------

没有可用的帮助文档包，可能原因是没找到 ``${SACAUX}/help`` 目录。

1106 Not a valid SAC command.
-----------------------------

对于每一行命令，SAC 首先会检查是否是 SAC 内部的命令，如果不是，则检查是否是
系统自带的命令，比如 ``ls``\ 、\ ``cp`` 等。

一个例外是系统命令 ``rm``\ 。在 SAC 中直接执行 ``rm`` 命令会出现如上所示的错误。
出现该错误的原因是 SAC 禁用了系统命令 ``rm``\ ，主要目的是为了防止将 ``r *.SAC``
误敲成 ``rm *.SAC`` 而导致数据的误删除。可以使用 :doc:`/commands/systemcommand`
命令显式调用系统命令，如下：

.. code:: bash

    SAC> rm BAD*.SAC
     ERROR 1106: Not a valid SAC command.
    SAC> sc rm BAD*.SAC

1301 No data files read in
--------------------------

内存中未读入数据。可能是未指定要读取的文件列表，或列表中的文件不可读。

1303 Overwrite flag is not on for file
--------------------------------------

该错误主要出现在写 SAC 文件时，出现该错误的原因是 SAC 文件的头段变量
``lovrok`` 的值为 ``FALSE``\ ，即磁盘中的数据不允许被覆盖。解决该问题的
方法有两种：

-  以其他文件名写入磁盘，不覆盖磁盘文件；
-  修改 ``lovrok`` 的值为 ``TRUE``\ ；

1304 Illegal operation on data file
-----------------------------------

对数据文件的非法操作。

1305 Illegal operation on time series file
------------------------------------------

某些命令无法对时间序列数据进行操作。

1306 Illegal operation on unevenly spaced file
----------------------------------------------

某些命令无法对不等间隔数据进行操作。

1307 Illegal operation on spectral file
---------------------------------------

命令不能对内存中的谱文件进行操作。

1311 No list of filenames to write
----------------------------------

没有要写入的文件列表。

1312 Bad number of files in write file list
-------------------------------------------

通常在使用 :doc:`/commands/write` 命令时会出现该问题。出现该错误的原因是内存中的
波形文件的数目与 ``write`` 命令给出的文件名的数目不想匹配。在该错误信息的后面，
紧接着会给出 ``write`` 命令中给出的文件数目以及内存中的波形数目。

1317 The following file is not a SAC data file
----------------------------------------------

试图读入非 SAC 格式的文件所产生的错误。

1320 Available memory too small to read file
--------------------------------------------

系统内存不足。

1322 Undefined starting cut for file
------------------------------------

:doc:`/commands/cut` 命令中时间窗的起始参考头段未定义。默认情况下，会
使用磁盘文件的起始时间代替，也可以使用 :doc:`/commands/cuterr`
命令控制该错误的处理方式。

1323 Undefined stop cut for file
--------------------------------

:doc:`/commands/cut` 命令中时间窗的结束参考头段未定义。默认情况下，会使用
磁盘文件的结束时间代替，也可以使用 :doc:`/commands/cuterr` 命令控制该错误的
处理方式。

1324 Start cut less than file begin for file
--------------------------------------------

:doc:`/commands/cut` 命令中时间窗的开始时间早于磁盘文件的开始时间。默认情况下，
会使用磁盘文件的开始时间代替，也可以使用 :doc:`/commands/cuterr` 命令控制该错误的
处理方式。

1325 Stop cut greater than file end for file
--------------------------------------------

:doc:`/commands/cut` 命令中时间窗的结束时间晚于磁盘文件的结束时间。默认情况下，
会使用磁盘文件的结束时间代替，也可以使用 :doc:`/commands/cuterr` 命令控制该错误的
处理方式。

1326 Start cut greater than file end for file
---------------------------------------------

:doc:`/commands/cut` 命令中时间窗的开始时间晚于文件结束时间。

1340 data points outside allowed range contained in file
--------------------------------------------------------

文件中数据点的值超过了所允许的范围。比如 :doc:`/commands/log` 中要求数据为正。

1379 No SORT parameters given
-----------------------------

使用了 :doc:`/commands/sort` 命令，但未指定按照哪个参数排序。

1380 Too many SORT parameters
-----------------------------

:doc:`/commands/sort` 命令中用于排序的参数太多。

1381 Not a valid SORT parameter
-------------------------------

无效的 :doc:`/commands/sort` 参数。

1383 SORT failed
----------------

排序失败。

1606 Maximum allowable DFT is 16777216
--------------------------------------

SAC 中与 FFT 相关的命令所能允许的最大数据点数是 :math:`2^{24}=16777216`\ 。

1611 Corner frequency greater than Nyquist for file
---------------------------------------------------

对数据进行滤波时，拐角频率超过了文件的 Nyquist 采样率。

1613 Minimum size of data file for Hilbert transform is 201
-----------------------------------------------------------

在做 Hilbert 变换时，要求数据的最小长度是 201 个数据点。

1701 Can't divide by zero
-------------------------

除零的非法操作。

1702 Non-positive values found in file
--------------------------------------

数据文件中存在非正值。

1801 Header field mismatch
--------------------------

该错误出现在 :doc:`/commands/addf`\ 、\
:doc:`/commands/subf`\ 、\
:doc:`/commands/divf`\ 、\
:doc:`/commands/mulf` 以及
:doc:`/commands/merge` 和
:doc:`/commands/beam` 中。

出现该错误的原因是多个数据文件中的头段变量不匹配。该命令会明确给出不匹配的
头段变量名，以及出现不匹配的数据文件，以供用户查错。会出现不匹配的头段变量
包括 ``npts``\ 、\ ``delta``\ 、\ ``kstnm``\ 、\ ``knetwk``\ 、\ ``kcmpnm``\ 。

1802 Time overlap
-----------------

要进行操作的两个数据的时间段不完全重合。

1803 No binary data files read in.
----------------------------------

:doc:`/commands/addf`\ 、\ :doc:`/commands/subf`\ 、\ :doc:`/commands/merge`
等命令需要先读入二进制数据，再对数据做操作。

1805 Time gap
-------------

使用 :doc:`/commands/merge` 命令时，两段数据间存在时间间断。
