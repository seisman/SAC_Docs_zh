plot2
=====

概要
----

产生一个多波形单窗口绘图

语法
----

.. code-block:: bash

    Plot2 [Absolute|Relative]

输入
----

ABSOLUTE|RELATIVE
    绝对/相对绘图模式

缺省值
------

.. code-block:: bash

    p2 absolute

说明
----

所有波形数据将绘制在一个绘图窗口中，所有波形共用X轴和Y轴。:doc:`/commands/xlim`
和 :doc:`/commands/ylim` 用于控制 X 轴和 Y 轴的范围，若未指定轴范围，则根据所有
文件的极值确定轴范围。由于所有波形重叠在一起，所以通常需要用
:doc:`/commands/line`\ 、\ :doc:`/commands/color`\ 、\ :doc:`/commands/symbol`\ 、
:doc:`/commands/width` 为不同波形 设置不同的属性，图例的位置由
:doc:`/commands/fileid` 控制。

多个波形共用 X 轴时，有 ``absolute`` 和 ``relative`` 两种绘图模式。在
``absolute`` 模式下，所有波形将按照其绝对时刻对齐，即 X 轴
表示相对于某个固定参考时刻的秒数；在 ``relative`` 模式下，所有数据
将按照文件开始时间对齐，X 轴的范围为0到最大时间差（所有文件中结束时间和
开始时间的最大时间差，即最大 ``e-b``\ ），每个波形从 X 轴的零点开始绘制。

与 :doc:`/commands/plot` 和 :doc:`/commands/plot1` 不同，\ :doc:`/commands/plot2`
可以直接用于绘制谱文件。实部-虚部格式的谱数据被绘制为实部-频率。振幅-相位
数据被绘制为振幅-频率图，虚部和相位信息被忽略。谱文件总是用 ``relative``
模式绘图。在频率域 ``b``\ 、\ ``e`` 和 ``delta`` 分别被设置为0、
Nqquist频率以及频率间隔 ``df``\ 。头段值 ``depmin`` 和 ``depmax``
未改变。与 :doc:`/commands/plotsp` 类似，若 ``xlim off``\ ，绘图将
从 ``df=delta`` 处开始，而非0。若 :doc:`/commands/xlim` 或 :doc:`/commands/ylim`
在数据变换到频率域之前被改变了，最好在使用 ``plot2`` 绘图之前输入
``xlim off`` 和 ``ylim off``\ 。

若内存中同时存在时间序列文件和谱文件，且绘图时没有选择 ``relative``
模式，则时间序列将以绝对模式绘图，谱文件将以相对模式绘图绘图。相对
模式意味着相对于第一个文件，因而内存中文件的顺序将影响绘图之间的关系。

示例
----

.. code-block:: bash

    SAC> read mnv.z.am knb.z.am elk.z.am
    SAC> xlim 0.04 0.16
    SAC> ylim 0.0001 0.006
    SAC> linlog
    SAC> symbol 2 increment
    SAC> title 'rayleigh wave amplitude spectra for nessel'
    SAC> xlabel 'frequency (Hz)'
    SAC> plot2
    SAC> fft
    SAC> xlim off ylim off
    SAC> line increment list 1 3
    SAC> plot2
