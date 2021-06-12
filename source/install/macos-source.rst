macOS 编译安装
==============

.. attention::

   ARM 架构的 Mac 安装 xquartz 需要到官网手动下载，Homebrew 安装的不能使用。

.. include:: macos-preparation.rst_

编译源码
--------

.. caution::

   编译 SAC 时需要使用系统的软件包，但 Anaconda 的软件包和系统软件包存在冲突。
   所以，Anaconda 用户在编译时，需要临时注释 Anaconda 的环境变量设置。

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
