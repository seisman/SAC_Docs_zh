SAC 读和写
==========

SAC 的读命令是 :doc:`/commands/read`\ （简写为 ``r``\ ），
写命令为 :doc:`/commands/write`\ （简写为 ``w``\ ）。
读和写是紧密联系的，所以把这两者放在一起讲。

.. attention::

   本节的所有示例都运行在同一个 SAC 会话中。

要演示如何读 SAC 文件，首先得有一些 SAC 数据才行，利用上一节提到的
:doc:`/commands/datagen` 生成一些数据。

.. code-block:: bash

    $ ls                # 空文件夹
    $ sac               # 启动一个 SAC 会话
     SEISMIC ANALYSIS CODE [11/11/2013 (Version 101.6a)]
     Copyright 1995 Regents of the University of California

    SAC> dg sub local cdv.n cdv.e cdv.z     # 生成三个 SAC 数据
    SAC> w cdv.n cdv.e cdv.z                # 将 SAC 数据写入磁盘
    SAC> ls                                 # SAC 中调用常见的系统命令
    cdv.e  cdv.n  cdv.z
                                            # 注意：这里并没有退出 SAC

有了数据之后，就可以练习如何去读了，在读数据之前，先说一说通配符的概念。

SAC 中，在指定文件名的时候，可以使用绝对路径，也可以使用相对路径。可以
使用其全名，也可以使用通配符。SAC 的通配符与 Unix 定义的通配符一致，
只包含如下三种：

#. “``*``” 匹配任意长度的字符串（包括零长度）；
#. “``?``” 匹配任意单个非空字符；
#. “``[]``” 匹配列表中的任意单一字符；

   -  “``[ABC]``” 或 “``[A,B,C]``” 匹配单个字符 A 或 B 或 C
   -  “``[0-9]``” 匹配任意一位数字
   -  “``[a-g]``” 匹配从 a 到 g 范围内的任意单个字符

下面的例子展示了如何读取 SAC 文件：

.. code-block:: bash

    SAC> r cdv.n cdv.e cdv.z    # 读入三个文件，分别指定其文件名
    SAC> r cdv.?                # 问号可以匹配单个字符
    ./cdv.e ...cdv.n ...cdv.z   # 注意！这里文件按照字符排序的顺序读入
    SAC> r cdv.[nez]            # 还可以这样读
    ./cdv.e ...cdv.n ...cdv.z
    SAC> r *                    # 也可以这样读
    ./cdv.e ...cdv.n ...cdv.z

需要注意的是，SAC 在执行读取命令时，会读入新的波形数据，并删除内存中
原有的波形数据，所以经过上面四次 :doc:`/commands/read`
之后，内存中依然只有三个波形。

如果想要在读取新数据时将波形直接追加到内存中的波形数据集之后，而不替换
内存中的原有波形，则需要使用 :doc:`/commands/read` 的 ``more``
选项\ [1]_：

.. code-block:: bash

    SAC> r ./cdv.n              # one file       3 -> 1
    SAC> r more ./cdv.e         # one MORE file  1 -> 2
    SAC> r more ./cdv.z         # one MORE file  2 -> 3

将数据读入到内存中之后，对内存中的数据做一些处理，然后就需要将内存中的
数据写回到磁盘中：

.. code-block:: bash

    SAC> w test.n test.e test.z        # 分别写入到三个新文件中
    SAC> w over                        # 覆盖磁盘原文件
    SAC> w append .new                 # 在原文件名的基础上加上后缀".new"
    cdv.e.new cdv.n.new cdv.z.new
    SAC> ls
    cdv.e cdv.e.new cdv.n cdv.n.new cdv.z cdv.z.new tesn.n test.e test.z
    SAC> q                             # 退出本节的 SAC 会话

.. [1] 在执行完上面的例子之后，内存中有三个 SAC 文件，所以本例在执行 ``read``
   命令时内存中的文件数由三个变成1个。
