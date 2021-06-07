dif
===

概要
----

对数据进行微分

语法
----

.. code-block:: console

    DIF [TWo|THree|Five]

输入
----

TWO
    使用两点差分算子

THREE
    使用三点差分算子

FIVE
    使用五点差分算子

缺省值
------

.. code-block:: console

    dif two

说明
----

该命令通过对数据应用差分算法实现数据的微分操作，要求数据必须是等间隔采样的时间序列文件。
微分会使位移量变成速度量，速度量变成加速度量，因而微分的同时会修改头段变量
``idep`` 的值。

两点差分算法：

.. math:: Out(j) =\frac{Data(j+1) - Data(j)}{\Delta}

两点差分算子不是中心差分算法。此算法的最后一个输出值是未定义的，SAC 的处理方式是：
令数据点数减1，文件起始时间 ``B`` 增加半个采样周期。

三点（中心两点）差分算法：

.. math:: Out(j) = \frac{1}{2} \frac{Data(j+1) - Data(j-1)}{\Delta}

此算法输出值的第一个和最后一个是未定义的，SAC 将数据点数减去2，并将文件起始时间
``B`` 增加一个采样周期。

五点（中心四点）差分算法：

.. math:: Out(j) = \frac{2}{3} \frac{Data(j+1) - Data(j-1)}{\Delta} - \frac{1}{12} \frac{Data(j+2) - Data(j-2)}{\Delta}


此算法输出值的首尾各两个点是未定义的，SAC 使用三点差分算符计算第二个和倒数第二个点
的值，并将数据点数减2，将 ``B`` 增加一个采样周期。

头段变量改变
------------

npts、b、e、depmin、depmax、depmen、idep
