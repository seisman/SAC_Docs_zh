在Linux下安装SAC
================

Linux下安装SAC，可以直接使用官方提供的二进制包，也可以手动编译源码包。
对于大多数用户而言，建议安装二进制包。下面会分别介绍两种安装方法，要求
读者了解Linux的一些基本概念和操作。

安装二进制包
------------

安装依赖包
~~~~~~~~~~

官方提供的二进制包中的可执行文件可以直接使用，在运行时需要用到几个动态
链接库。大部分Linux发行版下，都默认安装了这几个动态链接库。若不幸没有
安装或不确定有没有安装，可以通过如下命令安装所需的软件包。

对于Ubuntu/Debian：

.. code:: console

    $ sudo apt-get update
    $ sudo apt-get install libc6 libsm6 libice6 libxpm4 libx11-6
    $ sudo apt-get install zlib1g libncurses5

对于CentOS/Fedora/RHEL：

.. code:: console

    $ sudo yum install glibc libSM libICE libXpm libX11
    $ sudo yum install zlib ncurses

安装二进制包
~~~~~~~~~~~~

直接将官方提供的二进制包解压并移动到安装目录即可：

.. code:: console

    $ tar -xvf sac-101.6a-linux_x86_64.tar.gz   # 解压
    $ sudo mv sac /usr/local                    # 安装

编译源码
--------

安装依赖包
~~~~~~~~~~

编译源码时需要安装若干软件包。

对于Ubuntu/Debian系：

.. code:: console

    $ sudo apt-get update
    $ sudo apt-get install build-essential
    $ sudo apt-get install libncurses5-dev libsm-dev libice-dev
    $ sudo apt-get install libxpm-dev libx11-dev zlib1g-dev

对于CentOS/Fedora/RHEL系：

.. code:: console

    $ sudo yum install gcc gcc-c++ make
    $ sudo yum install glibc ncurses-devel libSM-devel libICE-devel
    $ sudo yum install libXpm-devel libX11-devel zlib-devel

编译源码
~~~~~~~~

将源码按如下命令解压、配置、编译、安装：

.. code:: console

    $ tar -xvf sac-101.6a_source.tar.gz
    $ cd sac-101.6a
    $ mkdir build
    $ cd build
    $ ../configure --prefix=/usr/local/sac
    $ make
    $ sudo make install

配置变量
--------

向 ``~/.bashrc``  [1]_ 中加入如下语句以配置环境变量和SAC全局变量：

.. code:: bash

    export SACHOME=/usr/local/sac
    export SACAUX=${SACHOME}/aux
    export PATH=${SACHOME}/bin:${PATH}

    export SAC_DISPLAY_COPYRIGHT=1
    export SAC_PPK_LARGE_CROSSHAIRS=1
    export SAC_USE_DATABASE=0

其中，

-  ``SACHOME`` 为SAC的安装目录
-  ``SACAUX`` 目录中包含了SAC运行所需的辅助文件
-  ``PATH`` 为Linux系统环境变量
-  ``SAC_DISPLAY_COPYRIGHT`` 用于控制是否在启动SAC时显示版本和版权
   信息，一般设置为1。在脚本中多次调用SAC时会重复显示版本和版权信息，
   干扰脚本的正常输出，因而在脚本中一般将其值设置为0。具体的设置方法
   可以参考“:doc:`/call-in-script/index` ” 中的相关内容
-  ``SAC_PPK_LARGE_CROSSHAIRS`` 用于控制震相拾取过程中光标的大小， 在
    “:doc:`/data-process/picking-phase` ”时会用到
-  ``SAC_USE_DATABASE`` 用于控制是否允许将SAC格式转换为GSE2.0格式，
   一般用不到该特性，故而设置其值为0

修改完 ``~/.bashrc`` 后，执行以下命令使配置的环境变量生效：

.. code:: console

    $ source ~/.bashrc

启动SAC
-------

终端键入小写的sac [2]_ ，显示如下则表示SAC安装成功：

.. code:: console

    $ sac
     SEISMIC ANALYSIS CODE [11/11/2013 (Version 101.6a)]
     Copyright 1995 Regents of the University of California

    SAC>

.. [1] 某些发行版需要修改 ``~/.bash_profile``

.. [2] Ubuntu的源里有一个名叫sac的软件，是用来显示登录账户的一些信息；CentOS的
   源里也有一个名叫sac的软件，是CSS语法分析器的Java接口。所以一定不要试图用
   发行版自带的软件包管理器安装sac！
