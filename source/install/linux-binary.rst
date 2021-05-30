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

    $ tar -xvf sac-101.6a-linux_x86_64.tar.gz   # 解压
    $ sudo mv sac /usr/local                    # 安装

.. include:: linux-setting.rst_

启动SAC
-------

终端键入小写的 sac\ [2]_\ ，显示如下则表示 SAC 安装成功：

.. code-block:: console

    $ sac
     SEISMIC ANALYSIS CODE [11/11/2013 (Version 101.6a)]
     Copyright 1995 Regents of the University of California

    SAC>

.. [1] 某些发行版需要修改 ``~/.bash_profile``
.. [2] Ubuntu 的源里有一个名叫 sac 的软件，是用来显示登录账户的一些信息；
   CentOS 的源里也有一个名叫 sac 的软件，是 CSS 语法分析器的 Java 接口。
   所以一定不要试图用发行版自带的软件包管理器安装 sac！
