timewindow
==========

概要
----

设置叠加的时间窗范围

语法
----

.. code-block:: bash

    TimeWindow v1 v2

输入
----

v1 v2
    读入数据时所使用的时间窗范围

缺省值
------

无缺省值，在叠加之前必须指定时间窗范围。

说明
----

该命令用于设置叠加时间窗，该设置会影响
:doc:`/sss/sumstack` 、:doc:`/sss/plotstack` 、:doc:`/sss/plotrecordsection` 
等命令的执行效果，叠加时间窗必须在使用这些命令之前定义。

如果某个文件在叠加时间窗的范围内无数据，则对相应部分补零值处理。
