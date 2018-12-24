datagen
=======

概要
----

产生样本波形数据并储存在内存中

语法
----

.. code-block:: bash

    DataGen [MORE] [SUB Local|Regional|Teleseis] [filelist]

输入
----

MORE
    将新生成的样本数据放在内存中旧文件后。若省略此项，则新数据
    将替代内存中的旧数据

SUB LOCAL|REGIONAL|TELESEIS
    要生成的数据的子类型，每个子类型对应 不同的样本数据

filelist
    样本数据文件列表。每个子类型可选的文件列表在后面给出

说明
----

SAC提供了一些样本地震数据以供用户学习时使用，该命令将读取一个或多个样本
地震数据到内存中。事实上，该命令与 :doc:`/commands/read`
命令类似，只是该命令是从特殊的数据目录（\ ``$SACAUX/datagen``\ ）中读取文件。

该命令提供了三种子类型，分别是 ``local``\ 、\ ``regional`` 和
``teleseis``\ ，分别对应近震、区域地震和远震。不同的子类型所
包含的数据文件也不同。

LOCAL
~~~~~

该local事件发生在加州的 Livermore Valley，是一个很小的无感地震（ML=1.6），
其被Livermore Local Seismic Network (LLSN) 所记录。

LLSN 拥有一系列垂直分量和三分量台站。该数据集中包含了9个三分量台站的数据。
数据时长40秒，每秒100个采样点。台站信息、事件信息、p波及尾波到时都包含在
头段中，这些文件包括：

.. code-block:: bash

        cal.z, cal.n, cal.e
        cao.z, cao.n, cao.e
        cda.z, cda.n, cda.e
        cdv.z, cdv.n, cdv.e
        cmn.z, cmn.n, cmn.e
        cps.z, cps.n, cps.e
        cva.z, cva.n, cva.e
        cvl.z, cvl.n, cvl.e
        cvy.z, cvy.n, cvy.e

REGIONAL
~~~~~~~~

该区域地震发生在 Nevada，被 Digital Seismic Network (DSS) 所记录。DSS 包含了
美国西部的四个宽频带三分量台站。数据包含了从发震前5秒开始的为300秒地震
数据，每秒含40个采样点，文件名为：

.. code-block:: bash

        elk.z, elk.n, elk.e
        lac.z, lac.n, lac.e
        knb.z, knb.n, knb.e
        mnv.z, mnv.n, mnv.e

TELESEIS
~~~~~~~~

该远震事件于1984年9月10日发生在加州北海岸 Eureka 附近，其为中等偏大的地震
（ML 6.6、MB 6.1、MS 6.7），多地有感。该数据集中包含了 Regional Seismic
Test Network (RSTN) 的5个台站的中等周期和长周期数据（其中cpk台站的数据
无法获取，sdk 台站的长周期数据被截断）。这个数据集的数据时长1600秒，长周
期数据每秒1个采样点，中等周期数据每秒4个采样点。文件包括：

.. code-block:: bash

        ntkl.z, ntkl.n, ntkl.e, ntkm.z, ntkm.n, ntkm.e
        nykl.z, nykl.n, nykl.e, nykm.z, nykm.n, nykm.e
        onkl.z, onkl.n, onkl.e, onkm.z, onkm.n, onkm.e
        sdkl.z, sdkl.n, sdkl.e, sdkm.z, sdkm.n, sdkm.e

示例
----

下面的示例展示了一些基本的用法：

.. code-block:: bash

    SAC> dg sub l cal.z    # 单个近震 Z 分量数据
    SAC> dg sub r *.z      # 区域地震多台 Z 分量数据
    SAC> dg sub t sdkl.?   # 远震的单台三分量数据

生成一堆波形数据，并保存数据到磁盘中：

.. code-block:: bash

    SAC> dg sub l cdv.e cdv.n cdv.z
    SAC> w cdv.e cdv.n cdv.z

在写文件时，需要手动指定文件名列表，当文件很多时，就会变得很麻烦。可以
利用 :doc:`/commands/write`  命令的语法简化这一命令：

.. code-block:: bash

    SAC> dg sub local *
    SAC> w delete /opt/sac/aux/datagen/local/

``delete`` 选项的作用是从原始的文件名中删去 ``/opt/sac/aux/datagen/local/``\ ，
只留下文件名。
