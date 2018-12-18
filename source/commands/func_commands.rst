功能命令列表
============

信息模块
--------

-  :doc:`/commands/comcor` ：控制 SAC 的命令校正选项
-  :doc:`/commands/production` ：控制作业模式选项
-  :doc:`/commands/report` ：报告 SAC 选项的当前状态
-  :doc:`/commands/trace` ：追踪黑板变量和头段变量
-  :doc:`/commands/echo` ：控制输入输出回显到终端
-  :doc:`/commands/history` ：打印最近执行的 SAC 命令列表
-  :doc:`/commands/message` ：发送信息到用户终端
-  :doc:`/commands/quitsub` ：退出子程序
-  :doc:`/commands/about` ：显示版本和版权信息
-  :doc:`/commands/news` ：终端显示关于 SAC 的一些信息
-  :doc:`/commands/quit` ：退出 SAC
-  :doc:`/commands/help` ：在终端显示 SAC 命令的语法和功能信息
-  :doc:`/commands/printhelp` ：调用打印机打印帮助文档
-  :doc:`/commands/inicm` ：重新初始化 SAC
-  :doc:`/commands/transcript` ：控制输出到副本文件

执行模块
--------

-  :doc:`/commands/evaluate` ：对简单算术表达式求值
-  :doc:`/commands/setbb` ：设置黑板变量的值
-  :doc:`/commands/unsetbb` ：删除黑板变量
-  :doc:`/commands/getbb` ：获取或打印黑板变量的值
-  :doc:`/commands/mathop` ：控制数学操作符的优先级
-  :doc:`/commands/macro` ：执行 SAC 宏文件
-  :doc:`/commands/installmacro` ：将宏文件安装到 SAC 全局宏目录中
-  :doc:`/commands/setmacro` ：定义执行 SAC 宏文件时搜索的一系列目录
-  :doc:`/commands/systemcommand` ：从 SAC 中执行系统命令

一元操作模块
------------

-  :doc:`/commands/add` ：为每个数据点加上同一个常数
-  :doc:`/commands/sub` ：给每个数据点减去同一个常数
-  :doc:`/commands/mul` ：给每个数据点乘以同一个常数
-  :doc:`/commands/div` ：对每个数据点除以同一个常数
-  :doc:`/commands/sqr` ：对每个数据点做平方
-  :doc:`/commands/sqrt` ：对每个数据点取其平方根
-  :doc:`/commands/abs` ：对每一个数据点取其绝对值
-  :doc:`/commands/log` ：对每个数据点取其自然对数（\ :math:`\ln y`\ ）
-  :doc:`/commands/log10` ：对每个数据点取以10为底的对数（\ :math:`\log_{10} y`\ ）
-  :doc:`/commands/exp` ：对每个数据点取其指数（\ :math:`e^y`\ ）
-  :doc:`/commands/exp10` ：对每个数据点取以10为底的指数（\ :math:`10^y`\ ）
-  :doc:`/commands/int` ：利用梯形法或矩形法对数据进行积分
-  :doc:`/commands/dif` ：对数据进行微分操作

二元操作模块
------------

-  :doc:`/commands/addf` ：使内存中的一组数据加上另一组数据
-  :doc:`/commands/subf` ：使内存中的一组数据减去另一组数据
-  :doc:`/commands/mulf` ：使内存中的一组数据乘以另一组数据
-  :doc:`/commands/divf` ：使内存中的一组数据除以另一组数据
-  :doc:`/commands/binoperr` ：控制二元操作 ``addf``\ 、\ ``subf``\ 、
   \ ``mulf``\ 、\ ``divf`` 中的错误
-  :doc:`/commands/merge` ：将多个数据文件合并成一个文件

信号校正模块
------------

-  :doc:`/commands/rq` ：从谱文件中去除 Q 因子
-  :doc:`/commands/rglitches` ：去掉信号中的坏点
-  :doc:`/commands/rmean` ：去除均值
-  :doc:`/commands/rtrend` ：去除线性趋势
-  :doc:`/commands/taper` ：对数据两端应用对称的 taper 函数，使得数据两端平滑地衰减到零
-  :doc:`/commands/rotate` ：将成对的正交分量旋转一个角度
-  :doc:`/commands/quantize` ：将连续数据数字化
-  :doc:`/commands/interpolate` ：对等间隔或不等间隔数据进行插值以得到新采样率
-  :doc:`/commands/stretch` ：拉伸（增采样）数据，包含了一个可选的 FIR 滤波器
-  :doc:`/commands/decimate` ：对数据减采样，包含了一个可选的抗混叠 FIR 滤波器
-  :doc:`/commands/smooth` ：对数据应用算术平滑算法
-  :doc:`/commands/reverse` ：将所有数据点逆序

数据文件模块
------------

-  :doc:`/commands/funcgen` ：生成一个函数并将其存在内存中
-  :doc:`/commands/datagen` ：产生样本波形数据并储存在内存中
-  :doc:`/commands/read` ：从磁盘读取 SAC 文件到内存
-  :doc:`/commands/readbbf` ：将黑板变量文件读入内存
-  :doc:`/commands/readcss` ：从磁盘读取 CSS 数据到内存
-  :doc:`/commands/readerr` ：控制在执行 ``read`` 命令过程中的错误的处理方式
-  :doc:`/commands/readhdr` ：从SAC数据文件中读取头段到内存
-  :doc:`/commands/write` ：将内存中的数据写入磁盘
-  :doc:`/commands/writebbf` ：将黑板变量文件写入到磁盘
-  :doc:`/commands/writecss` ：将内存中的数据以 ``CSS 3.0`` 格式写入磁盘
-  :doc:`/commands/writehdr` ：用内存中文件的头段区覆盖磁盘文字中的头段区
-  :doc:`/commands/listhdr` ：列出指定的头段变量的值
-  :doc:`/commands/chnhdr` ：修改指定的头段变量的值
-  :doc:`/commands/readtable` ：从磁盘读取列数据文件到内存
-  :doc:`/commands/copyhdr` ：从内存中的一个文件复制头段变量给其他所有文件
-  :doc:`/commands/convert` ：实现数据文件格式的转换
-  :doc:`/commands/cut` ：定义要读入的数据窗
-  :doc:`/commands/cuterr` ：控制坏的截窗参数引起的错误
-  :doc:`/commands/cutim` ：截取内存中的文件
-  :doc:`/commands/deletechannel` ：从内存文件列表中删去一个或多个文件
-  :doc:`/commands/synchronize` ：同步内存中所有文件的参考时刻
-  :doc:`/commands/sort` ：根据头段变量的值对内存中的文件进行排序
-  :doc:`/commands/wild` ：设置读命令中用于扩展文件列表的通配符

图形环境模块
------------

-  :doc:`/commands/saveimg` ：将绘图窗口中的图像保存到多种格式的图像文件中
-  :doc:`/commands/xlim` ：设定图形中 X 轴的范围
-  :doc:`/commands/ylim` ：设定图形中 Y 轴的范围
-  :doc:`/commands/linlin` ：设置 X、Y 轴均为线性坐标
-  :doc:`/commands/loglog` ：设置 X、Y 轴均为对数坐标
-  :doc:`/commands/linlog` ：设置 X 轴为线性坐标，Y 轴为对数坐标
-  :doc:`/commands/loglin` ：设置 X 轴为对数坐标，Y 轴为线性坐标
-  :doc:`/commands/xlin` ：设置 X 轴为线性坐标
-  :doc:`/commands/ylin` ：设置 Y 轴为线性坐标
-  :doc:`/commands/xlog` ：设置 X 轴为对数坐标
-  :doc:`/commands/ylog` ：设置 Y 轴为对数坐标
-  :doc:`/commands/xdiv` ：控制 X 轴的刻度间隔
-  :doc:`/commands/ydiv` ：控制 Y 轴的刻度间隔
-  :doc:`/commands/xfull` ：控制 X 轴的绘图为整对数方式
-  :doc:`/commands/yfull` ：控制 Y 轴的绘图为整对数方式
-  :doc:`/commands/xfudge` ：设置 X 轴范围的附加因子
-  :doc:`/commands/yfudge` ：设置 Y 轴范围的附加因子
-  :doc:`/commands/axes` ：控制注释轴的位置
-  :doc:`/commands/ticks` ：控制绘图上刻度轴的位置
-  :doc:`/commands/border` ：控制图形四周边框的绘制
-  :doc:`/commands/grid` ：控制绘图时的网格线
-  :doc:`/commands/xgrid` ：控制绘图时的 X 方向的网格线
-  :doc:`/commands/ygrid` ：控制绘图时的 Y 方向的网格线
-  :doc:`/commands/title` ：定义绘图的标题和属性
-  :doc:`/commands/gtext` ：控制绘图中文本质量以及字体
-  :doc:`/commands/tsize` ：控制文本尺寸属性
-  :doc:`/commands/xlabel` ：定义 X 轴标签及属性
-  :doc:`/commands/ylabel` ：定义 Y 轴标签及属性
-  :doc:`/commands/plabel` ：定义通用标签及其属性
-  :doc:`/commands/filenumber` ：控制绘图时文件号的显示
-  :doc:`/commands/fileid` ：控制绘图时文件 ID 的显示
-  :doc:`/commands/picks` ：控制时间标记的显示
-  :doc:`/commands/qdp` ：控制低分辨率快速绘图选项
-  :doc:`/commands/loglab` ：控制对数轴的标签
-  :doc:`/commands/beginframe` ：打开 frame，用于绘制组合图
-  :doc:`/commands/endframe` ：关闭 frame
-  :doc:`/commands/beginwindow` ：启动/切换至指定编号的X图形窗口
-  :doc:`/commands/window` ：设置图形窗口位置和宽高比
-  :doc:`/commands/xvport` ：定义 X 轴的视口
-  :doc:`/commands/yvport` ：定义 Y 轴的视口
-  :doc:`/commands/null` ：控制空值的绘制
-  :doc:`/commands/floor` ：对数数据的最小值
-  :doc:`/commands/width` ：控制图形设备的线宽
-  :doc:`/commands/color` ：控制彩色图形设备的颜色选项
-  :doc:`/commands/line` ：控制绘图中的线型
-  :doc:`/commands/symbol` ：控制符号绘图属性

图像控制模块
------------

-  :doc:`/commands/setdevice` ：定义后续绘图时使用的默认图形设备
-  :doc:`/commands/begindevices` ：启动某个图像设备
-  :doc:`/commands/enddevices` ：结束某个图像设备
-  :doc:`/commands/vspace` ：设置图形的最大尺寸和长宽比
-  :doc:`/commands/sgf` ：控制 SGF 设备选项
-  :doc:`/commands/pause` ：发送信息到终端并暂停
-  :doc:`/commands/wait` ：控制 SAC 在绘制多个图形时是否暂停
-  :doc:`/commands/print` ：打印最近的 SGF 文件

图像绘制模块
------------

-  :doc:`/commands/plot` ：绘制单波形单窗口图形
-  :doc:`/commands/plot1` ：绘制多波形多窗口图形
-  :doc:`/commands/plot2` ：产生一个多波形单窗口绘图
-  :doc:`/commands/plotpk` ：绘图并拾取震相到时
-  :doc:`/commands/plotdy` ：绘制一个带有误差棒的图
-  :doc:`/commands/plotxy` ：以一个文件为自变量，一个或多个文件为因变量绘图
-  :doc:`/commands/plotalpha` ：从磁盘读入字符数据型文件到内存并将数据绘制出来
-  :doc:`/commands/plotc` ：使用光标标注SAC图形和创建图件
-  :doc:`/commands/plotsp` ：用多种格式绘制谱数据
-  :doc:`/commands/plotpm` ：针对一对数据文件产生一个“质点运动”图
-  :doc:`/commands/erase` ：清除图形显示区域

谱分析模块
----------

-  :doc:`/commands/hanning` ：对每个数据文件应用一个“hanning”窗
-  :doc:`/commands/mulomega` ：在频率域进行微分操作
-  :doc:`/commands/divomega` ：在频率域进行积分操作
-  :doc:`/commands/fft` ：对数据做快速离散傅立叶变换
-  :doc:`/commands/ifft` ：对数据进行离散反傅立叶变换
-  :doc:`/commands/keepam` ：保留内存中谱文件的振幅部分
-  :doc:`/commands/khronhite` ：对数据应用Khronhite滤波器
-  :doc:`/commands/correlate` ：计算自相关和互相关函数
-  :doc:`/commands/convolve` ：计算主信号与内存中所有信号的卷积
-  :doc:`/commands/hilbert` ：应用 Hilbert 变换
-  :doc:`/commands/envelope` ：利用Hilbert变换计算包络函数
-  :doc:`/commands/benioff` ：对数据使用 Benioff 滤波器
-  :doc:`/commands/unwrap` ：计算振幅和展开相位
-  :doc:`/commands/wiener` 设计并应用一个自适应 Wiener 滤波器
-  :doc:`/commands/plotsp` ：用多种格式绘制谱数据
-  :doc:`/commands/readsp` ：读取 ``writesp`` 和 ``writespe`` 写的谱文件
-  :doc:`/commands/writesp` ：将谱文件作为一般文件写入磁盘
-  :doc:`/commands/bandpass` ：对数据文件使用无限脉冲带通滤波器
-  :doc:`/commands/highpass` ：对数据文件应用一个无限脉冲高通滤波器
-  :doc:`/commands/lowpass` ：对数据文件应用一个无限脉冲低通滤波器
-  :doc:`/commands/bandrej` ：应用一个无限脉冲带阻滤波器
-  :doc:`/commands/fir` ：应用一个有限脉冲响应滤波器

分析工具
--------

-  :doc:`/commands/linefit` ：对内存中数据的进行最小二乘线性拟合
-  :doc:`/commands/correlate` ：计算自相关和互相关函数
-  :doc:`/commands/convolve` ：计算主信号与内存中所有信号的卷积
-  :doc:`/commands/envelope` ：利用Hilbert变换计算包络函数
-  :doc:`/commands/filterdesign` ：产生一个滤波器的数字和模拟特性的图形显示，
   包括：振幅，相位，脉冲响应和群延迟
-  :doc:`/commands/map` ：利用 SAC 内存中的所有数据文件生成 GMT 地图
-  :doc:`/commands/whiten` ：平滑输入的时间序列的频谱
-  :doc:`/commands/arraymap` ：利用 SAC 内存中的所有文件产生一个台阵或联合台阵的分布图

事件分析模块
------------

-  :doc:`/commands/ohpf` ：打开一个 Hypo 格式的震相文件
-  :doc:`/commands/chpf` ：关闭当前打开的 Hypo 震相拾取文件
-  :doc:`/commands/whpf` ：将辅助内容写入 Hypo 格式的震相拾取文件中
-  :doc:`/commands/oapf` ：打开一个字母数字型震相拾取文件
-  :doc:`/commands/capf` ：关闭目前打开的字符数字型震相拾取文件
-  :doc:`/commands/apk` ：对波形使用自动事件拾取算法（由连续信号判断是否其中是否包含地震事件）
-  :doc:`/commands/plotpk` ：产生一个用于拾取到时的图
-  :doc:`/commands/mtw` ：决定接下来命令中所使用的测量时间窗
-  :doc:`/commands/markptp` ：在测量时间窗内测量并标记最大峰峰值
-  :doc:`/commands/marktimes` ：根据一个速度集得到走时并对数据文件进行标记
-  :doc:`/commands/markvalue` ：在数据文件中搜索并标记某个值
-  :doc:`/commands/rms` ：计算测量时间窗内的信号的均方根
-  :doc:`/commands/traveltime` ：根据预定义的速度模型计算指定震相的走时

XYZ数据模块
-----------

-  :doc:`/commands/spectrogram` ：使用内存中的所有数据计算频谱图
-  :doc:`/commands/sonogram` ：计算一个频谱图，其等价于同一个谱图的两个不同的平滑版本的差
-  :doc:`/commands/image` ：利用内存中的数据文件绘制彩色图
-  :doc:`/commands/loadctable` ：允许用户在彩色绘图中选择一个新的颜色表
-  :doc:`/commands/grayscale` ：产生内存中数据的灰度图像
-  :doc:`/commands/contour` ：利用内存中的数据绘制等值线图
-  :doc:`/commands/zlevels` ：控制后续等值线图上的等值线间隔
-  :doc:`/commands/zcolors` ：控制等值线的颜色显示
-  :doc:`/commands/zlines` ：控制后续等值线绘图上的等值线线型
-  :doc:`/commands/zticks` ：用方向标记标识等值线
-  :doc:`/commands/zlabels` ：根据等值线的值控制等值线的标记

仪器校正模块
------------

-  :doc:`/commands/transfer` ：反卷积以去除仪器响应并卷积以加入其它仪器响应

FK谱
----

-  :doc:`/commands/bbfk` ：利用 SAC 内存中的所有文件计算宽频频率-波数谱估计
-  :doc:`/commands/beam` ：利用内存中的全部数据文件计算射线束
