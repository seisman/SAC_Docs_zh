macOS 编译安装
==============

.. attention::

   ARM 架构的 Mac 安装 xquartz 需要到官网手动下载，Homebrew 安装的不能使用。

.. include:: macos-preparation.rst_

编译源码
--------

.. caution::

   Anaconda 内有软件包和系统软件包冲突。sac 编译的时候需要系统的软件包。
   所以，Anaconda 用户在编译时需要临时重命名 Anaconda 的路径。

按照如下命令即可正确编译源码。需要注意的是，由于 SAC 默认使用的 editline 库
在 macOS 下无法正常编译，因而执行 ``configure`` 时使用了 ``--enable-readline``
选项使得 SAC 使用 readline 库而不是 editline 库。

.. code-block:: console

    $ tar -xvf sac-102.0.tar.gz
    $ cd sac-102.0
    $ mkdir build
    $ cd build
    $ ../configure --prefix=/usr/local/sac
    $ make
    $ sudo make install

.. include:: macos-configurations.rst_
