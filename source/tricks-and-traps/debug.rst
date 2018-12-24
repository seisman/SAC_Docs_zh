SAC debug
=========

不管是在 SAC 中执行稍复杂的命令，还是写 SAC 宏文件，又或者是在脚本中调用 SAC，
都会遇到各种各样奇怪的错误，明明仔细检查了很多遍，执行起来还是有问题。
这个时候先不要怀疑 SAC 有 bug，而是要先把自己写的东西好好 debug 一下。

SAC 其实自带了一个 debug 工具，即命令 :doc:`/commands/echo`\ 。该命令用于控制
是否显示 SAC 的输出（即警告信息、错误信息和正常的输出信息）以及输入（包括
传递给 SAC 的命令、宏以及对命令的处理）。

以在 Perl 中调用 SAC 为例：

.. code-block:: perl

    #!/usr/bin/env perl
    use strict;
    use warnings;

    my $var0 = 3.0;
    my $var1 = 5.0;
    open(SAC, "|sac");
    print SAC "r STA.BHN STA.BHE STA.BHZ \n";
    print SAC "ch t0 $var0+$var1\n";
    print SAC "w over";
    print SAC "q\n";
    close(SAC);

这个脚本是有问题的，但是对于刚刚写脚本的人来说，可能看不出问题。直接
执行会出现如下错误：

.. code-block:: bash

     ERROR 1312: Bad number of files in write file list: 1 3
    SAC Error: EOF/Quit
         SAC executed from a script: quit command missing
         Please add a quit to the script to avoid this message
         If you think you got this message in error,
         please report it to: sac-help@iris.washington.edu

从这些输出信息里其实看不出来太多有用的信息。

如果加上“``echo on``”，脚本如下：

.. code-block:: perl

    #!/usr/bin/env perl
    use strict;
    use warnings;

    my $var0 = 3.0;
    my $var1 = 5.0;
    open(SAC, "|sac");
    print SAC "echo on\n";      # 加了这一行
    print SAC "r STA.BHN STA.BHE STA.BHZ \n";
    print SAC "ch t0 $var0+$var1\n";
    print SAC "w over";
    print SAC "q\n";
    close(SAC);

运行结果如下：

.. code-block:: bash

     r STA.BHN STA.BHE STA.BHZ
     ch t0 3+5
     w overq
     ERROR 1312: Bad number of files in write file list: 1 3
    SAC Error: EOF/Quit
         SAC executed from a script: quit command missing
         Please add a quit to the script to avoid this message
         If you think you got this message in error,
         please report it to: sac-help@iris.washington.edu
     quit

此时会显示所有脚本传递给 SAC 来执行的命令，从中，可以很明显地看到两个错误。

一个是“``print SAC "ch $var0+$var1\n"``”，由于使用的是 ``print``
语句，perl 会直接做变量替换然后把结果传递给 SAC，因而真正传递给 SAC 的是
``ch t0 3+5``\ ，而不是想象中的 ``ch t0 8``\ ，这个错误可以通过使用
``printf`` 语句来解决。

另一个是，由于 ``print SAC "w over"`` 语句中忘了加换行符，导致实际
传递给 SAC 的不是 ``w over``\ ，而是 ``w overq``\ ，即内存中有三个
波形文件，而 ``write`` 命令中却只给了一个文件名，因而出现了错误1312。

由此可见，\ :doc:`/commands/echo` 命令可以帮助用户清楚地知道真正传递给 SAC 的
是什么，因而是一个很好的 SAC 调试工具。
