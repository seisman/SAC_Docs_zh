symbol
======

概要
----

控制符号绘图属性

语法
----

.. code-block:: bash

    SYMbol [ON|OFF|n] [SIZE v] [SPACING v] [INCREment ON|OFF] [LIST STANDARD|nlist]

输入
----

ON
    打开符号绘图开关，不改变符号号

OFF
    关闭符号绘图开关

n
    打开符号绘图开关。将符号号设置为n。目前有16个不同的符号，符号0意味着关闭符号开关

SIZE v
    设置符号尺寸为v。值为0.01意味着占据整个绘图尺寸的1%

SPACING v
    设置符号间隔为v。这是绘图时符号间的最小间隔；如果你想每个数据点
    都有符号，则设其值为0，对注释行使用0.2到0.4

INCREMENT ON
    对每个数据文件操作完成后按符号列表递增为下一个符号

INCREMENT OFF
    关闭上述 ``INCREMENT`` 选项

LIST nlist
    改变符号表的内容。输入符号号码表。设置表中的第一个符号码，并打开符号绘图开关

LIST STANDARD
    改变到标准符号表。设置表中的第一个符号表，并打开符号绘制选项。

缺省值
------

.. code-block:: bash

    symbol off size 0.01 spacing 0. increment off list standard

说明
----

这些符号属性独立于由 :doc:`/commands/line` 命令定义的画线属性。打开画线选项，
它们也可以用于注释在相同图形上的不同的线。关闭画线选项，则可以绘制散点图。
如果你要将几个数据文件画在同一张图上，也许需要使用不同的符号。这是可以使用
``INCREMENT`` 选项。当这个选项打开时，每次绘制数据文件，都从符号表中
将原来的符号码增加1，缺省符号表包含符号表从2到16的符号，你也可以使用
``LIST`` 选项改变这个表的次序和内容。如果你在绘制一系列重叠绘图，并需要经相同符号用
在相同次序的每个图形上，这样做很有用。符号码为0相当于关闭符号绘制选项。
这个选项用于 ``LIST`` 选项和 ``LINE`` 选项，以在一张图上用线
表示一些数据，用符号表示另外一些数据。

示例
----

为了创建一个散点分布图，关闭画线选项，选择适当的符号，然后绘图：

.. code-block:: bash

    SAC> line off
    SAC> symbol 5
    SAC> plot

为了用符号7、4、6、8注释四条实线，间隔用0.3，用
:doc:`/commands/plot2`  绘图：

.. code-block:: bash

    SAC> line solid
    SAC> sym spacing .3 increment list 7 4 6 8
    SAC> r file1 file2 file3 file4
    SAC> plot2

使用 :doc:`/commands/plot2` 在相同图形上绘制三个文件，第一个文件图形使用
实线无符号；第二个没有线，为三角符号；第三个没有线，带有交叉符号：

.. code-block:: bash

    SAC> read file1 file2 file3
    SAC> line list 1 0 0 increment
    SAC> symbol list 0 3 7 increment
    SAC> plot2
