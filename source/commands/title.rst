title
=====

概要
----

定义绘图的标题和属性

语法
----

.. code:: bash

    TITLE [ON|OFF|text] [L\verb|OCATION| T\verb|OP||B\verb|OTTOM||R\verb|IGHT||L\verb|EFT|]
        [S\verb|IZE| T\verb|INY||S\verb|MALL||M\verb|EDIUM||L\verb|ARGE|]

输入
----

text
    显示标题，并设置标题内容，若 ``text`` 包空格，则需要 用引号括起来

ON
    显示标题，但不改变标题内容

OFF
    不显示标题

LOCATION
    设置标题的位置，可以取 ``TOP``\ 、\ ``BOTTOM``\ 、
    ``RIGHT``\ 、\ ``LEFT``

SIZE
    设置标题的尺寸，可以取 ``TINY``\ 、\ ``SMALL``\ 、
    ``MEDIUM``\ 、\ ``LARGE``

缺省值
------

title off location top size small

说明
----

若打开该选项，则在每个图形上都显示标题，标题的尺寸、位置及内容均可改变，
文本质量和字体可以通过 :doc:`/commands/gtext` 命令设置。
