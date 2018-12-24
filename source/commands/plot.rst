plot
====

概要
----

绘制单波形单窗口图形

语法
----

.. code-block:: bash

    Plot

说明
----

每个数据文件绘制在单独窗口中，图形的大小由 :doc:`/commands/xvport`
和 :doc:`/commands/yvport` 决定。每个图形的Y轴范围由数据的极值决定，也可以用
:doc:`/commands/ylim` 手动限制 Y 轴的范围。
X轴的范围由 :doc:`/commands/xlim` 命令控制。
用户可以用 :doc:`/commands/fileid` 控制每张图的文件ID，
也可以用 :doc:`/commands/picks` 控制时间标记的显示。

SAC 会在每张图之间暂停给你机会检查每张图，其将会在终端输出 ``Waiting``
并等待你的响应。你可以输入回车以查看下一张图，关键字 ``go`` 或 ``g``
可以不暂停地绘制余下的所有文件，或者关键字 ``kill`` 或 ``k``
可以中止绘制余下的文件。
