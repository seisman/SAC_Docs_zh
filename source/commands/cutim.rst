cutim
=====

概要
----

截取内存中的文件

语法
----

.. code-block:: bash

    CUTIM pdw [pdw ... ]

输入
----

pdw
    要截取的时间窗，参考 :ref:`subsec:pdw`

缺省值
------

如果起始或结束 ``offset`` 省略则认为其为0，如果起始参考值省略则认为其为
``Z``\ ，如果结束参考值省略则认为其值与起始参考值相同。

说明
----

:doc:`/commands/cut` 命令设置截窗选项，仅对即将读取的文件进行截窗，而对内存
中的数据没有效果。\ ``cutim`` 则在这个命令给出的时候对内存中的数据
进行截窗操作。

用户可以用 :doc:`/commands/read` 读入文件，然后用 ``cutim`` 对
内存中的文件直接进行截窗。\ ``cutim`` 也允许使用多个截取区间，用户
可以读三个文件到内存，然后使用有4个截取区间的 ``cutim`` 命令，
最终内存中将得到12个文件。

示例
----

下面的宏文件展示了 ``cutim`` 命令的常见用法：

.. code-block:: bash

    fg seismo
    echo on
    * no cutting
    lh b e a kztime
    * begin to end---same as not cutting.
    cutim B E
    lh b e a kztime
    fg seismo
    * First 3 secs of the file.
    cutim B 0 3
    lh b e a kztime
    fg seismo
    * From 0.5 secs before to 3 secs after first arrival
    cutim A -0.5 3
    lh b e a kztime
    fg seismo
    * From 0.5 to 5 secs relative to disk file start.
    cutim 0.5 5
    lh b e a kztime
    fg seismo
    * First 3 secs of the file and next 3 sec
    cutim b 0 3 b 3 6
    lh b e a kztime
    p1

限制
----

目前不支持截取非等间隔数据或谱文件

BUGS
----

-  执行该命令会错误地删除内存中的全部波形数据（v101.6a）
