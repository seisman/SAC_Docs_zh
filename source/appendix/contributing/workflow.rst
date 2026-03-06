维护流程
=========

准备工作
--------

1. 在项目主页，点击右上角的Fork按钮，将该项目复制到你的GitHub账户下。
   以下假定你的GitHub账户名为 ``USER``

2. Clone源码到当前机器::

       $ git clone git@github.com:USER/SAC_Docs_zh.git
       $ cd SAC_Docs_zh/

3. 将项目的官方repo添加为远程repo，并命名为 upstream，这样方便以后与官方repo同步进度::
   
       $ git remote add upstream https://github.com/seisman/SAC_Docs_zh.git

正式维护该项目
--------------

1. 从官方repo中拉取源码的最新版本，并合并到本地master分支，
   以保证本地的master分支与官方master分支同步

       # 切换到本地的master分支
       $ git checkout master
       # 获取upstream/master分支并合并到本地master分支
       $ git pull upstream master

2. 新建单独的分支，在分支中修改文档并提交。假定分支名为 ``mydev``\ ::

       $ git checkout -b mydev

3. 对文档做修改，并提交commit，此过程可以循环多次::

       $ git status
       $ git add --all
       $ git status
       $ git commit -m "此处填写本次提交的注释信息"

4. 分支开发的过程中，可能upstream的官方master分支已经更新，可以经常与主干保持同步::

       # 本地切换到master分支，并合并upstream的master分支的更新
       $ git checkout master
       $ git pull upstream master
       # 切换到开发分支，并使得当前分支基于最新的master分支
       $ git checkout mydev
       $ git rebase master
       
5. 分支开发的过程中，可能会有很多次commit，某些commit可能不那么重要，
   可以将多个commit压缩成一个或若干个commit，这样不仅清晰，也容易管理::

   $ git rebase -i master


6. 将分支推送到远程仓库::

       # 将mydev分支推送到USER的repo下
       $ git push origin mydev

7. 进入 https://github.com/USER/SAC_Docs_zh ，点击Pull Request即可提交PR
8. seisman在收到PR后，会对代码进行审核、评论以及修改，并决定是否结束该PR
9. 若PR已被接受，则可以删除本地和GitHub上的mydev分支::

       # 切换回本地master分支
       $ git checkout master
       # 删除本地mydev分支
       $ git branch -D mydev
       # 合并upstream/master分支到本地master
       $ git pull upstream master 
       # 删除GitHub上的远程分支，也可以在GitHub上点击按钮删除分支
       $ git push origin :mydev

对维护的若干说明
----------------

为了简化维护流程，避免重复或不必要的劳动，请遵循如下原则。

若只是对文档做简单的微调，比如修改简单的bug或typo，整理部分语句等，可以直接修改并提交PR。若需要对文档做大量修改，比如新增章节、调整文档结构等，请先到项目主页中提交Issue，由众多维护者一起讨论是否有必要做修改。

若暂时不打算解决某Issue，则该Issue会有标签`Pull Request Welcomed`，维护者可以随意认领具有`Pull Request Welcomed`标签的Issue，若某Issue已经被认领，则设置标签为`In Progress`。

对于已经熟练使用Git的维护者，我会将其加为合作者，即其可以将提交push到seisman的repo中，这样流程更加简单。
