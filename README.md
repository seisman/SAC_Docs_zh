# SAC参考手册

《SAC参考手册》是介绍地震学常用软件[SAC](http://ds.iris.edu/ds/nodes/dmc/forms/sac/)用法的中文手册。

## 相关信息 ##

[![Build Status](https://travis-ci.org/seisman/SAC_Docs_zh.svg?branch=master)](https://travis-ci.org/seisman/SAC_Docs_zh)

- 发起者：[seisman](http://seisman.info/about.html)
- 源码语言：[LaTeX](http://www.latex-project.org/)写成
- 源码托管：https://github.com/seisman/SAC_Docs_zh
- 正式版文档下载地址：http://seisman.info/sac-manual.html
- 测试版文档下载地址：https://github.com/seisman/SAC_Docs_zh/raw/pdf/SAC_Docs.pdf

## 依赖 ##

- TeX发行版：[TeXLive 2015](https://www.tug.org/texlive/)
- 构建工具：[make](https://www.gnu.org/software/make/)
- 代码高亮：[pygments](http://pygments.org/)
- 图片生成：[SAC](http://ds.iris.edu/ds/nodes/dmc/forms/sac/)、[GMT4](http://gmt.soest.hawaii.edu/gmt4/)

## 如何编译 ##

本源码仅在Linux下测试通过，Windows及Mac OS X下未测试。

### 安装依赖 ###

CentOS/Fedora/RHEL下用如下命令安装::

    sudo yum install python-pygments make git

Ubuntu/Debian下用如下命令安装::

    sudo apt-get install python-pygments make git

若需要重新生成文档中所使用的图片，则需要安装SAC、GMT4。

### TeXLive ###

安装TeXLive 2015，并将TeX宏包更新至最新版本，参考[此文](http://seisman.info/install-texlive-under-linux.html)

### 编译项目 ###

1. 获取源码

   ```
   git clone https://github.com/seisman/SAC_Docs_zh.git
   ```

2. 重新生成图片（可选，需要SAC和GMT4）

   ```
   cd scripts
   make
   ```

3. 编译文档

   ```
   make
   ```

## 参与维护 ##

你可以参与到本项目的维护：

- 帮忙校对，挑错别字、病句等等
- 提出修改建议
- 提出术语翻译建议
- 文档布局调整
- LaTeX源码优化

详情见 [Wiki](https://github.com/seisman/SAC_Docs_zh/wiki)。
