Linux 二进制安装
================

安装依赖
--------

官方提供的二进制包中的可执行文件可以直接使用，在运行时需要用到几个动态
链接库。大部分 Linux 发行版下，都默认安装了这几个动态链接库。若不幸没有
安装或不确定有没有安装，可以通过如下命令安装所需的软件包。

对于 Ubuntu/Debian：

.. code-block:: console

    $ sudo apt update
    $ sudo apt install libc6 libsm6 libice6 libxpm4 libx11-6
    $ sudo apt install zlib1g libncurses5

对于 CentOS/Fedora/RHEL：

.. code-block:: console

    $ sudo yum install glibc libSM libICE libXpm libX11
    $ sudo yum install zlib ncurses

安装二进制包
------------

直接将官方提供的二进制包解压并移动到安装目录即可：

.. code-block:: console

    $ tar -xvf sac-102.0-linux_x86_64.tar.gz    # 解压
    $ sudo mv sac /usr/local                    # 安装

.. include:: linux-configurations.rst_
