# SAC参考手册

《SAC参考手册》是介绍地震学常用软件[SAC](http://ds.iris.edu/ds/nodes/dmc/forms/sac/)用法的中文手册。

本项目由[seisman](http://seisman.info/about.html)发起，手册用[LaTeX](http://www.latex-project.org/)写成，源码托管在[github](https://github.com/seisman/SAC_Docs_zh)上，最终生成的PDF在[SeisMan博客](http://seisman.info/sac-manual.html)发布。

## 文档结构 ##

文档源码的目录结构如下：

    .
    |-- README.md           # 本文档
    |
    |-- Makefile            # make构建文件
    |
    |-- SAC_Docs.tex        # 主文档
    |-- SAC_macros.tex      # LaTeX导言区
    |-- cover.tex           # 封面页
    |-- frontmatterIII.tex  # 废话页
    |-- version.tex         # 版本说明
    |-- contributor.tex     # 维护者列表
    |
    |-- figures             # 文档内的插图
    |-- scripts             # 用于绘制插图的脚本
    |
    |-- introduction        # 简介
    |-- basic               # SAC基础
    |-- fileformat          # 文件格式
    |-- data-process        # 数据处理
    |-- graphics            # 绘图
    |-- macros              # SAC宏语言
    |-- call-in-script      # 脚本中调用
    |-- libs                # 函数库的使用
    |-- sacio               # SAC I/O
    |-- tools               # 相关工具
    |-- tricks-and-traps    # 技巧与陷阱
    |-- appendix            # 附录
    |
    |-- commands            # 基础命令
    |-- sss                 # SSS子程序
    `-- spe                 # SPE子程序

## 依赖 ##

- TeX发行版：[TeXLive 2015](https://www.tug.org/texlive/)
- 构建工具：[make](https://www.gnu.org/software/make/)
- 代码高亮：[pygments](http://pygments.org/)
- 图片生成：
    - [SAC](http://ds.iris.edu/ds/nodes/dmc/forms/sac/)
    - [GMT4](http://gmt.soest.hawaii.edu/gmt4/)

## 如何编译 ##

本源码仅在Linux下测试通过，Windows及Mac OS X下未测试。

### 安装依赖 ###

CentOS/Fedora/RHEL下用如下命令安装::

    sudo yum -y install python-pygments make git

Ubuntu/Debian下用如下命令安装::

    sudo apt-get -y install python-pygments make git

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
