pickprefs
=========

概要
----

用于控制 SAC 管理震相和/或从不同的输入数据格式（例如CSS、GSE、SUDS...）
读入到时间标记变量 ``T0`` 到 ``T9``\ ，若这个选项为 OFF（缺省状态），
则载入到时间标记的震相为 SAC 在输入文件中发现的第一个拾取，如果这个选项为 ON，
SAC 将使用 :doc:`/commands/readcss` 命令中描述的参考文件

语法
----

.. code-block:: bash

    PICKPRefs ON|OFF

输入
----

ON
    指示 SAC 通过参考文件将到时信息由 CSS 缓冲区传送到 SAC 缓冲区。
    这对于需要特定到时位于特定头段变量的宏文件来说很有用

OFF
    指示 SAC 绕过参考文件，载入给定文件的前10个震相拾取。这个是
    默认值，它允许用户注意一些在 ``PICKPREFS ON`` 时无法注意的拾取。

缺省值
------

.. code-block:: bash

    pickprefs off

说明
----

从版本0.58开始，sac2000 就有两个不同的头段缓冲区：一个根据 SAC 文件格式构建，
一个根据有关的 CSS3.0 文件格式。添加了 CSS 数据缓冲区使得读取如 CSS、GSE、SUDS
等这里相关格式变得更加容易。两个缓冲区同时也使得下面的几个命令得以使用：
COMMIT、ROLLBACK、RECALLTRACE。有两个缓冲区的一个缺点是将到时从动态的 CSS
到时表转移到SAC格式中相对静态的 ``Tn`` 拾取变得更加复杂了，这个问题
在0.58版本中通过设置了一个称为 csspickprefs 的参考文件得以解决。这个文件在
``$SACAUX`` 目录下，你可以覆盖它写入你想要的信息。更多关于 csspickprefs
的信息，参见 :doc:`/commands/readcss` 命令。关于如何覆盖默认参考文件，
参看 :doc:`/commands/pickauthor` 或 :doc:`/commands/pickphase`\ 。

使用参考文件的缺点是它将只接收列在参考文件中或在命令
:doc:`/commands/pickphase`\ 、\ :doc:`/commands/pickauthor` 中
输入的震相或作者列表。换句话说，如果一个 CSS 数据文件有一个 ``pP``
的到时，不管其来自于平面文件还是 Oracle 数据库， 而 ``pP``
未在参考文件中指定，那么用户就绝不会知道 ``pP`` 在那里。\ ``pP``
震相将读入 SAC 中的 CSS 数据缓冲区，但是它不会转变到 SAC 数据缓冲区中，
也不会参与任何 SAC 命令。它可以通过 :doc:`/commands/writecss`
命令写出，或者可能通过 COMMIT 命令刷新然后全部丢失。

SAC 给出的解决办法是允许用户绕过参考文件。在0.59版本中，默认是从 CSS 缓冲区
中直接读入前10个可用的拾取到 SAC 缓冲区中，通过这个新命令的使用，用户可以
告诉 SAC 使用指定的参考文件。
