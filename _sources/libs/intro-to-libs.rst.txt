SAC 库简介
==========

SAC 提供了两个函数库：\ ``libsacio.a`` 和 ``libsac.a``\ ，用户
可以在自己的 C 或 Fortran 程序中直接使用函数库中的子函数。这些库文件位于
``${SACHOME}/lib`` 中。

``libsacio`` 库
----------------

此库文件包含的子函数可用于读写 SAC 数据文件、SAC 头段变量、黑板变量文件。
这些子函数可以在用户的 C 或 Fortran 程序中直接使用。

``libsacio.a`` 中可用的子函数包括：

.. table:: ``libsacio`` 子函数

   ========= ================================================
   子函数    说明
   ========= ================================================
   rsac1     读取等间隔文件
   rsac2     读取不等间隔文件和谱文件
   wsac1     写入等间隔文件
   wsac2     写入不等间隔文件
   wsac0     可以写等间隔文件或不等间隔文件
   getfhv    获取浮点型头段变量值
   setfhv    设置浮点型头段变量值
   getihv    获取枚举型头段变量值
   setihv    设置枚举型头段变量值
   getkhv    获取字符串头段变量值
   setkhv    设置字符串头段变量值
   getlhv    获取逻辑型头段变量值
   setlhv    设置逻辑型头段变量值
   getnhv    获取整型头段变量值
   setnhv    设置整型头段变量值
   readbbf   读取一个黑板变量文件
   writebbf  写一个黑板变量文件
   getbbv    获取一个黑板变量的值
   setbbv    给一个黑板变量赋值
   distaz    计算地球上任意两点间的震中距、方位角和反方位角
   ========= ================================================

对于 C 源码，用如下命令编译

.. code-block:: console

    $ gcc -c source.c -I/usr/local/sac/include
    $ gcc -o prog source.o -lm -L/usr/local/sac/lib -lsacio

对于 Fortran77 源码，用如下命令编译

.. code-block:: console

    $ gfortran -c source.f
    $ gfortran -o prog source.o -L/usr/local/sac/lib/ -lsacio

``libsac`` 库
--------------

这个库是从 v101.2 版本才引入的，包含了几个数据处理常用的子函数。

``libsac.a`` 包含如下子函数：

.. table:: ``libsac`` 子函数

   ========= ===============================
   子函数    说明
   ========= ===============================
   xapiir    无限脉冲响应滤波器
   firtrn    有限脉冲滤波器，Hilbert变换
   crscor    互相关
   next2     返回比输入值大的最小的2的幂次
   envelope  计算包络函数
   rms       计算数据的均方根
   ========= ===============================

对于 C 源码，用如下命令编译：

.. code-block:: console

    $ gcc -c source.c -I/usr/local/sac/include
    $ gcc -o prog source.o -lm -L/usr/local/sac/lib -lsac -lsacio

对于 Fortran77 源码，用如下命令编译

.. code-block:: console

    $ gfortran -c source.f
    $ gfortran -o prog source.o -L/usr/local/sac/lib/ -lsac -lsacio

.. note::

   调用 ``libsac.a`` 中的函数时，一般也需要同时调用 ``libsacio.a``\ ，
   故而写成 ``-lsac -lsacio``\ 。注意，两个 ``-l`` 选项的顺序不可变。
