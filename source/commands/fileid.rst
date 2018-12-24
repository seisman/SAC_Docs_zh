fileid
======

概要
----

控制绘图时文件 ID 的显示

语法
----

.. code-block:: bash

    FILEID [ON|OFF] [Type Default|Name|List hdrlist] [Location UR|UL|LR|LL]
        [Format Equals|Colons|Nonames]

输入
----

ON
    显示文件 id，不改变文件 id 类型或位置

OFF
    不显示文件 id

TYPE DEFAULT
    设置文件 id 为默认类型

TYPE NAME
    使用文件名作为文件 id

TYPE LIST hdrlist
    定义在文件 id 中显示的头段列表

LOCATION UR|UL|LR|LL
    文件 id 的显示位置，分别表示右上角、左上角、 右下角、左下角

FORMAT EQUALS
    格式为 ``variable=value``

FORMAT COLONS
    格式为 ``variable:value``

FORMAT NONAMES
    格式只包含头段值

缺省值
------

.. code-block:: bash

    fileid on type default location ur format nonames

说明
----

文件 ID 用于标识绘图的内容。默认的文件 ID 包括事件名、台站名、分量、参考
日期及时间。如果需要也可以使用文件名代替默认的文件 id，或者根据头段变量
定义一个特殊的文件 ID，这个 ID 最多可以由10个 SAC 头段变量构成。文件 ID 的位置
以及格式也可以修改。

示例
----

将文件名放在左上角：

.. code-block:: bash

    SAC> fileid location ul type name

定义一个特殊的文件 id，包含台站分量、经纬度：

.. code-block:: bash

    SAC> fileid type list kstcmp stla stlo

文件 id 为头段名后加一个冒号：

.. code-block:: bash

    SAC> fileid format colons

需要强调的是 fileid 命令有 bug，type 不能和 location、format 同时设置，
必须分开设置，一个设置 type，另一个设置 location 和 format：

.. code-block:: bash

    SAC> fileid type list knetwk kstnm
    SAC> fileid location ul format colons
