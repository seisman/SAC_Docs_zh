plotpk
======

概要
----

绘图并拾取震相到时

语法
----

.. code-block:: bash

    PlotPK [Perplot ON|OFF|n] [Bell ON|OFF] [Absolute|Relative]
        [REFerence ON|OFF|v] [Markall ON|OFF] [Saveloc ON|OFF]

输入
----

PERPLOT n
    一张图绘制 ``n`` 个文件

PERPLOT ON
    一张图绘制 ``n`` 个文件，使用 ``n`` 的旧值

PERPLOT OFF
    一张图上绘制所有文件

BELL ON|OFF
    绘图区内击键时是否响铃

ABSOLUTE|RELATIVE
    绝对/相对绘图模式

REFERENCE ON|OFF
    是否显示参考线

REFERENCE v
    显示参考线，并设置参考值为 ``v``

MARKALL ON
    一次标记一张图上所有文件的到时

MARKALL OFF
    只标记光标位置所对应的震相到时

SAVELOCS ON|OFF
    是否将 ``L`` 命令（\ :numref:`table:plotpk-commands`\ ）拾取的位置保存
    到黑板变量中

缺省值
------

.. code-block:: bash

    plotpk perplot off absolute reference off markall off savelocs off

说明
----

执行该命令后，即进入 ``ppk`` 模式，可用于手动拾取震相。在 ``ppk``
模式下，键盘的输入将被解释为 ppk 命令（\ :numref:`table:plotpk-commands`\ ）。
详情请参考 :doc:`/data-process/picking-phase` 一节。

``PERPLOT`` 选项用于控制每张图上显示的文件数目，在标记三分量数据时
通常设置为“``p 3``”，使得一次显示一个台站的三分量数据。

在一张图上绘制多个波形时，所有波形共用 X 轴，此时存在 ``absolute`` 和
``relative`` 两种绘图模式。在 ``absolute`` 模式下，所有波形将
按照其绝对时刻对齐，即X轴表示对于\ **某个固定参考时刻**\ 的秒数；在 ``relative``
模式下，所有波形将按照自己的参考时刻对齐，即X轴表示相对于\ **各自参考时刻**\ 的
秒数。

在标记震相到时时，默认只会标记光标位置所对应的波形文件。\ ``MARKALL``
选项可以一次标记当前绘图窗口内的所有波形，该选项会获取光标位置所对应的
横坐标值，并将其标记到当前绘图窗口内所有波形的头段变量中。该选项常用于
一次性拾取单个台站三分量的震相到时，需要注意的是，若三分量数据的参考
时刻不同，使用 ``MARKALL`` 标记的到时则是错的。

若使用 ``SAVELOCS`` 选项，则会将 ``L`` 命令所拾取的当前光标
位置会保存到黑板变量中：

-  ``NLOCS``\ ：每次执行 ``ppk`` 命令时，该变量初始化为0， 每使用 ``L``
   命令拾取一次光标位置，其值加1
-  ``XLOCn``\ ：保存第 ``n`` 次光标拾取的位置的X值；若参考时刻
   ``kzdate`` 和 ``kztime`` 有定义，则 ``XLOCn``
   保存绝对时刻的值，否则保存时间偏移的秒数
-  ``YLOCn``\ ：保存第 ``n`` 次光标拾取的位置的Y值

BUGS
----

-  ``BELL`` 选项在某些平台上不可用（v101.6a）
-  ``REFERENCE`` 选项无效（v101.6a）
-  按照说明文档，绘图时默认使用 ``absolute`` 模式，但似乎代码存在
   Bug。某些情况下默认使用 ``relative`` 模式，但在查看若干头段变量
   之后再绘图，则会使用 ``absolute`` 模式（v101.6a）

   示例代码如下：

   .. code-block:: bash

       SAC> dg sub local cdv.z
       SAC> w 1.SAC
       SAC> ch nzsec 50
       SAC> w 2.SAC
       SAC> r *.SAC
       SAC> ppk            # 第一次绘图为 relative 模式
       SAC> lh kztime      # 查看头段变量的值
       SAC> ppk            # 第二次绘图为 absolute 模式
