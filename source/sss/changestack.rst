.. _sss:changestack:

changestack
===========

概要
----

修改当前叠加文件列表中的文件属性

语法
----

.. code:: bash

    C\verb|HANGE|S\verb|TACK| filename|filenumber [W\verb|EIGHT| v] [DI\verb|STANCE| v] [BE\verb|GINTIME| v]
        [END\verb|TIME| v] [DE\verb|LAY| v S\verb|ECONDS||P\verb|OINTS|] [I\verb|NCREMENT| v S\verb|ECONDS||P\verb|OINTS|]
        [N\verb|ORMAL||R\verb|EVERSED|]

输入
----

filename
    叠加文件列表中的文件名

filenumber
    叠加文件列表中的文件号

WEIGHT v
    当前文件的权重因子。v的取值范围为0到1，在叠加之前会首先对文件的每个值乘以该权重因子再做叠加。

DISTANCE v
    该文件所对应的震中距，单位为 。用于计算动态时间延迟

BEGINTIME v
    事件开始的时间

ENDTIME
    事件结束时间

DELAY v SECONDS|POINTS
    该文件的静态时间延迟，单位为秒或数据点数

INCREMENT v SECONDS|POINTS
    该文件的静态时间延迟增量，单位为秒或数据点数。在每次执行incrementstack命令时，静态时间延迟会增加一个常数。

NORMAL|REVERSED
    文件拥有正/负极性

说明
----

该命令允许你修改修改叠加文件列表中任意文件的任意属性。详情参考 命令。
