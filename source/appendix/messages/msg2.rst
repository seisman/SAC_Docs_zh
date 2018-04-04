2001 Command requires an even number of data files
--------------------------------------------------

使用 :doc:`/commands/rotate` 命令进行数据对的旋转时，需要内存中有成对的
数据文件（即偶数个），若内存中数目不为偶数个，则报错。注意检查是否有
数据漏读。

2002 Following files are not an orthogonal pair
-----------------------------------------------

出现该错误的原因是使用 :doc:`/commands/rotate` 旋转的两个分量不完全正交，
此时应注意检查两个分量的头段变量 ``cmpinc`` 和 ``cmpaz``\ 。
若两个头段变量未定义，则需要根据仪器的其他信息确定两个头段变量的值；
若两个头段变量有定义，但的确不正交，则无法进行分量旋转。

2003 Following files are not both horizontals
---------------------------------------------

:doc:`/commands/rotate` 命令的 ``TO`` 选项只能用于将两个水平的分量
旋转到某个角度，出现该错误时应注意检查两个分量的头段变量 ``cmpinc``
是否等于 :math:`90^\circ`\ 。

2004 Insufficient header information for rotation
-------------------------------------------------

:doc:`/commands/rotate` 命令的 ``TO GCP`` 选项要求头段变量中
``stla``\ 、\ ``stlo``\ 、\ ``evla`` 和 ``evlo`` 必须定义。
该选项会读取一对分量中的第一个文件中的头段变量，并计算反方位角，而不是
直接使用头段变量中已有的反方位角值。

2008 Requested begin time is less than files begin time. Output truncated.
--------------------------------------------------------------------------

:doc:`/commands/interpolate` 命令中指定的开始时间小于文件起始时间，此时
输出会被截断。

2111 Taper frequency limits are invalid. No taper applied.
----------------------------------------------------------

该警告出现在 :doc:`/commands/transfer` 命令中，出现该错误的原因是 ``freqlimits``
选项的参数设置有误。四个频率应满足 ``f1<f2<f3<f4``\ 。

出现该警告时，\ :doc:`/commands/transfer` 会忽略 ``freqlimits`` 选项，
即在去仪器响应时不使用 ``taper`` 函数，进而可能导致去仪器响应后的波形出现问题。

2405 Cannot PRINT: no SGF files produced
----------------------------------------

无法打印，原因是未生成 SGF 文件。
