# SAC数据处理

地震数据处理的流程大致为：数据组织 ➔ 数据预处理 ➔ 人机交互 ➔ 数据分析 ➔ 绘制图件。
本章将介绍如何高效地组织数据，以及如何利用SAC进行数据预处理和人机交互。

本章的各节分别介绍了数据处理流程中的各个小步骤，各节的顺序尽量按照数据
处理的流程排序。但实际数据处理的流程是由具体的研究来决定的，因而本章的
数据处理流程仅供参考，读者应理解每个步骤的含义及作用，根据实际情况决定
要采用哪些步骤以及各个步骤之间的先后顺序。


* [数据申请](data-request.md)
* [数据格式转换](data-format.md)
* [合并数据](merge-traces.md)
* [数据重命名](naming.md)
* [时区校正](time-zone-correction.md)
* [事件信息](event-info.md)
* [台站和分量信息](station-info.md)
* [去毛刺](rglitches.md)
* [去均值、去线性趋势和波形尖灭](rmean-rtrend-taper.md)
* [去仪器响应](instrument-response.md)
* [数据截窗](cut-data.md)
* [分量旋转](rotate.md)
* [数据重采样](resampling.md)
* [滤波](filter.md)
* [震相理论到时](traveltime.md)
* [波形排序](sort-traces.md)
* [质量控制](quality-control.md)
* [震相拾取](picking-phase.md)
* [数据分析](data-analysis.md)
