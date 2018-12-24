axes
====

概要
----

控制注释轴的位置

语法
----

.. code-block:: bash

    AXES [ON|OFF|ONLy] [All] [Top] [Bottom] [Right] [Left]

输入
----

ON
    显示列表中指定的注释轴，其他不变

OFF
    不显示列表中指定的注释轴，其他不变

ONLY
    只显示列表中指定的注释轴，其他的不显示

ALL
    指定所有四个注释轴

TOP
    绘图上部的 X 注释轴

BOTTOM
    绘图下部的 X 注释轴

RIGHT
    绘图右侧的 Y 注释轴

LEFT
    绘图左侧的 Y 注释轴

缺省值
------

.. code-block:: bash

    axes only bottom left

即只有下边和左边使用注释轴

说明
----

坐标轴可以绘制在一张图四边的任意一或多个边，有很多命令可以控制坐标轴
长什么样。坐标轴的注释间隔用 :doc:`/commands/xdiv`
命令设定（即隔多长显示一个数字），刻度标记的间距可以用
:doc:`/commands/ticks` 命令单独控制。

``only`` 表示仅在后面列表中指定的边上使用注释轴，而 ``on`` 和 ``off``
则表示仅对列表中的边打开或关闭注释轴，对其他不在列表中的边不起作用。

要获得自己想要的效果，使用 ``on`` 或者 ``off`` 时你必须要知道
当前已经显示的轴有哪些，哪些是你想要打开或关闭的。这是一个有点容易弄错的
问题，不如只使用 ``only`` 加上想要显示的轴更加简单一点。

示例
----

.. code-block:: bash

    SAC> fg seis
    SAC> p           # 看看 SAC 的默认设置，左边和底部有注释
    SAC> axes on t   # 打开顶部注释，左边和底部注释依然保留
    SAC> p           # 看到的结果是只有顶部注释，没有左边和底部注释，
                     # 这里和说明中强调的不一样，应该是程序的 bug，
                     # 将 on 认为是 only 的简写了
    SAC> axes on a   # 打开所有注释轴
    SAC> axes off b  # 仅关闭底部注释轴（off 选项和说明是一致的）
    SAC> axes only b # 仅显示底部注释轴
