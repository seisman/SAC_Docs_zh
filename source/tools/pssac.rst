pssac
=====

地震学科研需要展示地震波形，这就产生了绘制 SAC 文件中的地震波形的需求。
在天然地震学领域，GMT 是最常用的矢量图绘制软件。
该软件使用不同的模块或者说子程序实现不同的绘图功能。
``pssac`` 则是配合 GMT4 的一个波形绘制程序。
GMT 在 GMT5 以前（确切说是 v5.3.0 以前），没有波形绘制的功能。
使用 GMT4 及之前版本的用户应搭配使用 ``pssac`` 绘制波形。
之后版本的 GMT 用户并不需要 ``pssac``，直接使用 GMT 的 sac 模块即可。

初学者应该首选学习最新版的 GMT，除非需要使用前人的脚本，否则没有必要学习 ``pssac``。
安装最新版的 GMT 可以参考
`安装 gmt <https://docs.gmt-china.org/latest/install/>`_\ ，
绘制 SAC 波形可以参考
`gmt 的 sac 模块 <https://docs.gmt-china.org/latest/module/sac/`_，
使用 GMT4 的用户安装 ``pssac`` 可以参考
`安装pssac <https://blog.seisman.info/pssac-install>`_，
具体用法参考 `pssac用法教程 <https://blog.seisman.info/pssac-notes>`_。
