saclst
======

``saclst`` 是很常用的一个 SAC 工具，用于列出头段变量的值，其语法很简单：

.. code-block:: console

    $ saclst header_lists f file_lists

其中 ``header_lists`` 为要查看的头段变量名列表；\ ``f`` 为关键字，
表明接下来的所有参数都是 SAC 文件；\ ``file_lists`` 为 SAC 文件列表。需要
注意的是，头段变量名是不区分大小写的，除了头段变量 ``F`` 以外。大写的
``F`` 被当作头段变量名，小写的 ``f`` 被作为关键字。\ [1]_

查看单个文件的单个头段：

.. code-block:: console

    $ saclst npts f seis.SAC
    seis.SAC            1000

查看多个文件的多个头段：

.. code-block:: console

    $ saclst stla stlo evla evlo gcar f N.*.U
    N.AAKH.U      36.3726      137.92      -5.514     151.161     43.4752
    N.ABNH.U      34.6326     137.231      -5.514     151.161     42.0392
    N.AC2H.U      35.4786     137.735      -5.514     151.161     42.6857
    N.AGMH.U       35.787     137.717      -5.514     151.161     42.9798
    N.AGWH.U      43.0842      140.82      -5.514     151.161     49.2714
    N.AHIH.U      38.2799     139.549      -5.514     151.161     44.8874

在 Bash 脚本中将头段变量的值赋值给变量：

.. code-block:: bash

    #!/bin/bash
    stla=`saclst stla f seis | awk '{print $2}'`
    stlo=`saclst stlo f seis | awk '{print $2}'`
    echo $stla $stlo

在 Perl 脚本中将头段变量的值赋值给变量：

.. code-block:: perl

    #!/usr/bin/env perl
    use strict;
    use warnings;

    my ($fname, $stla, $stlo) = split /\s+/, `saclst stla stlo f seis`;
    print "$stla $stlo \n";

.. [1] 这是设计不合理的地方。
