macOS 二进制安装
================

.. attention::

   ARM 架构的 Mac 可以用 SAC 二进制文件直接安装使用，
   但 xquartz 需要到官网手动下载，Homebrew 安装的不能使用。

.. include:: macos-preparation.rst_

安装二进制包
------------

直接将官方的二进制包解压并移动到安装目录即可：

.. code-block:: console

    $ tar -xvf sac-101.6a-mac_x86_64.tar.gz
    $ sudo mv sac /usr/local

.. include:: macos-configurations.rst_
