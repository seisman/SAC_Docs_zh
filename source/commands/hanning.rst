hanning
=======

概要
----

对数据文件加 hanning 窗

语法
----

.. code-block:: bash

    HANning

说明
----

hanning 窗是一种对数据点的递归平滑算法。对于每个非端点数据点（\ :math:`j\in[2,N-1]`\ ）
而言，有

.. math:: Y(j)=0.25Y(j-1)+0.50Y(j)+0.25Y(j+1)

更新 :math:`Y(2)` 时使用了 :math:`Y(1)`\ 、\ :math:`Y(2)`\ 、\ :math:`Y(3)`\ 的旧值，
而更新 :math:`Y(3)` 时则使用了 :math:`Y(2)` 的新值以及 :math:`Y(3)`\ 、\ :math:`Y(4)` 的
旧值，这也是其称为\ **递归**\ 平滑算法的原因。

两个端点的数据，需要做特殊处理，令 :math:`Y(1)` 等于 :math:`Y(2)` 的新值，\
:math:`Y(N)` 等于 :math:`Y(N-1)` 的新值。

头段变量
--------

depmin、depmax、depmen
