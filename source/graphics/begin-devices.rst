SAC 绘图流程
============

严格地说，SAC 绘图的流程应该是：

1. 启动图像设备
2. 绘图
3. 关闭图像设备

如下所示：

.. code-block:: bash

    SAC> r cdv.[nez]
    SAC> begindevices xwindows      # 启动图像设备 xwindows，简写为 bd x
    SAC> p                          # 绘图
    Waiting
    Waiting
    SAC> enddevices xwindows        # 关闭图像设备 xwindows，简写为 ed x
    SAC> q

上面的步骤稍显繁琐，SAC 将这一流程进行了简化。在第一次执行绘图命令前，
SAC 偷偷启动了默认的图像设备 xwindows，接下来的绘图工作都在该窗口中完成。
当用户退出 SAC 时，SAC 会自动关闭图像设备。

也许你已经发现，即使 plot 结束或者中途退出 plot，绘图窗口依然没有被关闭。
即便点击窗口的“关闭”按钮，窗口依然无法关闭。若想要关闭绘图窗口，应
如上例那样使用 ``ed x`` 命令。
