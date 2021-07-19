Linux 编译安装
==============

安装依赖包
----------

编译源码时需要安装若干软件包。

对于 Ubuntu/Debian：

.. code-block:: console

    $ sudo apt update
    $ sudo apt install build-essential
    $ sudo apt install libncurses5-dev libsm-dev libice-dev
    $ sudo apt install libxpm-dev libx11-dev zlib1g-dev
    $ sudo apt install libedit-dev libxml2-dev libcurl4-openssl-dev

对于 CentOS/Fedora/RHEL：

.. code-block:: console

    $ sudo yum install gcc gcc-c++ make
    $ sudo yum install glibc ncurses-devel libSM-devel libICE-devel
    $ sudo yum install libXpm-devel libX11-devel zlib-devel libedit-devel

编译源码
--------

.. caution::

    Anaconda 内有软件包和系统软件包冲突。sac 编译的时候需要系统的软件包。
    所以，Anaconda 用户在编译时需要临时重命名 Anaconda 的路径。

将源码按如下命令解压、配置、编译、安装：

.. code-block:: console

    $ tar -xvf sac-102.0.tar.gz
    $ cd sac-102.0
    $ mkdir build
    $ cd build
    $ ../configure --prefix=/usr/local/sac
    $ make
    $ sudo make install

.. include:: linux-configurations.rst_
