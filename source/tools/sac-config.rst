sac-config
==========

``sac-config`` 是 SAC 提供的一个简单的配置脚本，用于返回编译、链接
SAC 函数库时所需要的一些信息。

下面给出一些示例：

.. code-block:: console

    $ sac-config --version
    101.6a
    $ sac-config -c                      # 返回 include 路径
    -I/usr/local/sac/include
    $ sac-config -l                      # 返回 lib 路径
    -L/usr/local/sac/lib
    $ sac-config -l sacio                # 链接 sacio 库
    -L/usr/local/sac/lib -lsacio
    $ sac-config -l sacio sac            # 链接 sacio 和 sac 库
    -L/usr/local/sac/lib -lsacio -lsac
    $ sac-config --prefix=/opt/sac -c    # 设置 SAC 根路径并返回 include 路径
    -I/opt/sac/include
