listhdr
=======

概要
----

列出指定的头段变量的值

语法
----

.. code-block:: bash

    ListHdr [Default|Picks|SPecial] [FILES ALL|NONE|list] [COLUMNS 1|2]
        [INCLUSIVE ON|OFF] [hdrlist]

输入
----

DEFAULT
    使用默认的头段变量列表，即列出所有已定义的头段变量

PICKS
    使用picks头段列表，即列出与到时拾取相关的头段变量

SPECIAL
    使用用户自定义的特殊头段变量列表

FILES ALL
    列出内存中所有文件的头段

FILES NONE
    不列出头段，为将来的命令设置默认值

FILES list
    列出部分文件的头段，\ ``list``\ 是要列出的文件的文件号

COLUMNS 1|2
    输出格式为每行一/两列

INCLUSIVE ON|OFF
    ``ON`` 表示列出未定义的头段变量的值， ``OFF`` 则不列出

hdrlist
    指定头段变量列表

缺省值
------

.. code-block:: bash

    listhdr default files all columns 1 inclusive off

说明
----

该命令可以列出指定的头段变量的值，用户可以使用默认列表 ``DEFAULT``
列出全部头段变量，或 ``PICKS`` 列出与到时拾取相关的头段变量， 包括
``B``\ 、\ ``E``\ 、\ ``O``\ 、\ ``A``\ 、\ ``Tn``\ 、
``KZTIME``\ 、\ ``KZDATE``\ 。用户可以自定义一个特殊列表并通过
``SPECIAL`` 选项再次使用该列表。

该命令的输出包含头段变量名、一个等于号以及头段变量的当前值。未定义的
头段变量的值用 ``undefined`` 表示。

示例
----

获取 ``picks`` 列表，输出为两列显示：

.. code-block:: bash

    SAC> lh picks column 2

获得第三、四个文件的默认头段列表：

.. code-block:: bash

    SAC> lh files 3 4

列出文件开始和结束时间：

.. code-block:: bash

    SAC> lh b e

定义一个包含台站参数的特殊列表：

.. code-block:: bash

    SAC> lh kstnm stla stlo stel stdp

稍后再次使用上面的特殊列表：

.. code-block:: bash

    SAC> lh special

为后面的 ``lh`` 命令设置输出为两列：

.. code-block:: bash

    SAC> lh columns 2 files none
