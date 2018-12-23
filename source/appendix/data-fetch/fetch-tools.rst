地震数据申请工具
================

IRIS及部分地震数据中心支持 FDSN web service，均可使用支持 web service 的
通用下载工具下载数据。这一节不会去介绍工具的具体用法，而是试着总结不同
工具各自的优缺点以及适用范围。读者应根据实际
需求选择合适的工具，并自行阅读相应工具的说明文档。

支持Web Service的通用下载工具
-----------------------------

SOD
+++

-  主页： http://www.seis.sc.edu/sod/
-  教程： https://blog.seisman.info/sod-notes/
-  适用范围：基于事件的事件波形数据+基于台站的事件波形数据+连续波形数据
-  特色及优点：

   -  命令行工具，易于批量处理
   -  申请数据的同时可以对数据进行预处理
   -  数据格式：SAC、miniSEED

ObsPy
+++++

-  主页： http://docs.obspy.org
-  适用范围：基于事件的事件波形数据+基于台站的台站波形数据+连续波形数据
-  特色及优点：

   -  基于 Python 语言，可编程实现任意复杂的数据申请
   -  文档简单易读，易于使用
   -  数据格式：miniSEED、SAC等多种格式

Bash Scripts
++++++++++++

-  主页： https://seiscode.iris.washington.edu/projects/ws-fetch-scripts
-  适用范围：连续波形数据
-  特色及优点：

   -  Perl 语言写的脚本，在命令行使用
   -  基于 DMC Web Service
   -  数据格式：miniSEED

-  缺点：仅适用于连续波形数据。对于地震时间波形数据，需要自行写脚本处理。

irisfetch.m
+++++++++++

主页： https://github.com/iris-edu/irisFetch-matlab

-  适用范围：连续波形数据
-  特色及优点：

   -  Matlab 脚本，可以在 Matlab 中直接调用相关函数获取数据
   -  数据格式：支持保存为 Matlab 自定义结构体

IRIS专用数据下载工具
--------------------

以下工具仅适用于从 IRIS DMC 下载数据。

Wilber III
++++++++++

-  主页：\ http://ds.iris.edu/wilber3/find_event
-  教程：\ https://blog.seisman.info/wilber3/
-  适用范围：仅用于申请基于事件的事件波形数据
-  特色及优点：

   -  网页端
   -  提供地震目录，筛选条件：经纬度范围、发震时刻、震级范围
   -  基于 Google 地图服务显示地震分布
   -  台站筛选条件：台网名、虚拟台网名、通道名、震中距范围、方位角范围
   -  基于 Google 地图服务显示台站分布
   -  提供波形预览
   -  根据发震时刻、P 波到时、S 波到时确定数据时间窗
   -  数据格式：SAC、SEED、miniSEED、ASCII、dataless SEED
   -  申请得到的数据位于 IRIS 的 FTP 中
   -  申请得到的数据已经写入事件信息

-  缺点：

   -  一次只能下载一个事件的波形数据，难以自动化
   -  只能用于基于事件的波形数据，无法用于基于台站的波形数据或连续波形数据

BREQ_FAST
+++++++++

-  主页：\ https://ds.iris.edu/ds/nodes/dmc/manuals/breq_fast/
-  教程：\ https://blog.seisman.info/breq-fast/
-  适用范围：连续波形数据
-  特色及优点：

   -  发送特定格式的邮件到特定邮箱即可申请数据
   -  邮件格式相对简单
   -  易于自动化和批量处理
   -  数据格式：发送到不同的邮箱可分别得到 SEED、miniSEED 和 dataless 格式的数据
   -  申请的数据位于 IRIS 的 FTP 里

-  缺点：需要一定的编程基础

JWEED
+++++

-  主页：\ https://ds.iris.edu/ds/nodes/dmc/software/downloads/jweed/
-  适用范围：基于事件的事件波形数据+基于台站的事件波形数据
-  特色及优点：

   -  Java 语法写的 GUI 客户端
   -  基于 DMC Web Service
   -  跨平台，但兼容性较差，某些平台下无法正常使用
   -  运行速度稍慢
   -  地震目录类型：NEIC PDE、GCMT、ISC、ANF
   -  地震事件筛选条件：时间范围、震级范围、深度范围
   -  台站筛选条件：台网名、虚拟台网名、通道名
   -  地震台站对筛选条件：方位角范围、反方位角范围、震中距范围
   -  数据格式：SAC、RESP、PZ、ASCII、miniSEED
   -  可以生成 ``BREQ_FAST`` 格式的文件，供发邮件申请数据
   -  数据会直接下载保存到本地

-  缺点：无法下载连续数据

SeismiQuery
+++++++++++

-  主页：\ http://ds.iris.edu/SeismiQuery/breq_fast.phtml
-  适用范围：连续波形数据
-  特色及优点：

   -  网页工具
   -  可以生成 ``BREQ_FAST`` 所需的文件
