去仪器响应
==========

**相关命令**\ ：\ :doc:`/commands/transfer`

**相关脚本**\ ：\ :ref:`Perl 脚本 <subsec:transfer.pl>`\ 、\ :ref:`Python 脚本 <subsec:transfer.py>`

SAC 中可以使用命令 :doc:`/commands/transfer` 实现去仪器响应。这一节不介绍
具体的原理和细节，只介绍日常数据处理时最常用的几种去仪器响应的方法。

.. seealso::

    仪器响应的基本原理以及为何需要去除仪器响应，请参考附录
    :doc:`/appendix/resp/index` 以及教科书中的相关内容。
    :doc:`/commands/transfer` 命令的具体用法，见该命令的语法说明及示例。

SAC 中常用的仪器响应文件有两种格式，即 RESP 文件和 PZ 文件。本节会介绍
RESP 文件和 PZ 文件的几种用法，并对每种方法的优缺点进行比较。

使用 RESP 文件去仪器响应
------------------------

RESP 方法1
~~~~~~~~~~

使用 ``evalresp`` 选项但不指定 RESP 文件时，\ ``transfer`` 会对
内存中的所有 SAC 数据进行循环。对于内存中的每个 SAC 数据，从头段中提取台站
分量信息，然后在当前目录下寻找并使用对应的仪器响应文件 ``RESP.NET.STA.LOC.CHN``\ 。

.. code-block:: bash

    SAC> r *.SAC
    SAC> trans from evalresp to none freq 0.004 0.007 0.2 0.4

该方法的好处是，可以一次处理多个 SAC 数据，且无需指定仪器响应文件的文件名。

RESP 方法2
~~~~~~~~~~

可以使用 ``evalresp fname`` 选项为每个波形分别指定 RESP 文件：

.. code-block:: bash

    SAC> r 2006.253.14.30.24.0000.TA.N11A..LHZ.Q.SAC
    SAC> rmean; rtr; taper
    SAC> trans from evalresp fname RESP.TA.N11A..LHZ to none \
                                    freq 0.004 0.007 0.2 0.4

该方法的优点在于，RESP 文件的文件名可以任意，使用起来更灵活。缺点在于，
一次只能处理一个 SAC 数据，数据的批量处理需要写脚本实现。

RESP 方法3
~~~~~~~~~~

可以将所有台站的 RESP 文件都合并到同一个文件中（\ ``cat RESP.*.*.*.* >> RESP.ALL``\ ），
并指定该总 RESP 文件为仪器响应文件，此时命令会从总 RESP 文件中自动寻找匹配
的仪器响应。

.. code-block:: bash

    SAC> r *.SAC
    SAC> trans from evalresp fname RESP.ALL to none freq 0.004 0.007 0.2 0.4

使用 PZ 文件去仪器响应
----------------------

PZ 方法1
~~~~~~~~

手动为每个波形指定 PZ 响应文件：

.. code-block:: bash

    SAC> r OR075_LHZ.SAC
    SAC> rmea; rtr; taper
    SAC> trans from polezero subtype SAC_PZs_XC_OR075_LHZ to none \
                            freq 0.008 0.016 0.2 0.4
    SAC> mul 1.0e9      # 用PZ文件transfer to none得到的位移数据的单位为m
                        # 而SAC默认的单位为nm，因而必须乘以1.0e9
    SAC> w OR075.z      # 此时位移数据的单位为nm

该方法的缺点是，一次只能处理一个波形数据，且需要用户编程指定 PZ 文件名。

PZ 方法2
~~~~~~~~

可以将所有台站的 PZ 文件合并到同一个文件中（\ ``cat SAC_PZs_* >> SAC.PZs``\ ），
并指定该总 PZ 文件为仪器响应文件，此时命令会从总 PZ 文件中自动寻找匹配的仪器
响应。

.. code-block:: bash

    SAC> r *.SAC
    SAC> trans from pol s SAC.PZs to none freq 0.008 0.016 0.2 0.4
    SAC> mul 1.0e9
    SAC> w over

该方法的优点是一次可以处理多个波形数据。

几种方法的对比
--------------

从易用性来看，RESP 方法1、RESP 方法3和 PZ 方法2都是比较易于使用的，
只需要一个简单的命令，即可同时对所有波形数据进行处理。而 RESP 方法2和
PZ 方法1，需要用户自己从数据文件的文件名或头段中提取信息，并指定对应的
响应文件，这需要通过写少量的脚本来实现。

从执行效率来看，做了一个简单的测试，共670个波形数据，用不同的方法去
仪器响应的执行效率如下：

PZ方法1 (8秒) > RESP方法2 (43秒) > RESP方法1 (58秒) > RESP方法2 (90秒) > RESP方法3 (227秒)

从中可以总结出执行效率的如下规律：

#. RESP2 和 PZ1 相比，RESP3 与PZ2 相比，可知，PZ 文件的效率要高于 RESP
   文件。这很容易理解，毕竟 RESP 文件中包含了更为完整的信息，计算量要
   更大一些；PZ 文件中仅包含了零极点信息和总增益信息，对于日常的
   使用来说，已经足够；
#. RESP1 和 RESP2 相比，区别在于：后者使用指定的文件，前者则需要从数据
   中提取信息、构建文件名并在当前目录下搜索，因而 RESP1 要比 RESP2 慢一些；
#. RESP3 和 PZ2 方法，都是把多个响应函数放在同一个响应文件中，
   对于每个波形都需要对响应文件做遍历以找到匹配的响应函数，因而是所有
   方法中速度最慢的。

总结下来：

-  想要写起来简单，用 RESP方法1；
-  想要执行快，可以用 PZ方法1；
