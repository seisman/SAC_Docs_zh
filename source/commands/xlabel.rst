xlabel
======

概要
----

定义 X 轴标签及属性

语法
----

.. code-block:: bash

    XLABeL [ON|OFF|text] [Location Top|Bottom|Right|Left]
        [Size Tiny|Small|Medium|Large]

输入
----

text
    打开X轴标签选项，设置标签为 ``text``\ 。若文本含空格，需要用引号括起来

ON
    打开X轴标签选项，但不改变标签文本

OFF
    关闭X轴标签选项

LOCATION
    设定X轴标签的位置。可以取 ``TOP``\ 、\ ``BOTTOM``\ 、
    ``RIGHT``\ 、\ ``LEFT``

SIZE
    改变绘图标签的文本尺寸

TINY
    每行132个字符

SMALL
    每行100个字符

MEDIUM
    每行80字符

LARGE
    大尺寸，每行50字符

缺省值
------

.. code-block:: bash

    xlabel off location bottom size small

说明
----

若打开 X 轴标签选项，则绘图时会在图上显示 X 轴标签。标签的尺寸和位置以及
文本均可以改变。文本质量以及字体可以使用 :doc:`/commands/gtext`
命令设置。
