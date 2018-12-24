黑板变量
========

既然是 SAC 编程，就必然少不了变量，SAC 中的变量称之为黑板变量。

黑板变量是 SAC 中用于临时储存和取回信息而设计的。黑板变量不需要声明即可
直接使用，可以用 :doc:`/commands/setbb` 和 :doc:`/commands/evaluate` 命令
给黑板变量赋值，用 :doc:`/commands/getbb` 获取黑板变量的值。
也可以用 :doc:`/commands/writebbf` 将黑板变量保存在磁盘文件中，
然后使用 :doc:`/commands/readbbf` 命令重新将这些变量读入SAC中。

引用黑板变量的值的方式为：“``%bbvname%``”，其中 ``bbvname`` 为黑板变量的变量名。

.. code-block:: bash

    SAC> echo on processed
    SAC> fg seis
    SAC> p
    SAC> setbb low 2.45         # 黑板变量 low=2.45
    SAC> setbb high 4.94        # 黑板变量 high=4.94
    SAC> bp c %low% %high%      # 引用黑板变量 low 和 high 的值作为滤波的频带
     ==>  bp c 2.45 4.94        # echo on processed 显示代入值后的命令
    SAC> p
    SAC> getbb low high         # 查看黑板变量的值
     low = 2.45
     high = 4.94

下例展示了如何将黑板变量写入磁盘文件，等需要时再从磁盘文件中获取：

.. code-block:: bash

    $ sac
    SAC> setbb var1 10          # 整型
    SAC> setbb var2 "text"      # 字符串
    SAC> setbb var3 0.2         # 浮点型
    SAC> wbbf bbf.file          # 写入到文件
    SAC> q
    $ ls
    bbf.file
    $ sac
    SAC> readbbf ./bbf.file
    SAC> getbb
     NUMERROR = 0
     SACERROR = 'FALSE'
     SACNFILES = 0
     VAR1 = 10
     VAR2 = 'text'
     VAR3 = 0.2
    SAC> getbb var2 var3
     var2 = 'text'
     var3 = 0.2
    SAC> q
