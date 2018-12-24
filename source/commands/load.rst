load
====

概要
----

导入外部命令（在 SAC 的 Linux 版本中外部命令的导入需要额外的工作）

语法
----

.. code-block:: bash

    LOAD comname [ABBREV abbrevname]

输入
----

comname
    从一个共享目标文件中载入的一个外部函数名

ABBREV abbrevname
    命令的简写

说明
----

该命令允许用户载入由 SAC 外部命令接口写的命令。该命令必须是一个储存在动态
库文件 ``.so`` 文件中。SAC 将检查所有环境变量 ``SACSOLIST`` 中的
动态库文件，这个环境变量需要包含一个或多个动态库文件，每个库文件以空格分割。
到这些动态库文件的路径必须在环境变量 ``LD_LIBRARY_PATH`` 中指定。如果
``SACSOLIST`` 未设置，则SAC将使用由 ``LD_LIBRARY_PATH`` 中
指定的路径在动态库文件 ``libsac.so`` 中寻找。一个叫做 ``libcom.so``
的库随着 SAC 发布。

示例
----

设置你的环境变量使得 SAC 在当前目录从库文件 ``libbar.so`` 中查找一个称为
``foo`` 的命令，并为 foo 设置别名为 myfft：

.. code-block:: bash

    % export SACSOLIST = "libcom.so libbar.so"
    #  Add the current directory to the search path.
    % export LD_LIBRARY_PATH {$LD_LIBRARY_PATH}:.
    % sac
    SAC> load foo abbrev myfft* load the command
    SAC> read file1.z file2.z file3.z
    SAC> myfft real-imag* invoke command with its arguments,
    * commands must parse their own args.
    SAC> psp

如何创建一个包含你的命令的共享目标库：

.. code-block:: bash

    Solaris::
    cc -o libxxx.so -G extern.c foo.c bar.c
    SGI::
    cc -g -o libxxx.so -shared foo.c bar.c
    LINUX: (gcc)::
    gcc -o libxxx.so -shared extern.c foo.c bar.c sac.a

其中sac.a可以从你得到sac的地方获得

SAC发布的外部命令
-----------------

在 SAC 的发布版中有一个外部命令，叫做 ``FLIPXY``\ 。\ ``FLIPXY``
将一个或多个 X-Y 数据文件作为输入，并调换 X 和 Y。这个命令在
``${SACAUX}/external`` 中的 ``libcom.so`` 中，同时还有 ``FLIPXY``
的源代码作为参考。为了导入 ``FLIPXY``\ ，\ ``libcom.so`` 必须包含在
``$SACSOLIST`` 中。
