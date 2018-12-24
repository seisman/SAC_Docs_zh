saveimg
=======

概要
----

将绘图窗口中的图像保存到多种格式的图像文件中

语法
----

.. code-block:: bash

    SAVEimg filename.format

输入
----

filename
    要保存的图像的文件名

format
    图像文件格式，支持 PS、PDF、PNG 和 XPM

说明
----

该命令将当前绘图窗口中的图像保存到图像文件中，可用的格式包 PS、PDF、PNG
和 XPM，命令会根据图像文件的扩展名自动识别文件格式。

``saveimg`` 相对于 SGF 文件的好处在于，SGF 文件中的字母和数字是由线段
组成的，而 ``saveimg`` 产生的 ps 或 pdf 图像采用 Postscript 的特性直接
产生字体。对大多数情况，低精度的 png 或 xpm 文件也能满足要求。出于可移植性的
考虑，SAC 默认是不支持 PNG 格式的。

png 和 xpm 将拥有当前窗口的横纵比，pdf 或 ps 文件拥有固定的横纵比X/Y=11/8.5=1.2941，
对这些绘图，如果显示窗口设置为1.2941会看起来比较好。

与SGF文件类似，\ ``saveimg`` 生成的 PS 文件是没有 BoundingBo x的。
对于 sgf 文件，脚本 ``sgftoeps.csh`` 可以生成一个有 BoundingBox 的 eps 文件。
对于 ``saveimg`` 生成的PS文件，目前还没有相应的脚本。

为了使用 ``saveimg`` 保存一个绘图，图像必须是可见的，即通过
:doc:`/commands/plot`\ 、\ :doc:`/commands/plot1` 等命令绘制出来。
``saveimg`` 在子程序 SSS 中无法工作，但如果输入 :doc:`/commands/quitsub` 退出子程序，
此时图像窗口未关闭，\ ``saveimg`` 此时可用于保存该图像。另外如果使用了
:doc:`/commands/beginframe` 命令在一个窗口中绘制多张图，必须等到执行
:doc:`/commands/endframe` 命令之后方可使用 ``saveimg`` 命令。

示例
----

将图像保存为 PDF 文件：

.. code-block:: bash

    SAC> read PAS.CI.BHZ.sac
    SAC> p1
    SAC> saveimg pas.ci.pdf

将谱图用多种格式保存：

.. code-block:: bash

    SAC> fg seismo
    SAC> spectrogram
    SAC> save spectrogram.ps
    SAC> save spectrogram.png
    SAC> save spectrogram.pdf
