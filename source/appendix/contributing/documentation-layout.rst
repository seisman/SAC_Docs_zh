文档结构
=========

文档源码中核心文档及目录的结构::

    .
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


文档的结构还是比较清晰的，主文件是 ``SAC_Docs.tex`` ，每个目录基本对应一章，每个目录内的文件一般对应一节内容。

除此之外，源码里还有一些其他文件：

1. ``README.md`` 项目的说明文档
2. ``Makefile`` 项目构建文件
3. ``.gitignore`` 包含git忽略的文件列表
4. ``.travis.yml`` travis服务的配置文件
5. ``.texlive-minimal-installer.sh`` 为项目安装一个最小版本的TeXLive，用于travis服务中
6. ``travis-deploy.sh`` 用于travis服务中，在生成PDF后，自动推送到项目主页的pdf分支中
