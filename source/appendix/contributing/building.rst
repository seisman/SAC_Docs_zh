编译文档
=========

在下载项目源码后，需要安装 Sphinx 生成HTML，若需要生成PDF还需要安装TeXLive 2017。

安装TeXLive 2017
------------------

TeXLive 是由国际 TeX 用户组（TeX Users Group，TUG）整理和发布的 TeX 软件发行套装，包含与TeX系统相关的各种程序、编辑与查看工具、常用宏包及文档、常用字体及多国语言支持。

参考 http://blog.seisman.info/texlive-install/ 安装TeXLive 2017 并更新所有宏包至最新版本。

编译文档
--------

::

    $ cd SAC_Docs_zh/
    $ make html
    $ firefox build/html/index.html
    $ make latexpdf
    $ evince build/latex/SAC_Docs.pdf

若编译时出现错误，请到项目主页处提交Issue。
