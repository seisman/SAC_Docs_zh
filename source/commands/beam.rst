beam
====

概要
----

利用内存中的全部数据文件计算射线束

语法
----

.. code-block:: bash

    BEAM [Bearing v] [Velocity v] [REFerence ON|OFF| lat lon [el]]
        [OFFSET REF|USER|STATION|EVENT|CASCADE] [Ec anginc survel]
        [Center x y z] [WRite fname]

输入
----

BEARING v
    方位，由北算起的度数

VELOCITY v
    速度，单位为 km/s

REFERENCE lat lon el
    参考点，打开 ``REFERENCE`` 选项并定义参考点，这样其他文件的偏移量以此而定。
    ``lat``\ 、\ ``lon``\ 、\ ``el`` 分别代表纬度、经度、深度（下为正）

REFERENCE ON|OFF
    开或关 ``REFERENCE`` 选项

OFFSET REF
    偏移量是相对于 ``REFERENCE`` 选项设置的参考点的。要求开启 ``REFERENCE`` 选项

OFFSET USER
    偏移量直接从 ``USER7``\ 、\ ``USER8`` 以及 ``USER9`` 中获取，
    分别代表纬度、经度以及海拔。这就要求所有文件的 ``USER7`` 和
    ``USER8`` 必须定义。如果设置了 ``EC`` 选项， 则 ``OFFSET USER`` 要求
    ``USER9`` 必须被设置

OFFSET STATION
    偏移量相对于第一个台站的位置，这要求所有文件的
    ``STLA``\ 、\ ``STLO`` 必须定义

OFFSET EVENT
    偏移量相对于第一个事件的位置，这要求所有文件的
    ``EVLA``\ 、\ ``EVLO`` 必须定义

OFFSET CASCADE
    SAC 将会按照前面给出的顺序考虑决定偏移量的方法，
    并检查必要的数据是否具备。它将使用第一个满足要求的方法

EC
    高程校正。\ ``anginc``\ ：入射角，从 Z 轴算起，单位为度（震源
    距离越远，入射角越小）；\ ``survel``\ ：表面介质速度（km/s）。

CENTER
    用于计算射线束的中心台站。X为距参考台站的东向偏移；
    Y为距参考台站的北向偏移；Z为距参考台站的向上偏移，其单位为 m；

WRITE fname
    将射线束写入磁盘

缺省值
------

.. code-block:: bash

    beam  b 90  v 9.0 ec 33  6.0 c  0. 0. 0. w BEAM

说明
----

``beam`` 不覆盖SAC内存中的数据，因而当变换方位和速度时这一操作可以
重复执行。射线结果写入到磁盘文件中，并且每次可以写到不同的文件。这个设计
考虑到了用户的需求，即比较多次使用这一命令的不同结果，以寻找最佳射线束的
方位和速度。

头段数据
--------

参见 :doc:`/commands/bbfk`  命令。

错误消息
--------

``CENTER`` 参数缺失偏移量，\ ``EC`` 参数需要正值
