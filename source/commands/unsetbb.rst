unsetbb
=======

概要
----

删除黑板变量

语法
----

.. code-block:: bash

    UNSETBB ALL|variable ...

输入
----

ALL
    删除已定义的全部黑板变量

variable
    删除黑板变量 ``variable``

示例
----

一次删除多个黑板变量：

.. code-block:: bash

    SAC> unsetbb c1 c2 x

删除所有黑板变量：

.. code-block:: bash

    SAC> unsetbb all
