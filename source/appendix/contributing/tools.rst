GitHub, Git, LaTeX学习资源
==========================

维护本项目，必须学会使用GitHub和Git，对LaTeX不做要求。

GitHub
-------

参考文档：http://www.worldhello.net/gotgithub/02-join-github/010-account-setup.html

1. 注册GitHub账户
2. 向GitHub账户中添加当前机器的SSH秘钥，以使得当前机器拥有GitHub账户的读写权限

Git
----

Git是现在非常流行的版本控制软件，Linux下直接用系统自带的包管理器即可安装`git`。同时也可以安装`gitk`或者其他git的GUI软件，以方便查看git提交历史。

安装完git之后需要配置全局变量::

    $ git config --global user.name "Your Name"
    $ git config --global user.email "you@example.com"

参考资料：

- [git简明指南](http://rogerdudler.github.io/git-guide/index.zh.html)
- [GotGitHub](http://www.worldhello.net/gotgithub/index.html)
- [廖雪峰的Git教程](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)
- [Pro Git](https://git-scm.com/book/zh/v2)

git的功能很多，维护本项目所需要的命令基本上只有::

    $ git add 
    $ git commit
    $ git checkout -b 
    $ git rebase 
    $ git pull
    $ git push

LaTeX
-------

学习资源：

1. http://dralpha.altervista.org/zh/tech/lnotes2.pdf
2. https://github.com/louisstuart96/lshort-new-zh-cn
