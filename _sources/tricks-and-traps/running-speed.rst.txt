SAC 与脚本的运行速度
====================

以一个 Perl 脚本来解释这个陷阱。该脚本中读取一个文件，做简单操作后保存到
新文件中，并删除原文件。实际情况下，当然可以直接覆盖旧文件，此处这样
写完全是出于演示目的。

.. code-block:: perl

    #/usr/bin/env perl
    open(SAC, "|sac");
    print SAC "r seis.SAC \n";
    print SAC "bp c 0.1 5 \n";
    print SAC "w seis.SAC.bp \n";
    unlink "seis.SAC";
    print SAC "q\n";
    close(SAC);

该脚本看似正确，实际运行时却会报错。出错的根本原因在于 Perl 的运行速度比
SAC 的运行速度快很多。无论是 Perl 还是 Python，或其他脚本语言，调用 SAC 时只是
简单地将一堆命令传递给 SAC，而不去管具体命令的执行过程。上面的示例脚本中，
Perl 语句是按顺序执行的，在将三个命令传递给 SAC 后，Perl 用 ``unlink``
函数删除了原文件，由于 SAC 的运行速度比 Perl 要慢很多，因而“快 Perl”已经删除了
文件，“慢 SAC”还没来得及执行命令。故而当“慢 SAC”开始执行命令时，由于
文件已被“快 Perl”删除而报错。

解决办法是，在退出 SAC 后再使用 ``unlink`` 函数，即将 ``unlink`` 函数放在
``close(SAC)`` 语句后。
