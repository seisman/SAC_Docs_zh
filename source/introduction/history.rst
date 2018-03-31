SAC 发展史
==========

`Lawrence Livermore 国家实验室`_ 和 `Los Alamos 国家实验室`_ 是美国承担核武器
设计工作的两个实验室。SAC 于20世纪80年代诞生于实验室的 Treaty Verification Program
小组里，该组由 W. C. Tapley 和 Joe Tull 共同领导。

起初，SAC 是用 Fortran 语言实现的，并将源代码分发给感兴趣的学者，允许用户进行
非商业性的地震数据处理，用户和开发者之间的合作协议要求用户提交 bug 修正和改进
以换取 SAC 的使用权。到了大概1990年，SAC 已经成为全球地震学家的数据处理标准软件。

从1992年开始，SAC 的开发逐渐由 Livermore 接管，并开始通过分发协议严格限制
源代码的分发。与此同时，开发者认为 Fortran 是一种过于局限的编程语言，
其阻碍了SAC特性的进一步开发，因而开发者使用 `f2c`_\ [1]_\ 转换工具将 SAC 的
Fortran 源码转换成了 C 源码\ [2]_。接下来，Livermore 以转换得到的 C 源码为基础，
计划开发一个商业版的地震数据处理产品，命名为 SAC2000。这个版本扩展了很多功能，
其中一个功能是建立一个日志数据库，记录一个波形从原始数据到最终产品之间的所有
处理步骤。这样的设计允许用户随时提交数据处理的中间结果，也可随时回滚到之前的状态。

约1998年， `IRIS`_ 意识到，SAC的核心用户群（主要是IRIS的成员）无法确保能够获取
SAC 的源码。IRIS 开始和 Livermore 协商，希望将 SAC 的开发分成两条线：一个包含
数据库特性，供核监测机构使用；另一个不包含数据库特性，仅供学术机构使用。
商业化的努力主要集中在含数据库功能的版本上。

终于，在2005年，IRIS 与 Livermore 签订了合同，Livermore 提供给 IRIS 一个 SAC
协议，允许其在 IRIS 社区内部分享 SAC/SAC2000 的源代码，并提供有限的支持以
促进社区的发展。而学术圈对于商业版的 SAC 没有太大兴趣，因而 Livermore 逐渐
撤出了对于 SAC2000 的支持。最终 IRIS 完全接手了 SAC 的开发和技术支持，成为了
一个独立的新分支，也就是本手册中介绍的 SAC，有时为了区分，也称之为 SAC/IRIS。

.. [1] Fortran77 语言到 C 语言的自动转换工具。
.. [2] 个人猜测，目前 SAC 源码的混乱和不易读正是由于这次自动转换导致的。

.. _Lawrence Livermore 国家实验室: http://en.wikipedia.org/wiki/Lawrence_Livermore_National_Laboratory
.. _Los Alamos 国家实验室: http://en.wikipedia.org/wiki/Los_Alamos_National_Laboratory
.. _f2c: http://www.netlib.org/f2c/
.. _IRIS: http://www.iris.edu
