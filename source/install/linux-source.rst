Linux 源码安装
==============

.. include:: request.rst_

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

配置变量
--------

向 ``~/.bashrc``\ [1]_\ 中加入如下语句以配置环境变量和 SAC 全局变量：

.. code-block:: bash

    export SACHOME=/usr/local/sac
    export SACAUX=${SACHOME}/aux
    export PATH=${SACHOME}/bin:${PATH}

    export SAC_DISPLAY_COPYRIGHT=1
    export SAC_PPK_LARGE_CROSSHAIRS=1
    export SAC_USE_DATABASE=0

其中，

-  ``SACHOME`` 定义了 SAC 的安装目录
-  ``SACAUX`` 定义了 SAC 运行所需的辅助文件所在的目录
-  ``PATH`` 为 Linux 系统环境变量，使得系统可以正确找到SAC的可执行文件
-  ``SAC_DISPLAY_COPYRIGHT`` 用于控制是否在启动 SAC 时显示版本和版权
   信息，一般设置为1。在脚本中多次调用 SAC 时会重复显示版本和版权信息，
   干扰脚本的正常输出，因而在脚本中一般将其值设置为0。具体的设置方法
   可以参考 “:doc:`/call-in-script/index`\ ” 中的相关内容
-  ``SAC_PPK_LARGE_CROSSHAIRS`` 用于控制震相拾取过程中光标的大小，
   在 :doc:`/data-process/picking-phase` 时会用到
-  ``SAC_USE_DATABASE`` 用于控制是否允许将 SAC 格式转换为 GSE2.0 格式，
   一般用不到该特性，故而设置其值为0

修改完 ``~/.bashrc`` 后，执行以下命令使配置的环境变量生效：

.. code-block:: console

    $ source ~/.bashrc

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
