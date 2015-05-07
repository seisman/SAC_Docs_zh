# SAC参考手册

《SAC参考手册》是介绍地震学常用软件[SAC](http://ds.iris.edu/ds/nodes/dmc/forms/sac/)用法的中文手册。

本项目由[seisman](http://seisman.info/about.html)发起，手册用[LaTeX](http://www.latex-project.org/)写成，
源码托管在[github](https://github.com/seisman/SAC_Docs_zh)上，最终生成的PDF
在[SeisMan博客](http://seisman.info/sac-manual.html)发布。

## 文档结构 ##

文档源码的目录结构如下：

    .
    |-- README.md           # 本文档
    |-- ChangeLog.md        # 记录修订历史
    |
    |-- Makefile            # make构建文件
    |-- SConstruct          # scons构建文件
    |
    |-- SAC_Docs.tex        # 主文档
    |-- SAC_macros.tex      # LaTeX导言区
    |-- cover.tex           # 封面页
    |-- frontmatterIII.tex  # 废话页
    |-- version.tex         # 版本说明
    |-- contributor.tex     # 维护者列表
    |
    |-- figures             # 文档内的插图：eps、jpg等格式
    |-- scripts             # 用于绘制插图的脚本与数据
    |
    |-- introduction        # 简介
    |-- basic               # SAC基础
    |-- fileformat          # 文件格式
    |-- data-process        # 数据处理
    |-- graphics            # 绘图
    |-- macros              # 编程
    |-- call-in-script      # 脚本中调用
    |-- sac-libs            # 函数库
    |-- sacio               # I/O
    |-- sac-tools           # 相关工具
    |-- tricks              # SAC技巧
    |
    |-- commands            # 基础命令
    |-- sss                 # SSS子程序
    `-- spe                 # SPE子程序

## 依赖 ##

- TeX发行版：[TeXLive 2014](https://www.tug.org/texlive/)
- 中文支持：[xeCJK](http://www.ctan.org/pkg/xecjk)
- 中文字体：[Fandol](http://www.ctan.org/tex-archive/fonts/fandol)（TeX自带字体）
- 英文字体：未知（TeX默认字体）
- 构建工具：[make](https://www.gnu.org/software/make/)或[scons](http://www.scons.org/)
- 代码高亮：[pygments](http://pygments.org/)
- 图片生成：
    - [SAC](http://ds.iris.edu/ds/nodes/dmc/forms/sac/)
    - [GMT4](http://gmt.soest.hawaii.edu/gmt4/)
    - [ImageMagick](http://www.imagemagick.org/)

## 如何编译 ##

本源码仅在Linux下测试通过，Windows及Mac OS X下未测试。

### 安装依赖 ###

必须的依赖如下：

    yum install python-pygments make ImageMagick

构建源码是若使用`scons`而不是`make`，则需安装：

    yum install scons

若需要重新生成文档中所使用的图片，则需要安装SAC、GMT4。

### TeXLive ###

安装TeXLive 2014，并将TeX包更新至最新版本，参考[此文](http://seisman.info/install-texlive-under-linux.html)

### 中文字体 ###

使用开源中文字体Fandol，该字体随TeX一起发布，因而只需要直接在`~/.fonts`目录下做一个软链接即可：

    ln -s /opt/texlive/2014/texmf-dist/fonts/opentype/public/fandol ~/.fonts/

### 编译项目 ###

1. 获取源码

   ```
   git clone https://github.com/seisman/SAC_Docs_zh.git
   ```

2. 重新生成图片

   ```
   cd scripts
   make
   ```

3. 编译文档

   ```
   make
   ```
   或
   ```
   scons
   ```

### 参与维护 ###

你可以参与到本项目的维护：

- 帮忙校对，挑错别字、病句等等
- 提出修改建议
- 提出术语翻译建议
- 文档布局调整
- LaTeX源码优化
