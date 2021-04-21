macOS 下安装 SAC
================

macOS 下安装 SAC 大致可以分为三步：安装必要的工具和依赖、安装 SAC 以及修改环境变量。

安装必要的工具和依赖
-----------------

Command Line Tools for Xcode 是 macOS 下的集成开发环境 Xcode 的一部分，其包含了常用的命令行开发工具。
执行如下命令，并在弹出的窗口中点击 “Install” 以安装 Command Line Tools for Xcode：

.. code-block:: console

    $ xcode-select --install

还需安装 X11 图形界面工具 `XQuartz <https://www.xquartz.org/>`__\ ，下载安装包后直接双击即可安装。

安装 SAC
---------

在这一步，用户有两个选择：可以直接用二进制包，也可以编译源代码。
二者必选其一，即二者不能都选，也不能都不选。二者的差异请看申请sac一节。

如果选择用二进制包，直接将二进制包解压并移动到安装目录即可：

.. code-block:: console

    $ tar -xvf sac-102.0-mac.tar.gz
    $ sudo mv sac /usr/local

如果选择编译源代码来安装，解压源码文件后，需要配置、编译和安装 SAC：

.. caution::

   如果已经安装了 Anaconda，需要注释掉 Anaconda，编译后再自行恢复。

.. code-block:: console

    $ tar -xvf sac-102.0.tar.gz
    $ cd sac-102.0
    $ mkdir build
    $ cd build
    $ ../configure --prefix=/usr/local/sac
    $ make
    $ sudo make install

.. caution::

   完成安装sac这一步后，sac还不能被操作系统发现。请见修改环境变量一节，对环境变量进行设置。

配置变量
---------

向 ``~/.zshrc`` 中加入如下语句以配置环境变量和 SAC 全局变量：

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

修改完 ``~/.zshrc`` 后，执行以下命令使配置的环境变量生效：

.. code-block:: console

    $ source ~/.zshrc

启动SAC
--------

终端键入小写的 sac，显示如下则表示 SAC 安装成功：

.. code-block:: console

    $ sac
     SEISMIC ANALYSIS CODE [04/19/2021 (Version 102.0)]
     Copyright 1995 Regents of the University of California

    SAC>
.. caution::
 
现在，新版本的 Mac 系统在启动 sac 时，因为安全限制会拒绝启动 sac。
可以在系统偏好设置的安全性与隐私中，通过输入密码或 Touch ID 选择仍然启动 sac。