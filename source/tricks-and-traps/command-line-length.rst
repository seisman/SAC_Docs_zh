命令长度
========

大多数程序在处理命令行的输入时，都会先定义一个固定长度的字符数组，将
命令行的输入读入到字符数组中，再进行进一步的解析。一般来说，这个字符
数组是足够大的，很少会担心命令过长的问题。

那么 SAC 所能允许的命令的最大长度是多少呢？看一下 SAC 源码可以知道答案是
1001。考虑到 C 语言中字符串需要以 ``\0`` 结尾，所以实际上能够允许的
最大长度是1000。

1000这个长度似乎够了，因为大多数 SAC 命令的长度都不会超过20，而且用户也
没有那个心情去敲一个长度超过1000的命令。一个特殊的情况是命令中包含文件名。

假设在当前目录下有120个形如 ``XX.XXX.BHZ`` 的 SAC 文件，每个文件的
文件名长度为10字符。如果要将全部 SAC 文件读入到内存中，最简单的办法是
使用通配符：

.. code-block:: bash

    SAC> r *.BHZ

当然如果不觉得麻烦，完全可以把120个文件名一个一个敲到命令行里：

.. code-block:: bash

    SAC> r XX.001.BHZ XX.002.BHZ ... XX.120.BHZ # 此处省略了一堆文件名

这两种读入 SAC 文件的方式，看上去很相似，结果却是完全不同的。

前一种方式中，SAC 获取的命令长度实际为7字符，远小于1000字符的长度上限，
然后 SAC 会在程序内部将通配符展开为120个文件的文件列表。

后一种方式中，SAC 获取的命令长度超过1200字符，但只有前1000字符会真正被
SAC 真正接收并处理，这将导致仅有不到100个 SAC 文件会被读入，而 SAC 不会对此
给出任何警告。这是一件非常危险的事情。

这两种方式比较起来，不管是从简便性还是安全性角度来看，都应该选择
通配符这种方式。

在脚本中使用通配符，有一点需要注意。以 Perl 脚本为例，下面的 Perl 脚本
调用了 SAC，并读取全部文件，然后做了简单的数据处理，最后保存退出。

.. code-block:: perl

    #!/usr/bin/env perl
    use strict;
    use warnings;

    open(SAC, "| sac") or die "Error in opening sac\n";
    print SAC "r *.BHZ\n";
    print SAC "rmean; rtr; taper\n";
    print SAC "bp c 1 3 n 4 p 2\n";
    print SAC "w over\n";
    print SAC "q\n";
    close(SAC);

上面的脚本是可以正常工作的，但是如果改成如下看上去很像的脚本，则会出问题。

.. code-block:: perl

    #!/usr/bin/env perl
    use strict;
    use warnings;

    my @files = glob "*.BHZ";

    open(SAC, "| sac") or die "Error in opening sac\n";
    print SAC "r @files\n";
    print SAC "rmean; rtr; taper\n";
    print SAC "bp c 1 3 n 4 p 2\n";
    print SAC "w over\n";
    print SAC "q\n";
    close(SAC);

两种都使用了通配符或通配函数，前者直接将 ``*.BHZ`` 传递给 SAC，
而后者却将通配（\ ``glob``\ ）后的文件列表传给 SAC，所以后者会出现问题。
在写脚本的时候应避免后一种写法。

通配符不是万金油，很多时候无法使用通配符来通配一堆没有规律的文件。

例如，当前目录下有200个形如 ``XX.XXX.BHZ`` 的 SAC 文件，其中140个
有清晰的 P波，P 波的到时被标记到 ``T0`` 中。现在想要读取这140个有
清晰 P 波的数据，这个时候显然通配符是没法用了。

错误的写法如下：

.. code-block:: perl

    #!/usr/bin/env perl
    use strict;
    use warnings;

    # 获取全部T0有定义的文件名列表
    my @files = ();
    open(SACLST, "saclst t0 f *.BHZ |");
    foreach (<SACLST>) {
        my ($fname, $t0) = split ' ', $_;
        push @files, $fname if $t0 > 0;
    }
    close(SACLST);

    # 调用SAC进行数据处理
    open(SAC, "| sac") or die "Error in opening sac\n";
    print SAC "r @files\n";
    print SAC "rmean; rtr; taper\n";
    print SAC "bp c 1 3 n 4 p 2\n";
    print SAC "w over\n";
    print SAC "q\n";
    close(SAC);

调用 SAC 进行数据处理的正确写法：

.. code-block:: perl

    open(SAC, "| sac") or die "Error in opening sac\n";
    foreach (@files) {
        print SAC "r more $_\n";
    }
    print SAC "rmean; rtr; taper\n";
    print SAC "bp c 1 3 n 4 p 2\n";
    print SAC "w over\n";
    print SAC "q\n";
    close(SAC);

效率稍低的正确写法：

.. code-block:: perl

    open(SAC, "| sac") or die "Error in opening sac\n";
    foreach (@files) {
        print SAC "r $_\n";
        print SAC "rmean; rtr; taper\n";
        print SAC "bp c 1 3 n 4 p 2\n";
        print SAC "w over\n";
    }
    print SAC "q\n";
    close(SAC);
