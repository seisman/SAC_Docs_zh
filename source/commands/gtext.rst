gtext
=====

概要
----

控制绘图中文本质量以及字体

语法
----

.. code-block:: bash

    GText [Software|Hardware] [Font n] [SIZE size] [SYStem system] [Name name]

输入
----

SOFTWARE
    绘图中使用软件文本

HARDWARE
    绘图中使用硬件文本

FONT n
    设置软件文本字体为 ``n``\ ，\ ``n`` 取值为1到8

SIZE size
    改变缺省文本大小，可以取 ``TINY``\ 、\ ``SMALL``\ 、
    ``MEDIUM``\ 、\ ``LARGE``\ ，这些缺省文本尺寸的具体大小可以参考
    :doc:`/commands/tsize` 命令

SYSTEM system
    修改字体子系统，可以取值为 ``SOFTWARE``\ 、 ``CORE``\ 、\ ``XFT``

NAME name
    修改 ``CORE`` 或 ``XFT`` 子系统的默认字体名，
    可以取 Helvetica、Times-Roman、Courier、ZapfDingbats

缺省值
------

.. code-block:: bash

    gtext software font 1 size small

说明
----

软件文本使用了图形库的文本显示功能，将每个字符以线段的形式保存起来，因而
可以任意缩放或旋转至任意角度。使用软件文本在不同图形设备上可以产生相同的
结果，但是其速度会慢于硬件文本。目前有8种可用的软件字体：simplex block、
simplex italics、duplex block、duplex italics、complex block、
complex italics、triplex block、riplex italics。

硬件文本使用图形设备自身的文本显示功能，因而文本在不同的设备上尺寸可能
不同，所以使用硬件文本会导致在不同的图形设备上看到不同的图。如果一个设备
有超过一个硬件文本尺寸，那么最接近预期值的那个尺寸将被使用。其最主要优点
在于速度较快，因而当速度比质量重要时可以使用。

示例
----

选择 triplex 软件字体：

.. code-block:: bash

    SCA> gtext software font 6
