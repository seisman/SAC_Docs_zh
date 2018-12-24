wait
====

概要
----

控制 SAC 在输出大量文本或绘制多个图形时是否暂停

语法
----

.. code-block:: bash

    WAIT [Text ON|OFF] [Plots ON|OFF|Every]

输入
----

TEXT ON|OFF
    打开/关闭文本等待选项

PLOTS ON|OFF
    打开/关闭绘图等待选项

PLOTS EVERY
    每个图形之间均等待

缺省值
------

.. code-block:: bash

    wait text on plots on

说明
----

``TEXT`` 选项用于控制当 SAC 输出到终端的内容超过一屏时，是等待用户
输入，还是继续输出。

``PLOTS`` 选项用于控制绘制多张图时是否要暂停。在读取多个数据文件 并
``plot`` 命令绘图时，每个文件将产生一个 frame，正常情况下 SAC 将
在每张图后暂停并发送信息“Waiting”到终端，用户键入回车即可看到下一张图，
或输入“Go”使 SAC 不暂停地绘制剩下的图形，或键入“Kill”终止绘制这组文件。
SAC 绘制完最后一张图后不再暂停，因为 SAC 的输入提示符已经实现了暂停功能。
当这个选项关闭时，SAC 在不同的绘图间不暂停。
