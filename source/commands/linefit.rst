linefit
=======

概要
----

对内存中数据的进行最小二乘线性拟合

语法
----

.. code-block:: bash

    LINEFIT

说明
----

此命令的底层实现与 :doc:`/commands/rmean`  命令是相同的。

对数据使用最小二乘拟合得到一条直线，并将拟合结果写到黑板变量中：

-  ``SLOPE``\ ：直线的斜率
-  ``YINT``\ ：Y轴截距
-  ``SDSLOPE``\ ：斜率的标准差
-  ``SDYINT``\ ：截距的标准差
-  ``SDDATA``\ ：数据的标准差
-  ``CORRCOEF``\ ：数据和模型间的相关系数

示例
----

.. code-block:: bash

    SAC> fg seis
    SAC> linefit            # 线性拟合
     Slope and standard deviation are: 0.00023042 0.0035114
     Intercept and standard deviation are: -0.10165 0.048355
     Data standard deviation is: 0.32054
     Data correlation coefficient is: 0.0020772
    SAC> getbb             # 查看黑板变量
     CORRCOEF     = 0.00207718
     NUMERROR = 0
     SACERROR = 'FALSE'
     SACNFILES = 1
     SDDATA     = 0.32054
     SDSLOPE     = 0.00351136
     SDYINT     = 0.0483548
     SLOPE     = 0.000230417
     YINT     = -0.10165
    SAC> getbb SLOPE       # 查看单个头段变量时出错，猜测是bug
     ERROR 1201: Could not find VARS variable SLOPE
