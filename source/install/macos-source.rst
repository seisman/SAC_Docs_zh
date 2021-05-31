macOS 编译安装
==============

.. attention::

   SAC 源代码年代久远，与现行的语法不相容。所以，实际上 macOS 上不能编译 SAC ，无解决办法。

.. attention::

   ARM 架构的 Mac 需要到官网手动下载 xquartz，Homebrew 安装的不能使用。

.. include:: macos-preparation.rst_

编译源码
--------

按照如下命令即可正确编译源码。需要注意的是，由于 SAC 默认使用的 editline 库
在 macOS 下无法正常编译，因而执行 ``configure`` 时使用了 ``--enable-readline``
选项使得 SAC 使用 readline 库而不是 editline 库。

.. code-block:: console

    $ tar -xvf sac-101.6a_source.tar.gz
    $ cd sac-101.6a
    $ mkdir build
    $ cd build
    $ ../configure --prefix=/usr/local/sac --enable-readline
    $ make
    $ sudo make install

.. include:: macos-configurations.rst_
