macOS 下安装 SAC
================

macOS 下安装 SAC，可以直接使用官方提供的二进制包，也可以手动编译源码包。
对于大多数用户而言，建议安装二进制包。下面会分别介绍两种安装方法。

.. caution::

   似乎在最新版本的 macOS 下手动编译的 SAC 无法使用，暂无解决办法。

准备工作
--------

首先要安装 macOS 下的命令行工具。在终端执行如下命令即可安装：

.. code-block:: console

    $ xcode-select --install

此外，还需要安装 X11 图形界面相关工具，即 XQuartz。可以按照
`Apple的官方支持 <https://support.apple.com/zh-cn/HT201341>`_ 来解决。
Homebrew 用户可以使用如下命令安装：

.. code-block:: console

    $ brew cask install xquartz

安装二进制包
------------

直接将官方的二进制包解压并移动到安装目录即可：

.. code-block:: console

    $ tar -xvf sac-101.6a-mac_x86_64.tar.gz
    $ sudo mv sac /usr/local

编译源码
--------

按照如下命令即可正确编译源码。需要注意的是，由于 SAC 默认使用的 editline 库
在 macOS 下无法正常编译，因而执行 ``configure`` 时使用了 ``--enable-readline``
选项使得 SAC 使用 readline 库而不是 editline 库。

.. code-block:: console

    $ tar -xvf sac-101.6a_source.tar.gz
    $ cd sac-101.6a
    $ mkdir build
    $ cd build
    $ ../configure --prefix=/usr/local/sac --enable-readline
    $ make
    $ sudo make install

配置变量
--------

向 ``~/.bash_profile`` 中加入如下语句以配置环境变量和 SAC 全局变量：

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

修改完 ``~/.bash_profile`` 后，执行以下命令使配置的环境变量生效：

.. code-block:: console

    $ source ~/.bash_profile

启动SAC
-------

终端键入小写的 sac，显示如下则表示 SAC 安装成功：

.. code-block:: console

    $ sac
     SEISMIC ANALYSIS CODE [11/11/2013 (Version 101.6a)]
     Copyright 1995 Regents of the University of California

    SAC>
