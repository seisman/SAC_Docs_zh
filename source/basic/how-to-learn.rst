如何学习SAC？
=============

学习SAC最好的方式是找一个有经验且有耐心的人，让他/她给你演示SAC是如何
工作的。如果没有这样一个人的话，那么你就需要打开终端从头开始自学。

学习SAC的过程大致可以分成三个阶段，下面列出了每个阶段的具体要求。
普通用户需要达到SAC进阶才能满足日常数据处理的要求。

SAC初阶
-------

#. 掌握SAC中最常用的命令，包括但不限于
   :doc:`/commands/help` 、
   :doc:`/commands/read` 、
   :doc:`/commands/write` 、
   :doc:`/commands/plot` 、
   :doc:`/commands/quit` 、
   :doc:`/commands/plotpk` 、
   :doc:`/commands/listhdr` 、
   :doc:`/commands/chnhdr` 、
   :doc:`/commands/rmean` 、
   :doc:`/commands/rtrend` 、
   :doc:`/commands/taper` 、
   :doc:`/commands/bandpass` 、
   :doc:`/commands/plot1` 、
   :doc:`/commands/plot2` 、
   :doc:`/commands/cut` 、
   :doc:`/commands/fft` 、
   :doc:`/commands/transfer` ；

#. 理解地震数据处理流程,参见 :doc:`/data-process/index` 一章;
#. 了解 :doc:`/fileformat/index` ，掌握常见的 :doc:`/fileformat/header-variables` ，理解 :doc:`/fileformat/sac-time` ；
#. SAC 相关工具： :doc:`/tools/saclst` ；

SAC进阶
-------

#. 掌握SAC的大部分命令，至少要知道哪个命令可以实现什么功能；
#. 掌握如何绘制波形图，见 :doc:`/graphics/index`
#. 了解 SAC 编程以及如何在脚本中调用 SAC，见 :doc:`/macros/index` 和 :doc:`/call-in-script/index`
#. 学会在自己的程序中读写 SAC 文件，见 :doc:`/libs/index` 和 :doc:`/sacio/index`

SAC高阶
-------

#. 了解SAC软件包的内部结构；
#. 自己写程序实现SAC I/O库；
#. 阅读SAC源码，了解命令的技术细节；
#. 向SAC贡献代码；
