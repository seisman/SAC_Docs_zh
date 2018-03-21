#!/bin/bash
#
# Generate Seismogram for Logo
#
export SAC_DISPLAY_COPYRIGHT=0
sac <<END
# 生成数据文件
datagen sub tele onkm.e
decimate 2
# 去除右上角的台站名、台网名、参考时刻等
fileid off
# 绘制全部数据点，去除右下角的11
qdp off
# 线条颜色为红色
color red
# 去坐标轴
axes off all
# 去刻度
ticks off all
# 去边界
border off
# 滤波让一些震相明显一点
bp c 0.001 0.2
# 画图到窗口
p
# 保存图像到文件
saveimg SAC_logo.ps
# 退出
quit
END
ps2raster -A -Tf SAC_logo.ps
ps2raster -A -Tg SAC_logo.ps
rm SAC_logo.ps
