功能命令列表
============

信息模块
--------

-  `comcor </commands/comcor.html>`__\ ：控制SAC的命令校正选项

-  `production </commands/production.html>`__\ ：控制作业模式选项

-  `report </commands/report.html>`__\ ：报告SAC选项的当前状态

-  `trace </commands/trace.html>`__\ ：追踪黑板变量和头段变量

-  `echo </commands/echo.html>`__\ ：控制输入输出回显到终端

-  `history </commands/history.html>`__\ ：打印最近执行的SAC命令列表

-  `message </commands/message.html>`__\ ：发送信息到用户终端

-  `quitsub </commands/quitsub.html>`__\ ：退出子程序

-  `about </commands/about.html>`__\ ：显示版本和版权信息

-  `news </commands/news.html>`__\ ：终端显示关于SAC的一些信息

-  `quit </commands/quit.html>`__\ ：退出SAC

-  `help </commands/help.html>`__\ ：在终端显示SAC命令的语法和功能信息

-  `printhelp </commands/printhelp.html>`__\ ：调用打印机打印帮助文档

-  `inicm </commands/inicm.html>`__\ ：重新初始化SAC

-  `transcript </commands/transcript.html>`__\ ：控制输出到副本文件

执行模块
--------

-  `evaluate </commands/evaluate.html>`__\ ：对简单算术表达式求值

-  `setbb </commands/setbb.html>`__\ ：设置黑板变量的值

-  `unsetbb </commands/unsetbb.html>`__\ ：删除黑板变量

-  `getbb </commands/getbb.html>`__\ ：获取或打印黑板变量的值

-  `mathop </commands/mathop.html>`__\ ：控制数学操作符的优先级

-  `macro </commands/macro.html>`__\ ：执行SAC宏文件

-  `installmacro </commands/installmacro.html>`__\ ：将宏文件安装到SAC全局宏目录中

-  `setmacro </commands/setmacro.html>`__\ ：定义执行SAC宏文件时搜索的一系列目录

-  `systemcommand </commands/systemcommand.html>`__\ ：从SAC中执行系统命令

一元操作模块
------------

-  `add </commands/add.html>`__\ ：为每个数据点加上同一个常数

-  `sub </commands/sub.html>`__\ ：给每个数据点减去同一个常数

-  `mul </commands/mul.html>`__\ ：给每个数据点乘以同一个常数

-  `div </commands/div.html>`__\ ：对每个数据点除以同一个常数

-  `sqr </commands/sqr.html>`__\ ：对每个数据点做平方

-  `sqrt </commands/sqrt.html>`__\ ：对每个数据点取其平方根

-  `abs </commands/abs.html>`__\ ：对每一个数据点取其绝对值

-  `log </commands/log.html>`__\ ：对每个数据点取其自然对数(\ :math:`\ln y`)

-  `log10 </commands/log10.html>`__\ ：对每个数据点取以10为底的对数(\ :math:`\log_{10} y`)

-  `exp </commands/exp.html>`__\ ：对每个数据点取其指数(\ :math:`e^y`)

-  `exp10 </commands/exp10.html>`__\ ：对每个数据点取以10为底的指数(\ :math:`10^y`)

-  `int </commands/int.html>`__\ ：利用梯形法或矩形法对数据进行积分

-  `dif </commands/dif.html>`__\ ：对数据进行微分操作

二元操作模块
------------

-  `addf </commands/addf.html>`__\ ：使内存中的一组数据加上另一组数据

-  `subf </commands/subf.html>`__\ ：使内存中的一组数据减去另一组数据

-  `mulf </commands/mulf.html>`__\ ：使内存中的一组数据乘以另一组数据

-  `divf </commands/divf.html>`__\ ：使内存中的一组数据除以另一组数据

-  `binoperr </commands/binoperr.html>`__\ ：控制二元操作addf、subf、mulf、divf中的错误

-  `merge </commands/merge.html>`__\ ：将多个数据文件合并成一个文件

信号校正模块
------------

-  `rq </commands/rq.html>`__\ ：从谱文件中去除Q因子

-  `rglitches </commands/rglitches.html>`__\ ：去掉信号中的坏点

-  `rmean </commands/rmean.html>`__\ ：去除均值

-  `rtrend </commands/rtrend.html>`__\ ：去除线性趋势

-  `taper </commands/taper.html>`__\ ：对数据两端应用对称的taper函数，使得数据两端平滑地衰减到零

-  `rotate </commands/rotate.html>`__\ ：将成对的正交分量旋转一个角度

-  `quantize </commands/quantize.html>`__\ ：将连续数据数字化

-  `interpolate </commands/interpolate.html>`__\ ：对等间隔或不等间隔数据进行插值以得到新采样率

-  `stretch </commands/stretch.html>`__\ ：拉伸(增采样)数据，包含了一个可选的FIR滤波器

-  `decimate </commands/decimate.html>`__\ ：对数据减采样，包含了一个可选的抗混叠FIR滤波器

-  `smooth </commands/smooth.html>`__\ ：对数据应用算术平滑算法

-  `reverse </commands/reverse.html>`__\ ：将所有数据点逆序

数据文件模块
------------

-  `funcgen </commands/funcgen.html>`__\ ：生成一个函数并将其存在内存中

-  `datagen </commands/datagen.html>`__\ ：产生样本波形数据并储存在内存中

-  `read </commands/read.html>`__\ ：从磁盘读取SAC文件到内存

-  `readbbf </commands/readbbf.html>`__\ ：将黑板变量文件读入内存

-  `readcss </commands/readcss.html>`__\ ：从磁盘读取CSS数据到内存

-  `readerr </commands/readerr.html>`__\ ：控制在执行read命令过程中的错误的处理方式

-  `readhdr </commands/readhdr.html>`__\ ：从SAC数据文件中读取头段到内存

-  `write </commands/write.html>`__\ ：将内存中的数据写入磁盘

-  `writebbf </commands/writebbf.html>`__\ ：将黑板变量文件写入到磁盘

-  `writecss </commands/writecss.html>`__\ ：将内存中的数据以
   ``CSS 3.0`` 格式写入磁盘

-  `writehdr </commands/writehdr.html>`__\ ：用内存中文件的头段区覆盖磁盘文字中的头段区

-  `listhdr </commands/listhdr.html>`__\ ：列出指定的头段变量的值

-  `chnhdr </commands/chnhdr.html>`__\ ：修改指定的头段变量的值

-  `readtable </commands/readtable.html>`__\ ：从磁盘读取列数据文件到内存

-  `copyhdr </commands/copyhdr.html>`__\ ：从内存中的一个文件复制头段变量给其他所有文件

-  `convert </commands/convert.html>`__\ ：实现数据文件格式的转换

-  `cut </commands/cut.html>`__\ ：定义要读入的数据窗

-  `cuterr </commands/cuterr.html>`__\ ：控制坏的截窗参数引起的错误

-  `cutim </commands/cutim.html>`__\ ：截取内存中的文件

-  `deletechannel </commands/deletechannel.html>`__\ ：从内存文件列表中删去一个或多个文件

-  `synchronize </commands/synchronize.html>`__\ ：同步内存中所有文件的参考时刻

-  `sort </commands/sort.html>`__\ ：根据头段变量的值对内存中的文件进行排序

-  `wild </commands/wild.html>`__\ ：设置读命令中用于扩展文件列表的通配符

图形环境模块
------------

-  `saveimg </commands/saveimg.html>`__\ ：将绘图窗口中的图像保存到多种格式的图像文件中

-  `xlim </commands/xlim.html>`__\ ：设定图形中X轴的范围

-  `ylim </commands/ylim.html>`__\ ：设定图形中Y轴的范围

-  `linlin </commands/linlin.html>`__\ ：设置X、Y轴均为线性坐标

-  `loglog </commands/loglog.html>`__\ ：设置X、Y轴均为对数坐标

-  `linlog </commands/linlog.html>`__\ ：设置X轴为线性坐标，Y轴为对数坐标

-  `loglin </commands/loglin.html>`__\ ：设置X轴为对数坐标，Y轴为线性坐标

-  `xlin </commands/xlin.html>`__\ ：设置X轴为线性坐标

-  `ylin </commands/ylin.html>`__\ ：设置Y轴为线性坐标

-  `xlog </commands/xlog.html>`__\ ：设置X轴为对数坐标

-  `ylog </commands/ylog.html>`__\ ：设置Y轴为对数坐标

-  `xdiv </commands/xdiv.html>`__\ ：控制X轴的刻度间隔

-  `ydiv </commands/ydiv.html>`__\ ：控制Y轴的刻度间隔

-  `xfull </commands/xfull.html>`__\ ：控制X轴的绘图为整对数方式

-  `yfull </commands/yfull.html>`__\ ：控制Y轴的绘图为整对数方式

-  `xfudge </commands/xfudge.html>`__\ ：设置X轴范围的附加因子

-  `yfudge </commands/yfudge.html>`__\ ：设置Y轴范围的附加因子

-  `axes </commands/axes.html>`__\ ：控制注释轴的位置

-  `ticks </commands/ticks.html>`__\ ：控制绘图上刻度轴的位置

-  `border </commands/border.html>`__\ ：控制图形四周边框的绘制

-  `grid </commands/grid.html>`__\ ：控制绘图时的网格线

-  `xgrid </commands/xgrid.html>`__\ ：控制绘图时的X方向的网格线

-  `ygrid </commands/ygrid.html>`__\ ：控制绘图时的Y方向的网格线

-  `title </commands/title.html>`__\ ：定义绘图的标题和属性

-  `gtext </commands/gtext.html>`__\ ：控制绘图中文本质量以及字体

-  `tsize </commands/tsize.html>`__\ ：控制文本尺寸属性

-  `xlabel </commands/xlabel.html>`__\ ：定义X轴标签及属性

-  `ylabel </commands/ylabel.html>`__\ ：定义Y轴标签及属性

-  `plabel </commands/plabel.html>`__\ ：定义通用标签及其属性

-  `filenumber </commands/filenumber.html>`__\ ：控制绘图时文件号的显示

-  `fileid </commands/fileid.html>`__\ ：控制绘图时文件ID的显示

-  `picks </commands/picks.html>`__\ ：控制时间标记的显示

-  `qdp </commands/qdp.html>`__\ ：控制低分辨率快速绘图选项

-  `loglab </commands/loglab.html>`__\ ：控制对数轴的标签

-  `beginframe </commands/beginframe.html>`__\ ：打开frame，用于绘制组合图

-  `endframe </commands/endframe.html>`__\ ：关闭frame

-  `beginwindow </commands/beginwindow.html>`__\ ：启动/切换至指定编号的X图形窗口

-  `window </commands/window.html>`__\ ：设置图形窗口位置和宽高比

-  `xvport </commands/xvport.html>`__\ ：定义X轴的视口

-  `yvport </commands/yvport.html>`__\ ：定义Y轴的视口

-  `null </commands/null.html>`__\ ：控制空值的绘制

-  `floor </commands/floor.html>`__\ ：对数数据的最小值

-  `width </commands/width.html>`__\ ：控制图形设备的线宽

-  `color </commands/color.html>`__\ ：控制彩色图形设备的颜色选项

-  `line </commands/line.html>`__\ ：控制绘图中的线型

-  `symbol </commands/symbol.html>`__\ ：控制符号绘图属性

图像控制模块
------------

-  `setdevice </commands/setdevice.html>`__\ ：定义后续绘图时使用的默认图形设备

-  `begindevices </commands/begindevices.html>`__\ ：启动某个图像设备

-  `enddevices </commands/enddevices.html>`__\ ：结束某个图像设备

-  `vspace </commands/vspace.html>`__\ ：设置图形的最大尺寸和长宽比

-  `sgf </commands/sgf.html>`__\ ：控制SGF设备选项

-  `pause </commands/pause.html>`__\ ：发送信息到终端并暂停

-  `wait </commands/wait.html>`__\ ：控制SAC在绘制多个图形时是否暂停

-  `print </commands/print.html>`__\ ：打印最近的SGF文件

图像绘制模块
------------

-  `plot </commands/plot.html>`__\ ：绘制单波形单窗口图形

-  `plot1 </commands/plot1.html>`__\ ：绘制多波形多窗口图形

-  `plot2 </commands/plot2.html>`__\ ：产生一个多波形单窗口绘图

-  `plotpk </commands/plotpk.html>`__\ ：绘图并拾取震相到时

-  `plotdy </commands/plotdy.html>`__\ ：绘制一个带有误差棒的图

-  `plotxy </commands/plotxy.html>`__\ ：以一个文件为自变量，一个或多个文件为因变量绘图

-  `plotalpha </commands/plotalpha.html>`__\ ：从磁盘读入字符数据型文件到内存并将数据绘制出来

-  `plotc </commands/plotc.html>`__\ ：使用光标标注SAC图形和创建图件

-  `plotsp </commands/plotsp.html>`__\ ：用多种格式绘制谱数据

-  `plotpm </commands/plotpm.html>`__\ ：针对一对数据文件产生一个“质点运动”图

-  `erase </commands/erase.html>`__\ ：清除图形显示区域

谱分析模块
----------

-  `hanning </commands/hanning.html>`__\ ：对每个数据文件应用一个“hanning”窗

-  `mulomega </commands/mulomega.html>`__\ ：在频率域进行微分操作

-  `divomega </commands/divomega.html>`__\ ：在频率域进行积分操作

-  `fft </commands/fft.html>`__\ ：对数据做快速离散傅立叶变换

-  `ifft </commands/ifft.html>`__\ ：对数据进行离散反傅立叶变换

-  `keepam </commands/keepam.html>`__\ ：保留内存中谱文件的振幅部分

-  `khronhite </commands/khronhite.html>`__\ ：对数据应用Khronhite滤波器

-  `correlate </commands/correlate.html>`__\ ：计算自相关和互相关函数

-  `convolve </commands/convolve.html>`__\ ：计算主信号与内存中所有信号的卷积

-  `hilbert </commands/hilbert.html>`__\ ：应用Hilbert变换

-  `envelope </commands/envelope.html>`__\ ：利用Hilbert变换计算包络函数

-  `benioff </commands/benioff.html>`__\ ：对数据使用Benioff滤波器

-  `unwrap </commands/unwrap.html>`__\ ：计算振幅和展开相位

-  `wiener </commands/wiener.html>`__\ 设计并应用一个自适应Wiener滤波器

-  `plotsp </commands/plotsp.html>`__\ ：用多种格式绘制谱数据

-  `readsp </commands/readsp.html>`__\ ：读取writesp和writespe写的谱文件

-  `writesp </commands/writesp.html>`__\ ：将谱文件作为一般文件写入磁盘

-  `bandpass </commands/bandpass.html>`__\ ：对数据文件使用无限脉冲带通滤波器

-  `highpass </commands/highpass.html>`__\ ：对数据文件应用一个无限脉冲高通滤波器

-  `lowpass </commands/lowpass.html>`__\ ：对数据文件应用一个无限脉冲高通滤波器

-  `bandrej </commands/bandrej.html>`__\ ：应用一个无限脉冲带阻滤波器

-  `fir </commands/fir.html>`__\ ：应用一个有限脉冲响应滤波器

分析工具
--------

-  `linefit </commands/linefit.html>`__\ ：对内存中数据的进行最小二乘线性拟合

-  `correlate </commands/correlate.html>`__\ ：计算自相关和互相关函数

-  `convolve </commands/convolve.html>`__\ ：计算主信号与内存中所有信号的卷积

-  `envelope </commands/envelope.html>`__\ ：利用Hilbert变换计算包络函数

-  `filterdesign </commands/filterdesign.html>`__\ ：产生一个滤波器的数字和模拟特性的图形显示，包括：振幅，相位，脉冲响应和群延迟

-  `map </commands/map.html>`__\ ：利用SAC内存中的所有数据文件生成GMT地图

-  `whiten </commands/whiten.html>`__\ ：平滑输入的时间序列的频谱

-  `arraymap </commands/arraymap.html>`__\ ：利用SAC内存中的所有文件产生一个台阵或联合台阵的分布图

事件分析模块
------------

-  `ohpf </commands/ohpf.html>`__\ ：打开一个Hypo格式的震相文件

-  `chpf </commands/chpf.html>`__\ ：关闭当前打开的Hypo震相拾取文件

-  `whpf </commands/whpf.html>`__\ ：将辅助内容写入Hypo格式的震相拾取文件中

-  `oapf </commands/oapf.html>`__\ ：打开一个字母数字型震相拾取文件

-  `capf </commands/capf.html>`__\ ：关闭目前打开的字符数字型震相拾取文件

-  `apk </commands/apk.html>`__\ ：对波形使用自动事件拾取算法(由连续信号判断是否其中是否包含地震事件)

-  `plotpk </commands/plotpk.html>`__\ ：产生一个用于拾取到时的图

-  `mtw </commands/mtw.html>`__\ ：决定接下来命令中所使用的测量时间窗

-  `markptp </commands/markptp.html>`__\ ：在测量时间窗内测量并标记最大峰峰值

-  `marktimes </commands/marktimes.html>`__\ ：根据一个速度集得到走时并对数据文件进行标记

-  `markvalue </commands/markvalue.html>`__\ ：在数据文件中搜索并标记某个值

-  `rms </commands/rms.html>`__\ ：计算测量时间窗内的信号的均方根

-  `traveltime </commands/traveltime.html>`__\ ：根据预定义的速度模型计算指定震相的走时

XYZ数据模块
-----------

-  `spectrogram </commands/spectrogram.html>`__\ ：使用内存中的所有数据计算频谱图

-  `sonogram </commands/sonogram.html>`__\ ：计算一个频谱图，其等价于同一个谱图的两个不同的平滑版本的差

-  `image </commands/image.html>`__\ ：利用内存中的数据文件绘制彩色图

-  `loadctable </commands/loadctable.html>`__\ ：允许用户在彩色绘图中选择一个新的颜色表

-  `grayscale </commands/grayscale.html>`__\ ：产生内存中数据的灰度图像

-  `contour </commands/contour.html>`__\ ：利用内存中的数据绘制等值线图

-  `zlevels </commands/zlevels.html>`__\ ：控制后续等值线图上的等值线间隔

-  `zcolors </commands/zcolors.html>`__\ ：控制等值线的颜色显示

-  `zlines </commands/zlines.html>`__\ ：控制后续等值线绘图上的等值线线型

-  `zticks </commands/zticks.html>`__\ ：用方向标记标识等值线

-  `zlabels </commands/zlabels.html>`__\ ：根据等值线的值控制等值线的标记

仪器校正模块
------------

-  `transfer </commands/transfer.html>`__\ ：反卷积以去除仪器响应并卷积以加入其它仪器响应

FK谱
----

-  `bbfk </commands/bbfk.html>`__\ ：利用SAC内存中的所有文件计算宽频频率-波数谱估计

-  `beam </commands/beam.html>`__\ ：利用内存中的全部数据文件计算射线束

.. raw:: latex

   \newpage
