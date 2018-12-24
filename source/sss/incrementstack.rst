incrementstack
==============

概要
----

叠加文件列表中的增量属性

语法
----

.. code-block:: bash

    IncrementStack

缺省值
------

缺省值为0

说明
----

可以设定增量的属性包括静态时间延迟、视速度和速度模型中的截距时间。若属性
增量为0.0，则属性值不改变。

可以为视速度或速度模型截距时间设置增量，其他属性值则自动计算以保持在特定点的零时间延迟。

示例
----

.. code-block:: bash

    SAC/SSS> addstack filea
    SAC/SSS> addstack fileb
    SAC/SSS> addstack filec
    SAC/SSS> addstack filed
    SAC/SSS> velocitymodel 1 refr vapp 7.9 vappi 0.1 tovm calc dist 320. tvm 45.
    SAC/SSS> sumstack
    SAC/SSS> writestack stack1
    SAC/SSS> incrementstack
    SAC/SSS> sumstack
    SAC/SSS> writestack stack2
    SAC/SSS> incrementstack
    SAC/SSS> sumstack
    SAC/SSS> writestack stack3

上面的命令会产生三个叠加文件，即stack1、stack2、stack3。叠加时使用折射波
速度模型，视速度VAPP分别为7.9、8.0、8.1。速度模型截距时间TOVM自动计算以
保证在 320km、45s 处具有零时间延迟。
