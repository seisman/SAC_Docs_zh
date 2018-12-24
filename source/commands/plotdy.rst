plotdy
======

概要
----

绘制一个带有误差棒的图

语法
----

.. code-block:: bash

    PLOTDY [ASPECT ON|OFF] name|number [name|number]

输入
----

ASPECT ON|OFF
    ON 表示保持3/4的纵横比。
    OFF 允许纵横比随着窗口维度的变换而变换

name
    数据文件列表中数据名

number
    数据文件列表中的数据号

说明
----

这个命令允许你绘制一个带有误差棒的数据集。你选择的第一个数据文件（通过
名字或文件号指定）将沿着y轴绘制第二个数据文件是 dy 值，如果选择了第三个
数据文件则其为正的 dy 值

示例
----

假定你有一个等间距的 ASCII 文件，其包含了两列数据。第一列是y值，第二列是
dy 值，你可以像下面那样读入 SAC 并用数据绘制误差棒：

.. code-block:: bash

    SAC> readtable content yy myfile
    SAC> plotdy 1 2
