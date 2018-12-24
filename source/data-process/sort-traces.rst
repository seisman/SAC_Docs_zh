波形排序
========

**相关命令**\ ：\ :doc:`/commands/sort`

在画图时，波形数据在图像上的顺序与 SAC 数据读入内存时的顺序是一样的，
有时候会需要对波形更加灵活的排序，比如在手动拾取震相的时候，会希望
将所有波形数据按照震中距从小到大的顺序进行排列。SAC 提供了 ``sort``
命令使得波形可以按照某个头段变量的值进行排序。

将波形数据按照方位角升序排列：

.. code-block:: bash

    SAC> r *.SAC
    SAC> sort az
    SAC> ppk

将波形数据按照震中距降序排列：

.. code-block:: bash

    SAC> r *.SAC
    SAC> sort gcarc descend
    SAC> ppk p 10
