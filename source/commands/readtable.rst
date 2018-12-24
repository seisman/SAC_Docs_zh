readtable
=========

概要
----

从磁盘读取列数据文件到内存

语法
----

.. code-block:: bash

    ReadTABle [MORE] [DIR CURRENT|name] [FREE|FORMAT tex] [CONTENT text]
        [HEADER number] [filelist]

所有的选项必须位于 filelist 之前。最后两个选项可以放在每个文件的第一行。

输入
----

MORE
    将新文件追加到内存中老文件之后。若忽略该选项，则新数据将
    替代内存中的老数据

DIR CURRENT
    从当前目录读取所有简单文件名。当前目录是你启动SAC的目录

DIR name
    从目录name中读取全部简单文件，其可以为绝对/相对路径

FREE
    用自由格式读取文件列表中的数据（以空格分隔）

FORMAT text
    以固定格式读取文件列表中的数据。该选项目前不可用

CONTENT text
    定义数据内容。\ ``text`` 的具体格式见说明及示例

HEADER
    文件中要跳过的几个头段行

filelist
    列数据文件

缺省值
------

.. code-block:: bash

    readtable free content y. dir current

说明
----

该命令可以读取文本型列数据。最简单的用法就是读取一个Y数据，也可以通过
修改 ``content`` 的内容读入X-Y数据或更复杂的数据。因而该命令可以
用于直接读取其他程序输出的复杂格式数据。也可以用这个方法读入多个Y数据集，
但只允许一个X数据集。

读入数据时会计算基本的头段变量，包括 ``npts``\ 、\ ``b``\ 、\ ``e``\ 、
``delta``\ 、\ ``leven``\ 、\ ``depmin``\ 、\ ``depmax`` 和
``depmin``\ 。若只有一个 Y 数据集，内存中的数据文件名将和磁盘文件名相同；
若有多个Y数据集，则在文件名之加上一个两位数字。

字符数字型数据文件的每一行都将以自由格式或声明的格式读入，每行最多160个
字符。\ ``content`` 选项用于决定对于数据每行的每个输入该如果处理。 在
``content text`` 中的每个字符分别代表了不同的数据元素，这些字符的
顺序与数据中每行的输入所代表的含义相对应。\ ``content``
字段允许的字符如下:

-  Y：下一个输入属于Y（因变量）数据集
-  X：下一个输入属于X（自变量）数据集
-  N：下一个输入属于数据集
-  P：下一对输入使用X-Y数据集
-  R：下一对输入使用Y-X数据集
-  I：忽略这个输入

还有一个重复计数器可以跟在上面的任何字符之后。这个重复计数器是一个1位或
2位整数，其代表重复前面那个字符多少次，“``.``”是一个无穷次重复
的计数器，其只能出现在 ``content`` 的 ``text`` 的最后，意味着
最后一个字符可以表示接下来的所有输入列。

示例
----

为了读取一个或多个自由格式的 X-Y 数据对：

.. code-block:: bash

    SAC> readtable content p. filea

你不能在文件行之间打断一个 X-Y 数据对。假设你有一个包含了格式化数据的文件，
在每行的中间有一个 X-Y 数据对。每行的其它数据都没有用。假设每行 Y 数据在 X 数据
之前，一旦正确的格式声明给出了，就可以用下面的命令：

.. code-block:: bash

    SAC> readtable content r format \(24x,f12.3,14x,f10.2\) fileb

注意：在左括号和右括号两边的“``\``”是SAC的转义字符，这很重要，因为
SAC 使用括号作为内联函数。由于没有重复计数器，因而只有一个 Y-X 数据对被从
文件的每行读入。

假设你有一个文件 FILEC，其每行包括一个 X 值和7个不同数据集的 Y 值，其为
``(8F10.2)`` 格式。为了在内存中创建7个不同的数据集，可以使用下面的命令：

.. code-block:: bash

    SAC> readtable content xn . format \(8f10.2\) filec

这将在内存中产生7个不同的数据文件，其名称分别为 FILEC01、FILEC02 等等。

现在假设你不想读入第5个 Y 数据集，可以执行下面的命令：

.. code-block:: bash

    SAC> readtable content xn6 format \(5f10.20x,2f10.2\) filec

另一个可以少敲键盘但是稍微低效一点的命令如下：

.. code-block:: bash

    SAC> readtable content xn4in2 format \(8f10.2\) filec

头段变量改变
------------

b、e、delta、leven、depmin、depmax、depmen
