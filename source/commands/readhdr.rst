readhdr
=======

概要
----

从 SAC 数据文件中读取头段到内存

语法
----

.. code-block:: bash

    ReadHdr [MORE] [DIR CURRENT|name] [filelist]

输入
----

MORE
    将新数据头段放在内存中老文件头段之后。若忽略，则新数据文件的
    头段将代替内存中原文件的头段

DIR CURRENT
    从当前目录读取文件。这里的当前目录是指启动SAC的目录

DIR name
    从目录 name 中读取文件，目录名可以是绝对路径或相对路径

filelist
    文件名列表。其可以是简单文件名也可以使用通配符，路径名
    可以是相对路径或绝对路径

说明
----

这个命令将一系列 SAC 文件的头段读入内存，你可以
列出头段内容（\ :doc:`/commands/listhdr`\ ）、
改变头段值（\ :doc:`/commands/chnhdr`\ ）、
将头段写回磁盘（\ :doc:`/commands/writehdr`\ ）。
当你只需要文件的头段的时候，只读取头段要比读取整个文件到内存快很多。
