event
========

概要
----

按照区域、震级和时间搜索地震事件

语法
----

.. code-block:: console

    EVENT [MAG min [max]] [TIME start end] [REGION w e s n]
        [RADIAL lon lat min_radius max_radius] [DEPTH min max] 
        [OUTFILE filename] [TO blackboard-variable]
        [GCMT|ISC|NEIC|CMT|USGS|PDE]
        [Verbose]

输入
----


TIME
    设置开始和结束的时间。结束时间可以用相对时间。

REGION west east south north
    在一个矩形区域内搜索地震事件，west、east、south 和 north 为矩形区域的范围。

RADIAL lon lat min_radius max_radius
    在一个圆形区域内搜索地震事件。lon 和 lat 是圆形的经度和纬度。
    min_radius 和 max_radius 是最小半径和最大半径。
    如果最小半径不是0，圆形区域其实是一个环。

DEPTH min max
    设置震源深度的范围的最小值和最大值，单位：km。

MAG min [max]
    设置震级的范围。

GCMT|ISC|NEIC|CMT|USGS|PDE
    设置选用的地震目录。GCMT：Global Centroid Moment Tensor Catalog，CMT 是其别名。
    ISC：International Seismic Catalog。
    USGS：USGS Catalog，PDE 和 NEIC 是其别名。USGS 是默认值。

TO blackboard-variable
    保存所用事件的 ID 为一个空格分割的列表。

OUTFILE
    把搜索结果保存为一个文件。如果文件名后缀设定为 .xml，则保存为 QuakeXML 文件，
    其它后缀，则保存为 csv 文本。

Verbose
    显示搜索和下载的细节。不是缺省值。

缺省值
------

.. code-block:: console

    event usgs
说明
----

本命令用于下载地震目录。结果可以显示在屏幕上，也可以（使用 outfile 选项）输出为一个文件。
时间范围的设定可以使用多种格式，参加下方的例子。结束时间可以使用带单位的相对值。
See DATA ACCESS for time formats.
存储事件 ID 后，可以用于在相似搜索命令间区分发震时刻和震源位置。
They can also be used to set SAC file METADATA for an event.

示例
----

搜索所有 9 级地震：

.. code-block:: console

    SAC> event mag 9
    Origin              Lat.   Lon.    Depth  Mag.     Agency EventID
    2011-03-11T05:46:24  38.30  142.37  29.00 9.10 mww US/official
    usgs:official20110311054624120_30
    2004-12-26T00:58:53   3.29   95.98  30.00 9.10 mw  US/official
    usgs:official20041226005853450_30
    1964-03-28T03:36:16  60.91 -147.34  25.00 9.20 mw  iscgem/official
    usgs:official19640328033616_30
    1960-05-22T19:11:20 -38.14  -73.41  25.00 9.50 mw  iscgem/official
    usgs:official19600522191120_30
    1952-11-04T16:58:30  52.62  159.78  21.60 9.00 mw  iscgem/official
    usgs:official19521104165830_30