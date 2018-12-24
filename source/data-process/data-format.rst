数据格式转换
============

数据格式
--------

地震数据格式有很多种，常见的包括 SEED、miniSEED 和 SAC。

SEED\ [1]_ 即 Standard for the Exchange of Earthquake Data，其可以存储
多台站多分量的波形数据以及台站元数据\ [2]_。SEED 格式本质上是一个
压缩格式，因而可以大大减少网络传输的数据量以及硬盘空间，同时又可以通过
特定的软件将其中的波形数据解压成其他常见的地震数据格式，也可以将从台站元数据
中提取出仪器响应信息。

除了 SEED 格式，还有 miniSEED 格式和 dataless SEED 格式。miniSEED 格式中仅包含
波形数据，dataless SEED 格式中仅包含台站元数据。之所以要将 SEED 格式拆分成
miniSEED 和 dataless SEED，是因为若每个SEED 文件中都包含台站元数据，会造成
台站元数据的冗余，浪费网络资源及硬盘容量。目前，miniSEED 格式逐渐取代 SEED
成为数据保存和传输过程中的主要格式。

除了 SEED 格式之外，还有其他数据格式，比如为数据库设计的 CSS 3.0 格式，以及
众多数据处理软件自定义的格式，如 SAC、AH、evt 等等。不同国家的台网也可能会
自定义自己的数据格式，比如日本 Hi-net 台网的数据使用自己定义的 win32 格式。

格式转换
--------

IRIS 提供了 `rdseed <http://ds.iris.edu/ds/nodes/dmc/forms/rdseed/>`_
软件，用于提取 SEED 数据中的连续波形数据以及台站元数据，并可将连续波形数据
保存为多种地震数据格式。

下面的命令可以从 SEED 数据中提取 SAC 格式的波形数据，以及台站的 RESP 仪器响应文件：

.. code-block:: console

    $ rdseed -Rdf file.seed

下面的命令可以从 SEED 数据中提取SAC格式的波形数据，以及台站的 PZ 仪器响应文件：

.. code-block:: console

    $ rdseed -pdf file.seed

.. [1] SEED格式的详细说明参考官方文档： http://www.fdsn.org/seed_manual/SEEDManual_V2.4.pdf
.. [2] 台站元数据（Metadata）中包含了台站相关的全部信息，比如台站位置、分量信息、
   仪器响应等。
