引用头段变量值
==============

前面已经介绍了 SAC 中的很多头段变量，也知道如何使用 :doc:`/commands/listhdr`
查看头段变量的值，\ ``lh`` 命令的输出对于人来说很直观，但是对于机器
来说却很不友好。有些时候需要直接使用头段变量的值，这就需要一些特殊的技巧。

最常见的情况是 :ref:`subsec:origin-time` 中给出的例子。在使用
“``ch o gmt``”指定发震时刻后，需要获取头段变量 ``o`` 的值，
对该值取负值，并用于“``ch allt``”中。

本例中，需要先获取头段变量 ``o`` 的值，再将其值用于其它命令中，
准确的说这叫变量值的引用。在SAC命令中引用头段变量的值有两种方式，
分别是“``&fname,header&``”和“``&fno,header&``”\ [1]_。

``fname`` 和 ``fno`` 都唯一指向了内存中的某个波形数据，其中 ``fname``
表示文件名，\ ``fno`` 表示文件号（即内存中的第几个文件，
索引值从1开始)，\ ``header`` 则为头段变量名。

下例展示了如何通过两种方式引用头段变量的值：

.. code-block:: bash

    SAC> fg seis
    SAC> w seis.SAC
    SAC> r ./seis.SAC               # 注意"./"
    SAC> lh kevnm o stla            # 查看三个头段变量的值

         kevnm = K8108838
             o = -4.143000e+01
          stla = 4.800000e+01
    SAC> echo on processed          # 打开回显，显示处理信息
    SAC> ch kuser0 &1,kevnm&        # 通过文件号引用头段变量 kevnm
     ==>  ch kuser0 K8108838        # 实际执行的效果
    SAC> ch user0 &./seis.SAC,o&    # 利用文件名，引用头段变量 o
     ==>  ch user0 -41.43
    SAC> ch user1 &seis.SAC,stla&   # 文件名少了"./"
     ERROR 1363: Illegal data file list name: seis.SAC
    SAC> lh kuser0 user0 user1

         kuser0 = K8108838
         user0 = -4.143000e+01

在通过文件名指定波形数据时要注意：SAC 记录的是文件的全路径。一般情况下，
使用文件号会更方便些。

.. [1] 实际上，SAC 官方文档给出的引用方式中没有末尾的 ``&`` 符号，仅当一些
   特殊的情况下才使用，这样容易使得整个语法混乱不堪，所以这里采用了另外一种引用
   方式。所有示例均已通过测试。
