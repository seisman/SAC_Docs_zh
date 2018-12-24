图像保存
========

xwindows
--------

xwindows 是 SAC 中最常用绘图设备，对于震相拾取等交互式操作更是必不可缺。

.. code-block:: bash

    SAC> fg seis
    SAC> bd x       # begindevice xwinows，可省略
    SAC> p          # 绘图
    SAC> ed x       # enddevice xwindows，可省略
    SAC> q

对于 xwindows，最简单的保存图像的方式是截图，常用的工具包括 GNOME 下的
``screenshot`` 或者 ImageMagick 的 ``import`` 命令。

sgf
---

SGF 图形设备会将图像信息保存到 SGF 文件中。其使用方式为：

#. 启用 sgf 图形设备
#. 绘图到 sgf
#. 关闭sgf设备，退出SAC
#. 将sgf文件转换为其它格式

.. code-block:: bash

    SAC> fg seis
    SAC> bd sgf         # 启动 sgf 设备，不可省略
    SAC> p
    SAC> ed sgf         # 关闭 sgf 设备，可省略
    SAC> q
    $ ls
    f001.sgf            # 生成 sgf 文件

生成的 sgf 文件可以通过 ``sgftops`` 等命令转换为其它图像格式，
在 :doc:`/tools/sgftops` 中会介绍，也可以使用 ``sgftox`` 直接
将 sgf 文件显示在绘图窗口中。

PS 和 PDF
---------

自 v101.5 之后，SAC 加入了 :doc:`/commands/saveimg` 命令，可以将当前 xwindow
或 sgf 图形设备中的图像保存到其它 PS 或 PDF 格式的图像文件中，以获得更高质量
的绘图效果\ [1]_。

.. code-block:: bash

    SAC> fg seis
    SAC> p                      # 首先在 xwindows 上绘图
    SAC> saveimg foo.ps         # 将 xwindows 上的图像保存到 foo.ps 中
    save file foo.ps [PS]
    SAC> q

pssac
-----

pssac 原是 Prof. Lupei Zhu 基于 GMT4 写的用于绘制SAC波形文件的独立程序。
从GMT 5.3.0版本开始，GMT 内置了 pssac 程序。
得益于 GMT 绘图的灵活性和，pssac 可以绘制出超高质量的复杂图像。
具体参见 :doc:`/tools/pssac` 一节。

小结
----

-  在 xwindows 上绘图简单省事，直接截图的效果较差，仅可用于非正式的演示；
-  sgf 转换为其它图像格式稍显麻烦，但适合在脚本中批量做图；
-  saveimg 生成图像文件质量相对较高，可以满足大多数需求；
-  pssac 功能强大，在一般绘图以及复杂图像时非常有用，适合在发表文章时使用；

.. [1] 该命令也支持输出为png和xpm格式，但 png 和 xpm为位图图像格式，精度不够，
   且依赖于其它函数库，因而不推荐使用。
