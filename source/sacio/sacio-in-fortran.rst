Fortran 程序中的 SAC I/O
========================

王亮和 seisman 用 Fortran 90 写了一个读写 SAC 文件的模块，以开源许可 Apache 2.0
在 github 上发布。项目地址为：\ http://wangliang.one/sacio_Fortran/\ 。

项目中提供了名为 ``sacio`` 的模块，该模块中包含了6个子程序，所有子
程序的实现都写在源文件 ``sacio.f90`` 中。项目中包含了详细的使用说明
及演示示例，此处仅简单列出每个子程序的功能：

.. table:: sacio模块中的子程序

   ===================== =============================
   子程序                功能
   ===================== =============================
   ``sacio_readhead``    仅读取SAC文件的头段部分
   ``sacio_readsac``     读取整个SAC文件
   ``sacio_writesac``    将数据写到SAC文件中
   ``sacio_readsac_cut`` 读取SAC文件中一部分
   ``sacio_nullhead``    获得一个未定义状态的SAC头段
   ``sacio_newhead``     初始化SAC头段
   ===================== =============================
