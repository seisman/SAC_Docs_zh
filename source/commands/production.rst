production
==========

概要
----

控制生产模式的开关

语法
----

.. code-block:: bash

    PRODuction ON|OFF

输入
----

ON|OFF
    打开/关闭生产模式

缺省值
------

.. code-block:: bash

    production off

说明
----

当生产模式处于打开状态时，遇到致命错误将立刻终止 SAC 的运行。在生产模式
处于关闭状态时，遇到致命错误后将控制权返回到终端，可以继续执行其他命令。
