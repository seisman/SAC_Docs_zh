.. _sec:save-image:

图像保存
========

xwindows
--------

xwindows是SAC中最常用绘图设备，对于震相拾取等交互式操作更是必不可缺。

.. code:: bash

    SAC> fg seis
    SAC> bd x       # begindevice xwinows，可省略
    SAC> p          # 绘图
    SAC> ed x       # enddevice xwindows，可省略
    SAC> q

对于xwindows，最简单的保存图像的方式是截图，常用的工具包括gnome下的
``screenshot`` 或者ImageMagick的 ``import`` 命令。

sgf
---

SGF图形设备会将图像信息保存到SGF文件中。其使用方式为：“启用sgf图形设备”\ :math:`\rightarrow`
“绘图到sgf”\ :math:`\rightarrow`\ “关闭sgf设备，退出SAC”\ :math:`\rightarrow`\ “将sgf文件转换为其它格式”。

.. code:: bash

    SAC> fg seis
    SAC> bd sgf         # 启动sgf设备，不可省略
    SAC> p
    SAC> ed sgf         # 关闭sgf设备，可省略
    SAC> q
    $ ls
    f001.sgf            # 生成sgf文件

生成的sgf文件可以通过 ``sgftops`` 等命令转换为其它图像格式，
在 :doc:`/tools/sgftops` 中会介绍，也可以使用 ``sgftox`` 直接
将sgf文件显示在绘图窗口中。

PS和PDF
-------

自101.5之后，SAC加入了 :doc:`/commands/saveimg`
命令，可以将当前xwindow
或sgf图形设备中的图像保存到其它ps或pdf格式的图像文件中，以获得更高质量
的绘图效果。 [1]_

.. code:: bash

    SAC> fg seis
    SAC> p                      # 首先在xwindows上绘图
    SAC> saveimg foo.ps         # 将xwindows上的图像保存到foo.ps中
    save file foo.ps [PS]
    SAC> q

pssac
-----

pssac是Prof. Lupei Zhu写的用于绘制SAC文件的C程序。该程序利用了GMT的PS
绘图库，直接读取SAC文件并绘制到PS文件中。得益于GMT的PS库的灵活性，利用
pssac可以绘制出超高质量的复杂图像。具体参见 :doc:`/tools/pssac` 一节。

小结
----

-  在xwindows上绘图简单省事，直接截图的效果较差，仅可用于非正式的演示；

-  sgf转换为其它图像格式稍显麻烦，但适合在脚本中批量做图；

-  saveimg生成图像文件质量相对较高，可以满足大多数需求；

-  pssac功能强大，在一般绘图以及复杂图像时非常有用，适合在发表文章时使用；

.. [1]
   该命令也支持输出为png和xpm格式，但png和xpm为位图
   图像格式，精度不够，且依赖于其它函数库，因而不推荐使用。
