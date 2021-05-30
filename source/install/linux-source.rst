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

对于 CentOS/Fedora/RHEL：

.. code-block:: console

    $ sudo yum install gcc gcc-c++ make
    $ sudo yum install glibc ncurses-devel libSM-devel libICE-devel
    $ sudo yum install libXpm-devel libX11-devel zlib-devel

编译源码
--------

将源码按如下命令解压、配置、编译、安装：

.. code-block:: console

    $ tar -xvf sac-101.6a_source.tar.gz
    $ cd sac-101.6a
    $ mkdir build
    $ cd build
    $ ../configure --prefix=/usr/local/sac
    $ make
    $ sudo make install

.. include:: linux-sac.rst_
