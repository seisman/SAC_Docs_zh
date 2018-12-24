correlate
=========

概要
----

计算自相关和互相关函数

语法
----

.. code-block:: bash

    CORrelate [Master name|n] [Number n] [Length ON|OFF|v] [NOrmalized]
        [Type Rectangle|HAMming|HANning|Cosine|Triangle]

输入
----

MASTER name|n
    通过文件名或文件号指定主文件，所有文件将与此文件做相关

NUMBER n
    设置相关窗的个数

LENGTH ON|OFF
    打开/关闭固定窗长选项开关

LENGTH v
    打开固定窗长选项开关，并将窗长度设置为 v 秒

NORMALIZED
    对相关结果进行归一化

TYPE RECTANGLE
    给每个窗应用矩形函数，其等价于不对窗加函数

TYPE HAMMING|HANNING
    对每个窗应用Hamming/Hanning函数

TYPE COSINE
    对每个窗的前后10%的数据点应用余弦函数

TYPE TRIANGLE
    对每个窗应用三角函数

缺省值
------

.. code-block:: bash

    correlate master 1 number 1 length off type rectangle

说明
----

该命令允许用户指定内存中的某个信号为主信号，并将主信号与内存中的所有信号
（包括主信号自身）进行相关。主信号与自身计算得到自相关函数，与其他信号
计算得到互相关函数。

两个信号之间的互相关函数定义如下：

.. math:: Cor(t) = \int_{-\infty} ^\infty f^*(\tau)g(t+\tau)d\tau

互相关函数的计算可以在时间域或频率域完成，该命令在频率域计算信号间的相关
函数。

该命令的窗特性允许你计算对多个窗计算平均相关函数，其中窗的数目以及窗函数
均可以指定。当窗特性被打开时，会将信号划分为n个固定长度的窗，计算每个窗的
互相关函数，然后将所有的互相关函数做平均、截取到与原信号相同的数据长度，
并替换内存中的原始数据文件。

当窗长度（\ ``LENGTH`` 选项）以及窗数目（\ ``NUMBER`` 选项）超过
文件中的数据点数时，会自动计算窗之间的重叠。缺省情况下，此窗特性是关闭的。

使用归一化选项，会对相关函数做归一化，最终得到的结果位于 -1 到 1 之间，
由此可以得到常用的互相关系数。

示例
----

以内存中第三个文件为主文件计算互相关函数：

.. code-block:: bash

    SAC> r file1 file2 file3
    SAC> cor master 3

也可以通过文件名来指定主文件。

假设有两个数据文件，每个包含1000个噪声数据。将数据划分为无重叠的10个窗，
每个窗包含100个数据点，且对窗应用 hanning 函数，并计算10个窗的平均相关函数：

.. code-block:: bash

    SAC> r file1 file2
    SAC> cor type hanning number 10

为了使窗之间有20%的混叠，可以设置窗长度为120个数据点。假设数据采样周期
为0.025（即每秒40个采样点），则窗长为3秒：

.. code-block:: bash

    SAC> r file1 file2
    SAC> cor type hanning number 10 length 3.0

下面的例子计算了两个数据之间的归一化互相关函数，并从中提取出了互相关系数：

.. code-block:: bash

    SAC> r file1 file2
    SAC> cor norm                                   # 归一化互相关
    SAC> setbb cc (max &2,depmax (abs &2,depmin))   # 取互相关函数的极值
                                                    # 作为互相关系数

头段变量
--------

depmin、depmax、depmen
