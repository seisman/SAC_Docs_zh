write
=====

概要
----

将内存中的数据写入磁盘

语法
----

.. code-block:: bash

    Write [SAC|ALPHA|XDR] [DIR OFF|CURRENT|name] [KSTCMP]
        [OVER|APPEND text|PREPEND text|DELETE text|CHANGE text1 text2] filelist

输入
----

无参数
    使用以前的数据格式和文件列表

SAC
    以 SAC 二进制文件格式写入磁盘

ALPHA
    写 SAC 字符数字型写入磁盘

XDR
    用 SAC 二进制 ``XDR`` 格式写文件。这个格式用于实现不同构架的二进制数据的转换

DIR OFF
    关闭目录选项，即写入当前目录

DIR CURRENT
    打开目录选项并设置写目录为当前目录

DIR name
    打开目录选项并设置写目录为 ``name``\ 。将所有的文件写入目录
    ``name`` 中，其可以是相对路径或绝对路径

KSTCMP
    使用 ``KSTNM`` 和 ``KCMPNM`` 头段变量为内存中
    每个数据文件定义一个文件名。生成的文件名将检查是否唯一，如果不唯一，
    则在文件名后加序号以避免文件名冲突

OVER
    使用当前读文件列表作为写文件列表，用内存中的文件覆盖磁盘中的文件

APPEND text
    在当前读文件列表的文件名后附加字符串 ``text`` 以创建写文件列表

PREPEND text
    在当前读文件列表的文件名前附加字符串 ``text`` 以创建写文件列表

DELETE text
    在当前读文件列表的文件名中删除第一次出现的 ``text`` 以创建写文件表

CHANGE text1 text2
    将当前读文件表中每个文件名中第一次出现的 ``text1`` 修改为 ``text2``
    来创建写文件表

filelist
    将写文件列表设置为filelist，这个列表可以包含文件名、相对/
    绝对路径，不可以包含通配符

缺省值
------

.. code-block:: bash

    write sac

说明
----

该命令允许你在数据处理的过程中将结果写入磁盘。写磁盘文件时可以选择几种
数据格式，内存中的每个文件都将完整地写入到磁盘中。

多数情况下，你会选择使用 SAC 数据文件格式，这是 SAC 软件的标准输入输出格式，
用于快速读写，其包含了以一个头段区和一个数据区。具体可以参考
:doc:`/fileformat/index` 一章。

你可以直接指定写文件名，也可以通过修改内存中的当前文件名间接地指定它们。
``OVER`` 选项把写文件表设置为读文件表。它用于覆盖包含当前内存的数据
的读入的最后一组磁盘文件。\ ``APPEND``\ 、\ ``PREPEND``\ 、\ ``DELETE``\ 、
``CHANGE`` 选项通过以所需要的方式修改每个读文件名的方式建立一个
写文件表，这在宏命令中非常有用，在宏命令中你通常需要自动处理大量数据文件，
并保持输出文件风格的一致。当使用这四个选项中的任意一个时，命令执行时会在
终端输出文件列表，使得你可以看到实际写入磁盘的文件名。

示例
----

该命令的简单示例可以参考 :doc:`/basis/read-and-write` 一节。

对一组数据文件进行滤波，然后将结果存入一组新数据文件：

.. code-block:: bash

    SAC> read d1 d2 d3
    SAC> lowpass butter npoles 4
    SAC> write f1 f2 f3

也可以使用 ``CHANGE`` 选项完成这一操作：

.. code-block:: bash

    SAC> read d1 d2 d3
    SAC> lowpass butter npoles 4
    SAC> write change d f

若想要用滤波后的数据替换磁盘中的原始数据，则上例的第三行要变成：

.. code-block:: bash

    SAC> write over

BUGS
----

-  使用 ``dir off`` 和 ``dir current`` 选项会直接报错，因为关键字 ``off``
   和 ``current`` 会被当作普通目录名，而由于目录不存在因而无法写入（v101.6a）
