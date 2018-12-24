读取目录下的 SAC 文件
=====================

假设目录 ``data`` 下有一堆 SAC 文件，现在想要将这些 SAC 文件读入内存中，
有如下几种方式。

第一种，先 cd 进入该目录，再读取 SAC 文件：

.. code-block:: bash

    $ cd data/
    $ sac
    SAC> r *.SAC
    SAC> ...
    SAC> q
    $ cd ..

第二种，直接用相对路径读取 SAC 文件：

.. code-block:: bash

    SAC> r data/*.SAC
    SAC> ...

第三种，使用 :doc:`/commands/read`\ 命令的 ``dir`` 选项：

.. code-block:: bash

    SAC> r dir data *.SAC
    SAC> ...

以上算是技巧，下面来说说这其中的陷阱。假设有一堆 SAC 文件，保存在一个名为
``dirraw`` 的目录中，现在想要用第二种方式读取 SAC 文件：

.. code-block:: bash

    SAC> r dirraw/*.SAC
     ERROR 1301: No data files read in.

会发现出现了无法读入数据的错误。这是为什么呢？

严格来说，这算是 SAC 的一个 bug。如上面的第三种方法所示，SAC 的 ``read``
命令有 ``dir`` 选项，用于指定要从哪个目录中读取 SAC 数据。在上面例子中，
因为目录名为 ``dirraw``\ ，SAC在解释 ``r dirraw/*.SAC`` 时出现了一些问题，
SAC 会从 ``dirraw/*.SAC`` 中识别处关键字 ``dir``\ ，然后忽略了后面的其他字符，
因而在 SAC 看来，这个命令实际上等效于 ``r dir``\ ，只给定了关键字 ``dir``\ ，却
没有给定目录名以及要读取的SAC文件名，因而出现了如上所示错误。

因而，要避免这个错误，就要求目录名不要以 ``dir`` 开头。

那么，如果目录名真的是以 ``dir`` 开头的，怎么办呢？第一种方法可以，
第三种方法也可以，第二种方法的修改版也可以：

.. code-block:: bash

    SAC> r ./dirraw/*.SAC
