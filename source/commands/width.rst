width
=====

概要
----

控制线宽

语法
----

.. code-block:: bash

    WIDTH [ON|OFF|width] [SKeleton width] [Increment ON|OFF] [List Standard|widthlist]

其中 ``width`` 只能取整数

输入
----

WIDTH width
    设置数据的线宽为 ``width``

WIDTH ON
    打开 ``WIDTH`` 选项但是不改变当前线宽值

WIDTH OFF
    关闭 ``WIDTH`` 选项

SKELETON width
    设置图形边框宽度为 ``width``

LIST STANDARD
    设置为标准线宽列表，设置数据宽度为标准列表中的 第一个宽度，并打开 ``WIDTH`` 选项

LIST widthlist
    改变宽度列表的内容。输入宽度列表。设置数据宽度为列表中的第一个宽度，
    并打开 ``WIDTH`` 选项

INCREMENT ON
    按照 ``widthlist`` 表中的次序，依次改变一个宽度值

INCREMENT OFF
    关闭线宽递增功能

缺省值
------

.. code-block:: bash

    width off skeleton 1 increment off list standard

说明
----

``width`` 指定了绘制数据时的线条宽度。\ ``SKELETON``\ 指定了
坐标轴的宽度，其就仅修改坐标轴的宽度，网格、文本、标签和框架号总是
用1号细线表示。

若将 ``WIDTH`` 设置为递增，则每次绘图之后，宽度都会按照宽度表中的
顺序自动修改。

如果在同一张绘图中同时绘制几个数据文件，也许需要对每个文件使用不同的宽度。
此时可使用 ``INCREMENT`` 选项。在这个选项打开时，每次绘制一个数据
文件后，都按照宽度表中的次序自动地变成另一个宽度。宽度值和次序在标准宽度
表中为:

.. code-block:: bash

    1, 2, 3, 4, 5, 6, 7, 8, 9, 10

你可以使用 ``LIST`` 选项改变这个表的次序或内容。这个命令常用于
重叠绘图（参见 :doc:`/commands/plot2`\ ），此时你可能需要每张图上的数据宽度
都按相同的顺序排列。

示例
----

选择自动变换的数据宽度起始值为1：

.. code-block:: bash

    SAC> width 1 increment

边框宽度起始值为2，并按1、3、5的增量变化：

.. code-block:: bash

    SAC> width skeleton 2 increment list 1 3 5
