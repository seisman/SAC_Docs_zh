Bash 中调用 SAC
===============

简介
----

SAC 宏的功能相对比较单一，难以满足日常数据处理的需求，可以在 Bash 脚本中
直接调用 SAC，这样可以利用 Bash 脚本的更多特性。

下面的例子展示了如何在 Bash 脚本中调用 SAC：

.. literalinclude:: simple-script.sh
   :language: bash

SAC 在启动时默认会显示版本信息，当用脚本多次调用 SAC 时，版本信息也会
显示多次，可以通过设置 ``export SAC_DISPLAY_COPYRIGHT=0`` 的方式隐藏
版本信息。

脚本中从“``sac << EOF``”开始到“``EOF``”的全部内容，都会被
Bash 传递给 SAC，SAC 会逐一解释并执行每行命令。

头段变量和黑板变量
------------------

想要在Bash脚本中引用头段变量，需要借助于 SAC 宏的语法。

.. literalinclude:: variables.sh
   :language: bash

内联函数
--------

Bash 可以完成基本的数学运算，但是所有的运算只支持整型数据，浮点型运算
或者其它更高级的数学运算需要借助 ``bc`` 或者 ``awk`` 来完成。
Bash 中的变量以“``$``”作为标识符，Bash 会首先做变量替换再将替换后的
命令传递给 SAC。

.. literalinclude:: arithmetic-functions.sh
   :language: bash

本例中的变量“``$var1``” 和 “``$var2``”会首先被 SAC 解释成
为1和2，因而 SAC 实际接收到的命令是“``bp c 1 2``”。

借助于 ``awk``\ 、\ ``sed`` 等工具，也可以实现部分字符串处理函数：

.. literalinclude:: string-functions.sh
   :language: bash

条件判断和循环控制
------------------

Bash 具有更灵活的条件判断和循环控制功能，但由于 Bash 自身的限制，这些特性
仅能在 SAC 外部使用，因而下例中需要多次调用 SAC，在某些情况下会相当耗时。

.. literalinclude:: do-loops.sh
   :language: bash

文件重命名
----------

Bash 下可以借助于 ``awk`` 来实现文件重命名。下面的例子中，首先用
点号对文件名做分割，\ ``$0`` 表示原始文件名，\ ``$7`` 表示用逗号分
割后的第7段字符，即台网名，其他同理。最后将 ``awk`` 的输出传给 ``sh``
去执行。

::

    ls *.SAC | awk -F. '{printf "mv %s %s.%s.%s.%s\n", $0, $7, $8, $9, $10}' | sh
