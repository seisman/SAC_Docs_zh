SAC 数据处理
############

地震数据处理的流程大致分为如下几个步骤：

1. 数据组织
2. 数据预处理
3. 人机交互
4. 数据分析
5. 绘制图件

本章将介绍如何高效地组织数据，以及如何利用 SAC 进行数据预处理和人机交互。

本章的各节分别介绍了数据处理流程中的各个小步骤，各节的顺序尽量按照数据
处理的流程排序。但实际数据处理的流程是由具体的研究来决定的，因而本章的
数据处理流程仅供参考，读者应理解每个步骤的含义及作用，根据实际情况决定
要采用哪些步骤以及各个步骤之间的先后顺序。

.. toctree::
   :maxdepth: 1

   data-request
   data-format
   merge-traces
   rename
   time-zone-correction
   event-info
   station-info
   rglitches
   rmean-rtrend-taper
   instrument-response
   cut-data
   rotate
   resampling
   filter
   traveltime
   sort-traces
   quality-control
   picking-phase
   data-analysis
   stack
