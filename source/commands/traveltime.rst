traveltime
==========

概要
----

根据预定义的速度模型计算指定震相的走时

语法
----

.. code-block:: bash

    TRAVELTIME [Model model] [PICKS n] [PHASE phaselist] [VERBOSE|QUIET] [M|KM]

输入
----

MODEL
    预定义的速度模型，可以取 ``iasp91`` 或 ``ak135``\ ，缺省值为 ``iasp91``

PICKS
    ``number``\ 的取值为0到9，表明将第一个震相的到时存储到对应的头段
    变量 ``Tn`` 中，其余震相依次写入到后面的头段变量 ``Tn`` 中；若未指定
    ``PICKS``\ 选项，则只计算震相到时但不写入头段中

PHASE
    要计算/标记的震相列表，若使用了 ``PICKS n`` 选项，则震相到时
    信息将被写入头段 ``Tn`` 和 ``KTn`` 中

VERBOSE|QUIET
    若使用 ``VERBOSE``\ ，则会在终端输出震相走时及其相对于文件参考时刻的秒数；
    若使用 ``QUIET``\ ，则不在屏幕上显示震相走时信息

M|KM
    头段变量 ``evdp`` 的单位为 m 或者 km

缺省值
------

.. code-block:: bash

    traveltime MODEL iasp91 KM PHASE P S Pn Pg Sn Sg

说明
----

该命令使用 `iaspei-tau <https://seiscode.iris.washington.edu/projects/iaspei-tau>`_
程序计算标准速度模型下的震相理论走时，要求内存中的 SAC 数据文件中必须包含
事件位置、台站位置以及发震时刻。震相名区分大小写，可使用的震相名参考
`iaspei-tau <https://seiscode.iris.washington.edu/projects/iaspei-tau>`_
的相关文档。

若使用了 ``PICKS n`` 选项，则会将震相列表中第一个震相的到时存储在
头段变量 ``Tn`` 中，余下的震相到时依次存储到其余的 ``Tn`` 中。
对于每个震相，终端会输出两个时间，前者时震相到时相对于参考时刻的秒数，
后者是震相相对于发震时刻的走时。

由于历史原因，事件深度 ``evdp`` 的单位可以是 m 或 km。SAC 从 v101.5 开始，
``evdp`` 的默认单位是 km，但由于某些程序输出的 SAC 波形依然以 m 作为
``evdp`` 的单位，为了能够兼容这些以 m 为事件深度单位的波形数据，新版的 SAC 中
引入了 ``km`` 和 ``m`` 选项以指定深度单位。

示例
----

区域事件，使用默认震相列表：

.. code-block:: bash

    SAC> fg seismo
    SAC> traveltime
    traveltime: depth: 15.000000
    traveltime: error finding phase P
    traveltime: error finding phase S
    traveltime: setting phase Pn       at 10.464321 s [ t = 51.894321 s ]
    traveltime: setting phase Pg       at 22.904724 s [ t = 64.334724 s ]
    traveltime: setting phase Sn       at 50.047722 s [ t = 91.477722 s ]
    traveltime: setting phase Sg       at 66.414337 s [ t = 107.844337 s ]

由于震中距比较小，没有 P 和 S 震相，所以会出现 ``error finding phase P``
的错误，该错误可忽略。以 Pn 震相为例，震相走时为 51.89 s，相对于参考
时刻的秒数为 10.46 s。

上面的示例，只是计算了震相走时，不会写入到头段变量中。要将震相走时存储到
头段变量中，需要使用 ``PICKS n``\ 选项：

.. code-block:: bash

    SAC> fg seismo
    SAC> traveltime picks 0 phase Pn Pg Sn Sg
    traveltime: depth: 15.000000
    SAC> lh T0MARKER T1MARKER T2MARKER T3MARKER
    T0MARKER = 10.464           (Pn)
    T1MARKER = 22.905           (Pg)
    T2MARKER = 50.048           (Sn)
    T3MARKER = 66.414           (Sg)
    SAC> write seismo-picks.z

可以看到，\ ``T0`` 到 ``T3`` 分别保存了震相 Pn、Pg、Sn、Sg 震相的
到时相对于文件参考时刻的秒数。\ ``KT0`` 到 ``KT3`` 中则分别存储了
相应的震相名。此处，尽管没有使用 ``VERBOSE`` 选项，深度信息还是会被
打印出来，这是为了提醒用户注意 ``evdp`` 的单位，可以通过 ``QUIET``
选项设置不显示深度信息。

``rdseed v5.0`` 生成的波形数据，震源深度 ``evdp`` 的单位为 m：

.. code-block:: bash

    SAC> r 2008.052.14.16.03.0000.XC.OR075.00.LHZ.M.SAC
    SAC> lh evdp
    evdp = 6.700000e+03
    SAC> traveltime M picks 0
    traveltime: depth: 6.700000 km
    SAC> lh t0marker t1marker t2marker t3marker
    t0marker = 61.48            (Pn)
    t1marker = 76.413           (Pg)
    t2marker = 109.66           (Sn)
    t3marker = 132.11           (Sg)
    SAC> ch evdp (0.001 * &1,evdp&) # 将evdp的单位改成km
    SAC> setbb station &1,KSTNM&
    SAC> write %station%.z
