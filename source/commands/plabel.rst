plabel
======

概要
----

定义通用标签及其属性

语法
----

.. code-block:: bash

    PLABEL [n] [ON|OFF|text] [Size Tiny|Small|Medium|Large]
        [Below|Position x y [a]]

输入
----

n
    设置第 ``n`` 个通用标签的属性，若省略，则在前一通用标签号上加1

text
    设置标签的内容，并打开通用标签选项

ON
    打开通用标签选项，但不改变标签文本

OFF
    关闭绘图标签选项

SIZE TINY|SMALL|MEDIUM|LARGE
    修改通用标签的文本尺寸。\ ``TINY``\ 、\ ``SMALL``\ 、\ ``MEDIUM``\ 、
    \ ``LARGE`` 分别表示一行132、100、80、50个字符

BELOW
    将此标签放在前一标签的下面

POSITION x y a
    定义该标签的位置。其中 ``x`` 的取值为0到1， ``y`` 的取值为0到最大
    视口（一般为0.75），\ ``a`` 是标签相对于水平方向顺时针旋转的角度

缺省值
------

默认字体大小为 ``small``\ ，标签1的位置为 ``0.15 0.2 0.``\ 。
默认其他标签的位置为上一个标签之下。

说明
----

该命令允许你为接下来的绘图命令定义通用的绘图标签。你可以定义每个标签的
位置及文本尺寸。文本质量以及字体可以用 :doc:`/commands/gtext`
命令设定， 也可以使用 :doc:`/commands/title`\ 、\ :doc:`/commands/xlabel`\ 、
:doc:`/commands/ylabel` 生成图形的标题以及轴标签。

示例
----

为绘图定义一系列标签：

.. code-block:: bash

    # 三行标签
    SAC> dg sub local cdv.z
    SAC> plabel 'Sample seismogram' p .12 .5
    SAC> plabel 'from earthquake'
    SAC> plabel 'in Livermore Valley, CA'
    # 放在左下角的标签
    SAC> plabel 5 'LLNL station: CDV' S T P .12 .12
    SAC> p

BUGS
----

-  ``text`` 必须用引号括起来（v101.6a）
-  ``text`` 的最后一个字符会被忽略（v101.6a）
-  ``text`` 不能以 ``on`` 或 ``off`` 开头，会被误解释 为选项 ``on`` 或
   ``off``\ ，前者导致直接出现段错误，后者导致 不显示标签（v101.6a）
