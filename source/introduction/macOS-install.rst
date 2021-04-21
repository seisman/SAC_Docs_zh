macOS 下安装 SAC
================

macOS 下安装 SAC 大致可以分为三步：安装必要的工具和依赖、安装 SAC 以及修改环境变量。

安装必要的工具和依赖
-----------------

Command Line Tools for Xcode 是 macOS 下的集成开发环境 Xcode 的一部分，其包含了常用的命令行开发工具。
执行如下命令，并在弹出的窗口中点击 “Install” 以安装 Command Line Tools for Xcode：

.. code-block:: console

    $ xcode-select --install

然后，需要安装 X11 图形界面相关工具。
下载 `XQuartz <https://www.xquartz.org/>` 的安装包双击安装。

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
