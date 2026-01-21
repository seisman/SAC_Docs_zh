Matlab 中的 SAC I/O
===================

SAC 官方自带了几个可以读写 SAC 文件的 Matlab 脚本，位于 ``${SACHOME}/utils``
目录下。

readsac
-------

``readsac.m`` 中定义了函数 ``readsac``\ ，可以用于读取 SAC 文件，其参数
为要读取的SAC文件名。文件名可以是：

#. 单个文件名
#. 多个文件名组成的字符串数组
#. 含通配符的字符串或字符串数组
#. 空字符串，表示读取当前目录下的全部SAC文件

``readsac`` 函数有三种用法。第一种用法：

.. code-block:: matlab

    % 读取 SAC 文件，并保存到结构体S中
    >> S = readsac('seis.SAC');
    % 通过 S.varname 形式引用结构体成员的值
    >> S.NPTS
    ans = 1000
    >> S.DELTA
    ans = 0.0100
    % 数据保存到 S.DATA1 数组中
    >> S.DATA1(10)
    ans = -0.0934

第二种用法：

.. code-block:: matlab

    % 读取 SAC 文件，时间和波形振幅分别保存到数组 X 和 Y 中
    >> [X, Y] = readsac('seis.SAC');
    % 若发震时刻 O 未定义，则X数组中保存相对于 B 值的时间
    % 若发震时刻 O 有定义，则X数组中保存相对于 O 值的时间
    >> X(1)
    ans = 50.8900

第三种用法，有三个返回值：

.. code-block:: matlab

    % 用于读取不等间隔数据或 SAC 谱数据
    >> [X, Y1, Y2] = readsac('seis.SAC');
    % 用于读取 XYZ 类型的 SAC 文件
    >> [X, Y, Z] = readsac("seis.SAC.xyz");

getsacdata
----------

在用 ``readsac`` 读取 SAC 文件时，可以直接读入到结构体 S 中，也可以读入到
多个数组中。读入到数组中便于matlab处理，但是却丢失了 SAC 头段中的很多信息；
读入到结构体 S 中，有时却需要用数组做处理，这就可以使用 ``getsacdata``
函数，可以从结构体S中提取出自变量和因变量数组：

.. code-block:: matlab

    % 从文件中读入结构体 S
    >> S = readsac('seis.SAC');
    % 从结构体 S 中提取自变量和因变量
    >> [X, Y] = getsacdata(S);

writesac
--------

``writesac.m`` 中定义了函数 ``writesac``\ ，用于写 SAC 格式的文件，其
输入是结构体 S，返回值是状态码：

.. code-block:: matlab

    % 读入 SAC 数据
    >> S = readsac('seis.SAC');
    % 做一些数据处理
    % ...
    % 修改结构体 S 中的文件名
    >> S.FILENAME = 'new.SAC';
    % 写入到新文件中
    >> status = writesac(S);

其他
----

除了 SAC 官方提供的几个 Matlab 脚本之外，还有其他人也提供了一些 Matlab 脚本：

-  http://geophysics.eas.gatech.edu/people/zpeng/Teaching/MatSAC.tar.gz
-  http://home.chpc.utah.edu/~thorne/software.html
