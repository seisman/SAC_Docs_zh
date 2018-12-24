color
=====

概要
----

控制彩色图形设备的颜色选项

语法
----

.. code-block:: bash

    COLor [ON|OFF|color] [Increment [ON|OFF]] [Skeleton color] [Background color]
        [List Standard|colorlist]

color 是下面中的一个：

.. code-block:: bash

    White|Red|Green|Yellow|BLUe|Magenta|Cyan|BLAck

这里有些参数在缩写的情况下可能会有歧义，请谨慎使用，且\ ``LIST``
选项必须放在命令的最后。

输入
----

ON
    打开颜色选项但是不改变其他选项

OFF
    关闭颜色选项

color
    打开颜色选项并将数据设置为颜色 color

INCREMENT ON
    每个数据文件绘出后，根据 colorlist 的顺序改变颜色

INCREMENT OFF
    不改变数据颜色

SKELETON color
    按照标准颜色名或颜色号修改边框颜色

BACKGROUND color
    修改背景色为 color\ [1]_

LIST colorlist
    改变颜色列表，将数据颜色设置为列表中第一个颜色，并打开颜色开关

LIST STANDARD
    将颜色列表设为标准列表，将数据颜色设置为列表中第一个颜色，并打开颜色开关

缺省值
------

.. code-block:: bash

    color black increment off skeleton black background white list standard

说明
----

该命令控制设备的颜色属性，数据颜色是用于绘制这个数据文件的颜色。当一个数据文件绘制
完毕后，数据颜色可以根据颜色列表自动改变。skeleton 颜色是用于绘制注释轴、标题、网格
、框架的颜色。背景色是空框架在未绘制任何图形之前的颜色。

多数情况下你会选择标准颜色名，比如red，这是与图形设备无关的。然而有时候你可能想选择一个
非标准颜色，比如 aquamarine，这个可以将颜色表装入图形设备来实现。

这个表将特定的颜色、亮度、对比度等与一个数字联系起来，然后你就可以通过设定对应的整数值
选择 aquamarine 作为你的绘图的一个部分的颜色，这个需要点工作量，可是如果你喜欢，这就值得。

如果你正在同一张图上绘制多个数据文件，通过 ``INCRMENT`` 选项可以使得不同数据有不同的颜色。
标准颜色表顺序如下：

.. code-block:: console

    RED, GREEN, BLUE, YELLOW, CYAN, MAGENTA, BLACK

示例
----

为了使数据颜色从红色开始不断变换：

.. code-block:: bash

    SAC> color red increment

为了设置数据颜色为红色，背景白色，蓝色边框：

.. code-block:: bash

    SAC> color red background white skeleton blue

为了设置一个数据颜色不断变换，颜色列表为 red、white、blue，背景色为 aquamarine：

.. code-block:: bash

    SAC> color red increment backgroud 47 list red white blue

上面的例子假设aquamarine是颜色表的47号。

.. [1] 白色背景与黑色线条对比强烈，可以考虑设置背景色为 cyan
