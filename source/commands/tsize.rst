tsize
=====

概要
----

控制文本尺寸属性

语法
----

.. code-block:: bash

    TSIZE [Tiny|Small|Medium|Large v ] [Ratio v] [OLD|NEW]

输入
----

TINY|SMALL|MEDIUM|LARGE v
    设定标准文本尺寸的值为 ``v``

RATIO v
    设定文本的宽高比为 ``v``

OLD
    将所有文本尺寸值设置为旧值。旧值即 SAC 9 之前的版本中的文本尺寸值

NEW
    设定所有文本尺寸值为 SAC 初始化时的缺省值

缺省值
------

.. code-block:: bash

    tsize ratio 1.0 new

说明
----

大多数的文本注释命令（:doc:`/commands/title` 、:doc:`/commands/xlabel` 、
:doc:`/commands/fileid` 等）允许你改变要显示的文本的尺寸。

SAC提供了四个标准尺寸：\ ``TINY``\ 、\ ``SMALL``\ 、\ ``MEDIUM`` 和
``LARGE``\ 。每一个标准尺寸都有一个初始值，如下表所示：

.. table:: SAC标准文本尺寸
   :align: center

   ======= ====== === === === =====
   NAME    A      B   C   D   E
   ======= ====== === === === =====
   TINY    0.015  66  50  68  110
   SMALL   0.020  50  37  66  82
   MEDIUM  0.030  33  25  44  55
   LARGE   0.040  25  18  33  41
   ======= ====== === === === =====

上面每列的定义如下：

-  A 字符高度相对整个视窗的高度的比值
-  B 全视窗下文本的行数
-  C 正常视窗下文本的行数。正常视窗是指x为0.0到1.0，y为0.0到0.75
-  D 正常视窗中，每行的最小字符数
-  E 正常视窗中每行字符的平均数

``tsize`` 命令允许你重新定义这四个标准尺寸的大小以及宽高比。

从 SAC 9 开始，系统的默认文本尺寸发生了变化，新的尺寸集覆盖了更宽的
尺寸范围，在多数设备上看上去更好。你可以使用 ``OLD`` 选项将文本
尺寸修改为之前版本的文本尺寸。

示例
----

为了改变 ``MEDIUM`` 的定义，并使用它创建一个特别尺寸的标题：

.. code-block:: bash

    SAC> tsize medium 0.35
    SAC> title 'rayleigh wave spectra' size medium
    SAC> plot2

为了重置文本尺寸到其默认值：

.. code-block:: bash

    SAC> tsize new
