fft
===

概要
----

对数据做快速离散傅立叶变换

语法
----

.. code-block:: bash

    FFT [WOmean|Wmean] [Rlim|Amph]

输入
----

WOMEAN
    变换前先去除均值

WMEAN
    变换前不去除均值

RLIM
    输出为实部-虚部格式

AMPH
    输出为振幅-相位格式

缺省值
------

.. code-block:: bash

    fft wmean amph

说明
----

该命令对数据进行离散傅立叶变换。为了使用快速傅立叶变换算法，在进行变换
之前，需要对数据文件进行补零以保证数据点数为2的整数次幂，比如1000个点的
时间序列文件会被补零至1024个点，且头段变量 ``npts`` 也会被相应修改。

进行离散傅立叶变换之后，头段变量 ``b`` 为谱文件的起始频率，其值为0；
``delta`` 为谱文件的采样频率，取值为 ``1/(delta*npts)``\ ； ``e``
为谱文件的结束频率。\ ``b``\ 、\ ``e``\ 、\ ``npts`` 和 ``delta``
的原值被保存到 ``sb``\ 、\ ``se``\ 、\ ``nsnpts`` 和
``sdelta``\ ，这些值在做反傅立叶变换时会用到。

傅里叶变换得到的谱数据可以是振幅-相位格式或实部-虚部格式。头段变量
``iftype`` 会告诉你谱文件是哪种格式。

由于实序列的离散傅立叶变换的结果具有“共轭对称性”，因而在使用
:doc:`/commands/plotsp` 绘制谱文件时只显示一半的数据点数。

示例
----

.. code-block:: bash

    SAC> fg seis
    SAC> lh b e delta npts iftype

              b = 9.459999e+00
              e = 1.945000e+01
          delta = 1.000000e-02
           npts = 1000
         iftype = TIME SERIES FILE
    SAC> fft
     DC level after DFT is -0.98547
    SAC> lh b e delta npts iftype

              b = 0.000000e+00              # b值为0
              e = 5.000000e+01
          delta = 9.765625e-02              # delta=1/(1024*0.01)
           npts = 1024                      # 1000 -> 1024
         iftype = SPECTRAL FILE-AMPL/PHASE
    SAC> lh sb sdelta nsnpts                # 保留原值

             sb = 9.459999e+00
         sdelta = 1.000000e-02
         nsnpts = 1000

头段变量
--------

b、e、delta、npts、sb、se、nsnpts、sdelta

限制
----

离散傅立叶变换所允许的最大数据点数为 :math:`2^{24}=16777216` 个。
