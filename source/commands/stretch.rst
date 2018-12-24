stretch
=======

概要
----

拉伸（增采样）数据，包含了一个可选的 FIR 滤波器

语法
----

.. code-block:: bash

    STRETCH n [Filter ON|OFF]

输入
----

n
    设置增采样因子，取值为2到7

FILTER ON|OFF
    打开/关闭插值 FIR 滤波器选项

缺省值
------

.. code-block:: bash

    stretch 2 filter on

说明
----

此命令对数据进行拉伸，即增采样。当关闭滤波器选项时，仅仅在原始数据点之间
插入适当数目的零值。若使用了 FIR 滤波器，则通过对数据进行滤波可以创建一个
与原始波形相似但是采样周期更小的文件。需要注意的是，滤波器对频谱成分是
有影响的。

头段变量
--------

npts、delta、e、depmin、depmax、depmen
