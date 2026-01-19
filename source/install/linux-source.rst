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

    $ # 如果没有 dnf 包管理软件则换为 yum
    $ sudo dnf install gcc gcc-c++ make
    $ sudo dnf install glibc ncurses-devel libSM-devel libICE-devel
    $ sudo dnf install libXpm-devel libX11-devel zlib-devel libedit-devel
    $ sudo dnf install libcurl-devel gcc-gfortran

编译源码
--------

.. caution::

    Anaconda/Conda 内有软件包和系统软件包冲突，sac 编译的时候需要系统的软件包，
    所以编译时需要退出 Conda 环境。请多次执行以下命令，直到命令行前面的 (base) 消失::

        conda deactivate


将源码按如下命令解压、配置、编译、安装：

.. code-block:: console

    $ tar -xvf sac-102.0.tar.gz
    $ cd sac-102.0
    $ mkdir build
    $ cd build
    $ # sac 的老代码混合了老的 C 标准（C89/C90/C99），而新版的 GCC 采用了更严格的 C 语言标准（C23 标准）
    $ # 因此需要强制指定使用 -std=gnu99 标准，并忽略指针错误
    $ ../configure --prefix=/usr/local/sac CFLAGS="-std=gnu99 -g -O2 -Wno-error=incompatible-pointer-types"
    $ make
    $ sudo make install



.. include:: linux-configurations.rst_
