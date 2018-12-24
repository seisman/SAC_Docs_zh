writesp
=======

概要
----

将谱文件作为一般文件写入磁盘

语法
----

.. code-block:: bash

    WriteSP [ASIS|RLIM|AMPH|RL|IM|AM|PH] [OVER|filelist]

输入
----

ASIS
    按照谱文件当前格式写入

RLIM
    写入实部和虚部分量

AMPH
    写入振幅和相位分量

RL|IM|AM|PH
    只写入实部/虚拟/振幅/相位分量

filelist
    SAC二进制数据文件列表，这个列表可以包含简单文件名和绝对/相对路径名

缺省值
------

.. code-block:: bash

    writesp asis

说明
----

SAC 数据文件可以为时间序列文件或谱文件。头段中的 ``IFTYPE`` 用于区分
这两种格式。当你读取一个时间序列到内存，对其做快速 Fourier 变换，然后将数据
写回磁盘，此时的文件即为谱文件。

某些操作只能对时间序列文件进行，而某些操作只能对谱文件进行。比如，你无法
对一个谱文件应用 :doc:`/commands/taper` 命令或者将两个谱文件乘起来。
这是 SAC 的保护机制。

然而有时你需要对谱文件做这些操作，为了越过 SAC 的保护机制，你可以使用这个
命令将谱文件像时间序列数据一样写入磁盘。每一个分量都将作为一个单独文件
写入磁盘。然后你可以将这些文件读入 SAC 并进行任何你想要的操作。因为 SAC 认为
其为时间序列文件。一旦这些计算完成了，你可以将修改之后的数据通过
:doc:`/commands/write` 命令写回磁盘。如果你想要读回这个谱文件，可以使用
:doc:`/commands/readsp` 命令。

为了帮助你跟踪磁盘上的数据，SAC 将在你给出的文件名后加一个后缀以标识储存
在文件的谱分量。后缀分别为 ``.RL``\ 、\ ``.IM``\ 、\ ``.AM`` 和 ``.PH``
分别对应不同的分量。

示例
----

假设你想要对 FILE1 的谱文件振幅进行一些操作：

.. code-block:: bash

    SAC> read file1
    SAC> fft amph
    SAC> writesp over

SAC 将输出两个文件 FILE1.AM 和 FILE1.PH，现在可以对振幅文件进行操作：

.. code-block:: bash

    SAC> read file1.am
    SAC> ...perform operations.
    SAC> write over

现在磁盘中的文件为修改后的谱文件，如果你想要重建 SAC 谱数据并进行反变换：

.. code-block:: bash

    SAC> readsp file1
    SAC> ifft
    SAC> write file2

头段变量改变
------------

磁盘文件中的 b、e、delta 将包含频率的起始值、结束值和增值，单位为 Hz
