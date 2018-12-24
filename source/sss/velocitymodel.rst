velocitymodel
=============

概要
----

设置计算动延迟时所使用的叠加速度模型参数

语法
----

.. code-block:: bash

    VelocityModel n [ON|OFF] [REFRACTEDWAVE|NORMALMOVEOUT] [FLIP] [VAPP v|CALCULATE]
        [T0VM v|CALCULATE] [DVM v1 [v2]] [TVM v1 [v2]] [VAPPI v] [T0VMI v]

输入
----

n
    设置速度模型号，取值为1或2

ON|OFF
    打开/关闭速度模型选项。若打开则使用速度模型，否则忽略

REFRACTEDWAVE
    打开速度模型选项，并修改为折射波模型

NORMALMOVEOUT
    打开速度模型选项，并修改为Normal moveout模型

FLIP
    交换两个速度模型的属性

VAPP v
    设置视速度为v

VAPP CALCULATE
    SAC自动计算视速度

TOVM v
    设置时间轴截距为v

TOVM CALCULATE
    SAC自动计算截距

DVM v1 v2
    定义一/二个参考距离

TVM v1 v2
    定义一/二个参考时间

VAPPI v
    设置视速度增量为v。每次 :doc:`/sss/incrementstack` 命令执行时视速度增加v

TOVMI v
    设置时间轴截距的增量为v。每次 :doc:`/sss/incrementstack` 命令执行时视速度增加v

缺省值
------

.. code-block:: bash

    velocitymodel 1 off
    velocitymodel 2 off

说明
----

第一个速度模型用于计算某个特定震相的动态台站延迟。
在信号叠加（\ :doc:`/sss/sumstack`\ )、绘图叠加图（\ :doc:`/sss/plotstack`\ ）、
绘制剖面图（\ :doc:`/sss/plotrecordsection`\ ）时会使用该模型。第二个速度
模型用于在绘图剖面图时显示相对于第二震相的延迟。这两个模型的参数可以很容易的进行交换。

可以使用两种速度模型，即折射波速度模型：

.. math:: T_{delay} = TVM(1) - \frac{TOVM+DIST}{VAPP}

 以及normal moveout速度模型：

.. math:: T_{delay} = TVM(1) - \sqrt{TOVM^2 + (\frac{DIST}{VAPP})^2}

这些速度模型延迟可以通过多种方式得到：

-  直接输入VAPP、TOVM、TVM(1)
-  输入DVM(1)、TVM(1)以及VAPP或TOVM，SAC自动计算所需的变量以保证在距离DVM(1)处时间延迟为零
-  输入DVM(1)、TVM(1)、DVM(2)和TVM(2)。SAC将计算VAPP和TOVM，以保证在距离DVM(1)处的时间延迟为零

示例
----

设置第一个叠加速度模型为折射波模型，视速度为 6.5 km/s，让SAC 自动计算 TOVM
以使得 200 km 处的时间延迟为零：

.. code-block:: bash

    velocitymodel 1 refractedwave vapp 6.5 tovm calculate dvm 200 tvm 35
