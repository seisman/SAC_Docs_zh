cut
===

概要
----

定义要读入的数据窗

语法
----

.. code-block:: bash

    CUT [ON|OFF|pdw|SIGNAL]

输入
----

pdw
    打开截窗选项并修改 :ref:`subsec:pdw`

ON
    打开截窗选项但不改变 ``pdw``

OFF
    关闭截窗选项

SIGNAL
    等效于设置 ``pdw`` 为 ``A -1 F 1``\ ，即 ``a`` 前一秒到 ``f``
    后一秒的数据窗

缺省值
------

.. code-block:: bash

    cut off

说明
----

``cut`` 命令仅设置了要读取的时间窗选项，并不对内存中的数据进行截取。
因而，若要该命令起作用，需要在 ``cut`` 命令设置时间窗后使用 ``read``
命令。与此相反，:doc:`/commands/cutim` 命令会在命令执行时直接
对内存中的数据进行截取。

若截窗选项为关，则读取整个文件；若截窗选项为开，则只读取由 ``pdw``
定义的部分。

如果你想对一组有不同参考时刻的文件使用同样的时间窗，必须在执行 ``cut``
前先使用 :doc:`/commands/synchronize`
命令使所有文件具有相同的参考时刻。\ ``synchronize``
命令修改了文件的头段使得所有文件具有相同的参考时刻，
并调整所有相对时间。因而，你需要先读取所有文件，执行 ``synchronize``
命令，使用 :doc:`/commands/writehdr`
将修改后的头段写入到磁盘文件中，然后再执行 ``cut``
命令，并读取数据，这样才能得到正确的结果。

示例
----

下面将用一系列示例来展示 ``cut`` 命令的常见用法。首先，先生成测试用
的示例数据：

.. code-block:: bash

    SAC> fg seis
    SAC> w seismo.sac

直接读取文件，不做任何截窗操作：

.. code-block:: bash

    SAC> r seismo.sac
    SAC> lh b e a kztime npts
              b = 9.459999e+00
              e = 1.945000e+01
              a = 1.046400e+01
         kztime = 10:38:14.000
           npts = 1000

截取 b 到 e 之间的波形，等效于不做任何截窗操作：

.. code-block:: bash

    SAC> cut b e
    SAC> r seismo.sac
    SAC> lh b e a kztime npts
              b = 9.459999e+00
              e = 1.945000e+01
              a = 1.046400e+01
         kztime = 10:38:14.000
           npts = 1000

截取文件的前3秒：

.. code-block:: bash

    SAC> cut b 0 3
    SAC> r seismo.sac
    SAC> lh b e a kztime npts
              b = 9.459999e+00
              e = 1.246000e+01
              a = 1.046400e+01
         kztime = 10:38:14.000
           npts = 301

截取文件开始的100个数据点：

.. code-block:: bash

    SAC> cut b n 100
    SAC> r
    SAC> lh b e a kztime npts
              b = 9.459999e+00
              e = 1.045000e+01
              a = 1.046400e+01
         kztime = 10:38:14.000
           npts = 100

截取初动前0.5秒到初动后3秒的数据：

.. code-block:: bash

    SAC> cut a -0.5 3
    SAC> r
    SAC> lh b e a kztime npts
              b = 9.959999e+00
              e = 1.346000e+01
              a = 1.046400e+01
         kztime = 10:38:14.000
           npts = 351

截取数据的第10到15秒（相对于参考时刻）：

.. code-block:: bash

    SAC> cut 10 15
    SAC> r ./seismo.sac
    SAC> lh b e a kztime npts
              b = 9.999999e+00
              e = 1.500000e+01
              a = 1.046400e+01
         kztime = 10:38:14.000
           npts = 501

先截取数据的最开始前3秒，再截取接下来的3秒：

.. code-block:: bash

    SAC> cut b 0 3
    SAC> r ./seismo.sac
    SAC> w tmp.1
    SAC> cut b 3 6
    SAC> r
    SAC> w tmp.2
    SAC> cut off
    SAC> r ./tmp.?
    ./tmp.1 ...tmp.2
    SAC> lh b e a kztime npts

      FILE: ./tmp.1 - 1
     -------------
              b = 9.459999e+00
              e = 1.246000e+01
              a = 1.046400e+01
         kztime = 10:38:14.000
           npts = 301

      FILE: ./tmp.2 - 2
     -------------
              b = 1.246000e+01
              e = 1.546000e+01
              a = 1.046400e+01
         kztime = 10:38:14.000
           npts = 301

当要截取的窗超过了文件的时间范围时，可以使用 :doc:`/commands/cuterr` 命令的
``FILLZ`` 选项，在文件的开始或结尾处补0，再读入内存。

.. code-block:: bash

    SAC> r N11A.lhz
    SAC> lh npts
        npts = 3101

    SAC> cuterr fillz; cut b n 4096
    SAC> r
    SAC> lh npts
        npts = 4096

限制
----

目前不支持非等间隔文件或谱文件的截断。该命令对 ASCII 格式的 SAC 文件无效。
