时区校正
========

假设有一个数据文件，数据中的时间都是中国时间，即东八区时间，现想将数据
修改至国际标准时间，即要对数据做时区校正，将数据的绝对时间整体减少8个
小时。前面说过，时区校正可以通过修改头段变量 ``b`` 的值来实现。

.. code-block:: console

    SAC> r nykl.z                          # 读入数据
    SAC> lh b e kzdate kztime              # 查看头段信息

              b = 1.999622e+02             # b=200
              e = 1.600968e+03             # e=1600
         kzdate = SEP 10 (254), 1984
         kztime = 03:14:07.000
    SAC> ch b (&1,b& - 8*3600)             # 取b值，减去8小时，再赋值给b
    SAC> lh

              b = -2.860004e+04            # 此时b=200-8*3600=-28600
              e = -2.719903e+04
         kzdate = SEP 10 (254), 1984       # 参考时间不变
         kztime = 03:14:07.000
    SAC> ch allt (0 - &1,b&) iztype IB     # 将参考时间设置为文件起始时间
    SAC> lh b e kzdate kztime

              b = 0.000000e+00
              e = 1.401006e+03
         kzdate = SEP 09 (253), 1984       # 中国时间的9月10日3时
         kztime = 19:17:26.963             # => 国际标准时间的9月9日19时

从上面的例子中可以看出，头段变量 ``b`` 的值被减去了8个小时，而数据
的参考时间并没有改变，因而数据整体向前移动了8个小时，即完成了时区校正。

需要注意的是，若数据中头段 ``o``\ 、\ ``a``\ 、\ ``f`` 或 ``tn``
这些相对时间是有定义的，则这些相对时间都会由于 ``b``
值的修改而出错，因而时区校正要尽早做。
