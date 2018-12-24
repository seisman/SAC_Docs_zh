xdiv
====

概要
----

控制 X 轴的刻度间隔

语法
----

.. code-block:: bash

    XDIV [NIce|Increment v|NUmber n] [Power ON|OFF]

输入
----

NICE
    由 SAC 自动选择合适的刻度间隔

INCREMENT v
    设置刻度间隔增量为 v

NUMBER n
    设置刻度的总数目数为 n

POWER ON
    打开幂指数选项，SAC 以幂指数形式给出刻度值

POWER OFF
    关闭幂选项

缺省值
------

.. code-block:: bash

    xdiv nice power on

说明
----

该命令控制 X 轴的刻度间隔。多数时候默认的 ``nice`` 间隔即可满足需求。
SAC 的 ``nice`` 刻度间隔是根据坐标轴的最小最大值、坐标轴的长度以及
当前坐标轴文本尺寸来决定的。

也可以使用 ``INCREMENT`` 选项强制刻度间隔为一个定值，或者使用 ``NUMBER``
选项设置刻度间隔的数目。
