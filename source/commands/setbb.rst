setbb
=====

概要
----

设置黑板变量的值

语法
----

.. code-block:: bash

    SETBB variable [APPEND] value [variable [APPEND] value ...]

输入
----

variable
    黑板变量名，可以是一个新变量或一个已经有值的变量， 变量名最长32字符

value
    黑板变量的新值，若包含空格则必须用引号括起来

APPEND
    将值加到变量的旧值之后，若无该选项，则新值将代替旧值

说明
----

``setbb`` 命令可以给黑板变量赋值，这些值可以通过 :doc:`/commands/getbb` 命令获取，
或在命令中直接引用。可以使用 :doc:`/commands/evaluate` 对黑板变量做基本算术操作，
并将结果保存在新的黑板变量中，也可以通过 :doc:`/commands/unsetbb` 命令删除
一个黑板变量。

示例
----

同时设置多个黑板变量，并在稍后使用使用这些黑板变量：

.. code-block:: bash

    SAC> setbb c1 2.45 c2 4.94
    SAC> bandpass corners %c1% %c2%

黑板变量的值中包含空格：

.. code-block:: bash

                                # 含空格的值需要用引号括起来
    SAC> setbb mytitle 'sample filter response'
    SAC> getbb mytitle          # 检查变量值是否正确
     MYTITLE = Sample filter response
    SAC> title '%MYTITLE%'      # 引用时需要再次用引用括起来
