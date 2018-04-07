信号叠加子程序
==============

Signal Stack Subprocess，是 SAC 提供的一个用于信号叠加的子程序。

在 SAC 中键入 ``sss`` 即可进入该子程序；在子程序中键入
:doc:`/commands/quitsub` 即可退出子程序并回到主程序；也可键入
:doc:`/commands/quit` 直接从子程序中退出 SAC。

在对多个信号进行叠加时，每个信号都有各自的属性，比如静延迟、震中距、权重因子、
数据极性，也可以根据 normal moveout 或折射波速度模型计算动延迟。

该子程序具有如下特点：

-  延迟属性可以在叠加过程中自动递增；
-  文件可以很容易地从叠加文件列表中增添；
-  叠加时间窗也可以很容易调整；
-  若文件在叠加时间窗内不含数据，则将其置零值；
-  叠加文件列表可以单独绘制，也可以绘制叠加后的结果；
-  每次叠加结果都可以保存到磁盘上；
-  支持绘制记录剖面图；

在 SSS 子程序中，你可以执行一系列 SSS 专属的命令，以及部分 SAC 主程序中的命令。
下面仅列出 SSS 专属的命令：

-  :doc:`/sss/addstack` 向叠加文件列表中加入新文件
-  :doc:`/sss/changestack` 修改当前叠加文件列表中的文件属性
-  :doc:`/sss/deletestack` 从叠加文件列表中删除一个或多个文件
-  :doc:`/sss/deltacheck` 修改采样率检测选项
-  :doc:`/sss/distanceaxis` 定义剖面图中距离轴的参数
-  :doc:`/sss/distancewindow` 控制接下来的剖面图的距离窗属性
-  :doc:`/sss/globalstack` 设置全局叠加属性
-  :doc:`/sss/incrementstack` 叠加文件列表中文件的增量属性
-  :doc:`/sss/liststack` 列出当前叠加文件列表中文件的属性
-  :doc:`/sss/plotrecordsection` 用叠加文件列表中的文件绘制剖面图
-  :doc:`/sss/plotstack` 绘制叠加文件列表中的文件
-  :doc:`/sss/sumstack` 对叠加文件列表中的文件进行叠加
-  :doc:`/sss/timeaxis` 控制接下来剖面图的时间轴属性
-  :doc:`/sss/timewindow` 设置叠加的时间窗
-  :doc:`/sss/traveltime` 根据预定义的模型计算走时
-  :doc:`/sss/velocitymodel` 用于计算动延迟的叠加速度模型参数
-  :doc:`/sss/velocityroset` 控制剖面图中速度roset的放置
-  :doc:`/sss/writestack` 将叠加结果写入磁盘
-  :doc:`/sss/zerostack` 重新初始化信号叠加
