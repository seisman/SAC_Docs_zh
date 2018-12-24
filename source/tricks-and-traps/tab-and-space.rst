Tab 与空格
==========

编程界有诸多圣战，编辑器 vs IDE，vim vs emacs，以及谁是最好的语言等等。
这一节提到的“Tab 与空格”也算是编程界的圣战之一了。这一节并不打算争论
究竟该使用Tab 还是空格，而是讨论一下在SAC中使用Tab会遇到的陷阱。

从终端启动 SAC，试着在 SAC 中键入 Tab 键，你会发现这些 Tab 键仅仅起到了命令
补全的作用，因而你是无法直接在交互式 SAC 中输入一个 Tab 键的。因此，在
交互式 SAC 下，Tab 键不会造成任何问题。但，当在脚本中调用 SAC，或者写 SAC
宏时，Tab 键就会产生影响。

以在 Bash 中调用 SAC 为例:

.. code-block:: bash

    sac << EOF
        fg seis     # 此行行首有 Tab，只是你看不见
        w seis.sac  # 此行行首有 Tab，只是你看不见
        q           # 此行行首有 Tab，只是你看不见
    EOF

由于 SAC 命令前有 Tab 键，导致执行该脚本的结果如下：

.. code-block:: console

    sh: line 0: fg: no job control
    22:24:49 up 12 days, 12:24,
    USER
    TTY
    FROM
    8 users,
    load average: 1.45, 1.45, 1.42
    LOGIN@
    IDLE
    JCPU
    sh: q: command not found
    SAC Error: EOF/Quit
    SAC executed from a script: quit command missing
    Please add a quit to the script to avoid this message
    If you think you got this message in error,
    please report it to: sac-help@iris.washington.edu

引起该问题的原因尚不清楚，但比较明显的是，由于命令的行首有 Tab，
导致 SAC 对命令的解析出现了问题，所有的命令都被当做外部命令来解释了。
在任意脚本语言中调用 SAC，都有可能会出现类似的问题：

.. code-block:: perl

    #!/usr/bin/env perl
    use strict;
    use warnings;
    open(SAC, "|sac");
    print SAC "     fg seis\n";     # fg 前面为Tab键

    print SAC "\tfg seis\n";        # \t 为显式Tab键

    print SAC qq [
        fg seis                     # fg 前面有Tab
        w seis.sac
        q
    ]
    close(SAC);

这个 Perl 脚本的例子中，展示了三种会出现问题的情况，其中第一种和第二种
一般都不会这写，所以很少碰到，而第三种写法是常见的写法，经常会需要用
缩进来将代码对齐，使得代码更整齐，就可能导致 Tab 键的问题。

因而，在脚本中调用 SAC 时要尽量避免使用 Tab 键。目前大多数主流编辑器都具备
将 Tab 自动转换成空格的功能，建议将这一功能打开，使得在写代码时无论输入
Tab 还是输入空格都会自动转换成空格。
