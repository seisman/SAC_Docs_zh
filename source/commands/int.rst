int
===

概要
----

利用梯形法或矩形法对数据进行积分

语法
----

.. code-block:: bash

    INT [Trapezeidal|Rectangular]

缺省值
------

.. code-block:: bash

    int trapezoidal

说明
----

该命令使用梯形法或矩形法对数据进行数值积分，可以处理等间隔数据或非等间隔数据。
除积分之外，还会根据具体情况修改因变量类型 ``idep``\ ，并重新计算 ``depmax``\ 、
``depmin``\ 、\ ``depmen``\ 。

对于函数 :math:`f(x)` 其积分用梯形法表示为

.. math:: y_n = y_{n-1} + \frac{1}{2}(x_{n+1}-x_n) (f(x_n)+f(x_{n+1})), \quad n\in[1,npts-1]

用矩形法表示为：

.. math:: y_n = y_{n-1} + (x_n-x_{n-1})f(x_n), \quad n\in[1,npts]

二者均有边界条件 :math:`y_0=0`\ 。

对于等间隔数据，若使用梯形积分，数据点数 ``npts`` 将减1，文件的头段变量
``b`` 将增加半个采样周期\ [1]_。

头段变量
--------

depmin、depmax、depmen、idep、npts、b、e

.. [1] 若使用矩形积分，理论上 ``npts`` 和 ``b`` 也应有所修改，但实际代码中却
   未对此多做处理，暂不确定是否是Bug。
