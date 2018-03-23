fileid
======

概要
----

控制绘图时文件ID的显示

语法
----

.. code:: bash

    FILEID [ON|OFF] [T\verb|YPE| D\verb|EFAULT||N\verb|AME||L\verb|IST| hdrlist] [L\verb|OCATION| UR|UL|LR|LL]
        [F\verb|ORMAT| E\verb|QUALS||C\verb|OLONS||N\verb|ONAMES|]

输入
----

ON
    显示文件id，不改变文件id类型或位置

OFF
    不显示文件id

TYPE DEFAULT
    设置文件id为默认类型

TYPE NAME
    使用文件名作为文件id

TYPE LIST hdrlist
    定义在文件id中显示的头段列表

LOCATION UR|UL|LR|LL
    文件id的显示位置，分别表示右上角、左上角、 右下角、左下角

FORMAT EQUALS
    格式为 ``variable=value``

FORMAT COLONS
    格式为 ``variable:value``

FORMAT NONAMES
    格式只包含头段值

缺省值
------

fileid on type default location ur format nonames

说明
----

文件ID用于标识绘图的内容。默认的文件ID包括事件名、台站名、分量、参考
日期及时间。如果需要也可以使用文件名代替默认的文件id，或者根据头段变量
定义一个特殊的文件ID，这个ID最多可以由10个SAC头段变量构成。文件ID的位置
以及格式也可以修改。

示例
----

将文件名放在左上角：

.. code:: bash

    SAC> fileid location ul type name

定义一个特殊的文件id，包含台站分量、经纬度：

.. code:: bash

    SAC> fileid type list kstcmp stla stlo

文件id为头段名后加一个冒号：

.. code:: bash

    SAC> fileid format colons

需要强调的是fileid命令有bug，type不能和location、format同时设置，必须分开设置，一个设置type，另一个设置location和format：

.. code:: bash

    SAC> fileid type list knetwk kstnm
    SAC> fileid location ul format colons

如果想要显示很多头段变量，可以适当调整文字大小以免文字超出图片尺寸::

    SAC> tsize tiny 0.01
    SAC> gtext size tiny
    SAC> fileid type list kzdate kztime kstnm kcmpnm dist az
