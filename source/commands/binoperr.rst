.. _cmd:binoperr:

binoperr
========

概要
----

控制二元文件操作
`addf </commands/addf.html>`__\ 、\ `subf </commands/subf.html>`__\ 、
`mulf </commands/mulf.html>`__\ 、\ `divf </commands/divf.html>`__
中的错误

语法
----

.. code:: bash

    BINOPERR [N\verb|PTS| F\verb|ATAL||W\verb|ARNING||I\verb|GNORE|] [D\verb|ELTA| F\verb|ATAL||W\verb|ARNING||I\verb|GNORE|]

该命令可以简写为 ``boec``

输入
----

NPTS
    修改数据点数不相等的错误条件

DELTA
    修改采样周期不相等的错误条件

FATAL
    设置错误条件为“致命”

WARNING
    设置错误条件为“警告”

IGNORE
    设置错误条件为“忽略”

缺省值
------

binoperr npts fatal delta fatal

说明
----

对文件执行二元操作（\ ``addf``\ 、\ ``divf`` 等）时，SAC会检测两个
文件的数据点数和采样周期是否匹配。该命令可以控制SAC在遇到不匹配时该如何
处理：

-  若设置错误条件为 ``fatal``\ ，则SAC在遇到错误时将停止执行
   当前命令，忽略当前行的其它其余命令，输出错误信息到终端并将控制权
   交还给用户

-  若设置错误条件为 ``warning``\ ，则遇到错误时会发送一个警告消息，
   程序内部尽可能纠正错误并继续执行

-  若设置错误条件为 ``ignore``\ ，则SAC会自动纠正错误并继续执行
   而不输出任何警告消息

在设置错误条件为 ``warning`` 或 ``igonre`` 的情况下，若要
操作的两个数据文件的数据点数不匹配，SAC会使用数据点最少的那个文件的
数据点数作为最终结果文件的数据点数，以保证正常操作；若要操作的两个
文件采样周期不匹配，则无论是否使用了 ``newhdr on`` 选项，SAC都会使用
第一个数据文件的采样周期作为结果文件的采样周期。

示例
----

假定file1有1000个数据点，file2有950个数据点：

.. code:: bash

    SAC> binoperr npts fatal
    SAC> read file1
    SAC> addf file2
    ERROR:  Header field mismatch: NPTS file1 file2

上例中由于数据点数不匹配导致文件加法未执行，假设你输入：

.. code:: bash

    SAC> binoperr npts warning
    SAC> addf file2
    WARNING:  Header field mismatch: NPTS file1 file2

则仅对文件的前950个数据点执行加法操作。
