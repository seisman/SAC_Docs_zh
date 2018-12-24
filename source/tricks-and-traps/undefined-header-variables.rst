未定义的头段变量
================

处理数据的时候会遇到一种情况，用 SAC 读入数据后，可以用 ``lh`` 查看到某个头段
变量的值，但是直接使用 ``saclst`` 却发现头段变量的值未定义。

直接读入 SAC 查看头段变量 ``dist`` 的值：

.. code-block:: bash

    SAC> r XXXX.SAC
    SAC> lh dist
         dist = 3.730627e+02

用 ``saclst`` 查看同一个文件的头段变量 ``dist`` 的值：

.. code-block:: console

    $ saclst dist f XXXX.SAC
    XXXX.SAC        -12345.0

用两种方法查看头段变量的值得到的结果不同，出现这种情况的原因，这个 SAC
数据中 ``dist`` 本身是没有定义的，当 SAC 读入该数据时，会自动计算并更新
``dist`` 的值，所以使用 ``lh`` 会得到正确的 ``dist`` 值，而 ``saclst``
是直接读取数据文件的头段，并不会对重新计算，因而 ``saclst`` 得到的是未定义值。
也就是说，\ ``saclst`` 得到的是文件中保存的值，\ ``lh`` 得到的是数据中应该
保存的值。

如果想要 ``saclst`` 也获取正确的值，可以先用 SAC 把数据读进去，待 SAC 把头段
更新后，再写回到磁盘中：

.. code-block:: bash

    SAC> r *.SAC
    SAC> wh
    SAC> q

经常会出现这些问题的头段变量，换句话说，SAC 在读入数据时会自动更新的
头段变量包括：\ ``depmax``\ 、\ ``depmin``\ 、\ ``depmen``\ 、
``e``\ 、\ ``gcarc``\ 、\ ``dist`` 等。
