调用 libsacio 库
================

rsac1
-----

子函数 ``rsac1`` 用于读取等采样间隔的 SAC 数据。

函数定义如下：

.. code-block:: c

    void rsac1(char  *kname,     // 要读入的文件名
               float *yarray,    // 数据被保存到 yarray 数组中
               int   *nlen,      // 数据长度
               float *beg,       // 数据开始时间，即头段变量 b
               float *del,       // 数据采样周期，即头段变量 delta
               int   *max_,      // 数组 yarray 的最大长度，若 nlen>max_ 则截断
               int   *nerr,      // 错误标记，0代表成功，非零代表失败
               int    kname_s)   // 数组 kname 的长度

相关示例代码为 ``rsac1c.c``\ [1]_ 和 ``rsac1f.f``\ 。

rsac2
-----

子函数 ``rsac2`` 用于读取非等间隔采样的 SAC 数据。

.. code-block:: c

    void rsac2(char  *kname,     // 要读入的文件名
               float *yarray,    // 因变量数组
               int   *nlen,      // 数据长度
               float *xarray,    // 自变量数组
               int   *max_,      // 数组最大长度
               int   *nerr,      // 错误标记
               int    kname_s)   // 数组 kname 的长度

相关示例代码为 ``rsac2c.c`` 和 ``rsac2f.f``\ 。

wsac1
-----

子函数 ``wsac1`` 用于写等间隔 SAC 文件。

.. code-block:: c

    void wsac1(char *kname,        // 要写入的文件名
               float *yarray,      // 要写入文件的数组
               int   *nlen,        // 数组长度
               float *beg,         // 数据起始时刻
               float *del,         // 数据采样周期
               int   *nerr,        // 错误标记
               int    kname_s)     // 文件名长度

相关示例代码为 ``wsac1c.c`` 和 ``wsac1f.f``\ 。

wsac2
-----

写非等间隔 SAC 文件。

.. code-block:: c

    void wsac2(char  *kname,       // 文件名
               float *yarray,      // 因变量数组
               int   *nlen,        // 数组长度
               float *xarray,      // 自变量数组
               int   *nerr,        // 错误码
               int    kname_s)     // 文件名长度

相关示例代码为 ``wsac2c.c`` 和 ``wsac2f.f``\ 。

wsac0
-----

子函数 ``wsac0`` 相对来说更加通用也更复杂，利用该函数可以创建
包含更多头段的 SAC 文件。

.. code-block:: c

    void wsac0(char  *kname,       // 文件名
               float *xarray,      // 自变量数组
               float *yarray,      // 因变量数组
               int   *nerr,        // 错误码
               int    kname_s)     // 文件名长度

要使用子函数 ``wsac0``\ ，首先要调用子函数 ``newhdr`` 创建一个
完全未定义的头段区，并利用其它头段变量相关子函数设置头段变量的值， 并由
``wsac0`` 写入到文件中。必须要赋值的头段变量为 ``delta``\ 、
``b``\ 、\ ``e``\ 、\ ``npts``\ 、\ ``iftype``\ 。

相关示例代码为 ``wsacnc.c`` 、\ ``wsacnf.f``\ ，n为3、4、5。

getfhv
------

获取浮点型头段变量的值。

.. code-block:: c

    void getfhv(char  *kname,       // 头段变量名
                float *fvalue,      // 浮点型头段变量的值
                int   *nerr,        // 错误码
                int    kname_s)     // 变量名长度

相关示例代码为 ``gethvc.c`` 和 ``gethvf.f``\ 。

至于如何获取和设置其它类型的头段变量，方法类似，不再多说。

readbbf
-------

读取一个黑板变量文件。

.. code-block:: c

    void readbbf(char *kname,     // 要读取的文件
                 int  *nerr,      // 错误码
                 int  kname_s)    // 文件名长度

``writebbf`` 与之类似，不再列出。

getbbv
------

获取一个黑板变量的值。

.. code-block:: c

    void getbbv(char *kname,     // 黑板变量名
                char *kvalue,    // 黑板变量的值
                int  *nerr,      // 错误码
                int   kname_s,   // 变量名长度
                int   kvalue_s)  // 变量值的长度

``setbbv`` 的函数定义与其类似，不再列出。

distaz
------

计算地球上任意两点之间的震中距、方位角和反方位角。

.. code-block:: c

    void distaz(double  evla,     // 事件纬度
                double  evlo,     // 事件经度
                float  *stla,     // 台站纬度
                float  *stlo,     // 台站经度
                int     nsta,     // 台站数目
                float  *dist,     // 震中距(km)
                float  *az,       // 方位角
                float  *baz,      // 反方位角
                float  *deg,      // 震中距(度)
                int    *nerr)     // 错误码

示例代码如下：

.. literalinclude:: distaz.c
   :language: C

本例中，台站数目 ``nsta=1``\ 。实际上该函数可以计算任意数目的台站
到事件的震中距、方位角信息。若台站数目 ``nsta`` 不为1，则
``stla``\ 、\ ``stlo``\ 、\ ``dist``\ 、\ ``az``\ 、\ ``baz``\ 、
``deg`` 均可用数组或指针表示。

.. [1] 代码位于 ``sac/doc/examples``\ ， 下同。
