readcss
=======

概要
----

从磁盘读取CSS格式的文件到内存

语法
----

.. code-block:: bash

    ReadCSS [BINARY|ASCII] [MAXmem v] [MORE] [TRUST ON|OFF] [VERbose ON|OFF]
        [SHIFT ON|OFF] [SCALE ON|OFF] [MAGnitude MB|MS|ML|DEF] [DIR name] wfdisclist
        [filelist] [cssoptions]

其中 ``cssoptions`` 用于进一步从 ``wfdisc`` 文件中筛选满足条件的数据文件，
``cssoptions`` 可以取：

.. code-block:: bash

        [STAtion station] [CHANnel channel] [BANDwidth bandcode]
        [ORIENTation orientation-code]

输入
----

ASCII
    读取 ASCII 形式的 CSS 文件（默认值）

BINARY
    读取二进制 CSS 文件，阅读 ``writecss`` 以了解更多信息

MAXMEM
    设定读取大量数据时所能使用的最大内存占物理内存的百分比。
    当使用的内存达到设定的上限时，即使已经读取了其他数据库表，也不会再
    读取更多的波形数据。\ ``MAXMEN`` 的默认值是0.3。

MORE
    将读入的波形数据放在内存中的原有波形之后，若不使用该选项，
    则新读入的波形数据会覆盖内存中的原有波形数据，详情参考
    :doc:`/commands/read` 命令。

VERBOSE ON|OFF
    如果 ``VERBOSE`` 是 ON，SAC 会显示正在读取的波形数据的扩展信息，
    并打印出 CSS 数据库表的概要信息以及数据格式转换的进度信息。

SHIFT ON|OFF
    若 ``SHIFT`` 是 ON，则发震时刻将被设置为0，其他相关时间头段变量也会做
    相应修改。与震中距相关的一些头段变量也会受影响。默认值为 ``SHIFT ON``\ 。

SCALE ON|OFF
    ``SCALE`` 选项的默认值是OFF。在 ``wfdisc`` 文件中，有一个字段为校准因子
    ``CALIB``\ 。当 ``SCALE``\ 选项是 OFF 时，SAC 直接从 ``.w``
    文件读取数字信号数据，此时数据的单位是 counts，并将 ``CALIB``
    的值保存到 SAC 头段变量 ``SCALE`` 中。当 ``SCALE`` 选项是 ON 时，
    SAC 会给读取的数据乘以 ``CALIB`` 值，并设置 SAC 的头段变量
    ``SCALE`` 的值为1.0。设置 ``SCALE ON``\ ， 将数据乘以 ``CALIB`` 值，
    在某种程度上可以认为是对数据去除了仪器响应，但该方法很粗糙，完整地去除
    仪器响应应使用 :doc:`/commands/transfer` 命令。仅当 :doc:`/commands/transfer`
    命令所需的仪器响应信息无法获取时，才建议使用 ``SCALE ON``\ 。

MAGNITUDE
    指定要将哪一种震级放在 SAC 的头段变量 ``mag`` 中。
    Mb 是体波震级，Ms 是面波震级，ML 是地方震震级。默认值是
    ``DEF``\ ，其算法为：若 Ms 存在且大于或等于 6.6，则最优先用 Ms。
    否则，如果 Mb 存在，用 Mb。如果 Mb 不存在，而 Ms 存在，用 Ms。其他情况用 ML。

DIR name
    ``wfdisc`` 文件所在的路径

wfdiscfiles
    ``wfdisc`` 文件列表

filelist
    若不指定 filelist，则 ``wfdisc`` 文件所包含的所有波形数据都会被读入内存；
    若指定了 filelist，则只有 filelist 中指定的波形数据才会被读取内存。
    需要注意，filelist 所指定的波形文件名必须位于之前指定的 ``wfdisc`` 文件中。

STATION station
    ``station`` 是一个6个或更少字符构成的字符串。
    ``wfdisc`` 文件中台站名 ``kstnm`` 与 ``station`` 匹配的行会被选中并读取。
    ``station`` 中可以包含通配符 ``*`` 和 ``?`` 。

CHANNEL channel
    ``channel`` 是一个8个或更少字符构成的字符串。\ ``wfdisc``
    文件中通道名与 ``channel`` 匹配的行会被选中并读取。\ ``channel``
    中可以包含通配符 ``*`` 和 ``?``\ 。

BANDWIDTH bandcode
    单字符编码。常见的取值为E、S、H、B、M、L、V、U、R等。
    ``bandcode`` 的具体含义参考附录中表 :ref:`table:bandcode` 。
    ``channel`` 字段中第一个字符与 ``bandcode`` 匹配的行会被
    选择并读取。\ ``bandcode`` 中使用通配符 ``*`` 会匹配所有
    ``bandcode``\ 。

ORIENTATION orientation-code
    ``orientation-code``\ 通常可以取 “Z N E”（表示竖直、北和东）、“1 2
    3”（表示正交但非标准的三个方向）。 ``channel`` 字段中最后一个字符与
    ``orientatio-code`` 相匹配的行会被选中并读取。
    ``orientation-code`` 使用通配符 ``*`` 会匹配所有 ``orientation-code``\ 。

默认值
------

.. code-block:: bash

    readcss ascii maxmem 0.3 verbose off station * band * chan * orient

说明
----

CSS 是一种数据库架构，该命令可以读取 CSS 3.0 或 CSS 2.8中的文件。

每个 CSS 数据库包含了若干个数据库表表，每个数据库表包含若干个记录。对于
CSS 3.0而言，该命令支持读取如下数据库表：\ ``wfdisc``\ 、\ ``wftag``\ 、
``origin``\ 、\ ``arrival``\ 、\ ``assoc``\ 、\ ``sitechan``\ 、
``site``\ 、\ ``affiliation``\ 、\ ``origerr``\ 、\ ``origin``\ 、
``event``\ 、\ ``sensor``\ 、\ ``instrument``\ 、\ ``gregion``\ 、
``stassoc`` 和 ``remark sacdata``\ 。对于CSS 2.8而言，该命令只 支持表
``wfdisc``\ 、\ ``arrival`` 和 ``origin``\ 。

关于 CSS 格式的详细介绍，请参考：

-  https://anf.ucsd.edu/pdf/css30.pdf
-  http://prod.sandia.gov/techlib/access-control.cgi/2002/023055.pdf
-  ftp://ftp.pmel.noaa.gov/newport/lau/tphase/data/css_wfdisc.pdf

在 CSS 数据库的众多表中，最常用的是与波形相关的 ``wfdisc`` 表以及波形数据
``.w`` 文件。\ ``wfdisc`` 表中每行代表一个波形记录，
共19列，每列代表了波形记录的不同信息。详情参考上面列出的格式说明文档。

``readcss`` 命令的 ``BINARY`` 选项，可以用于读取 ``writecss``
命令生成的二进制 CSS 格式。在 BINARY 模式下，\ ``cssoptions`` 选项没有作用，
即 ``wfdisc`` 文件中包含的全部波形数据都会被读取。
