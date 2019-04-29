内联函数
========

内联函数是 SAC 实现的一些函数，其可以在 SAC 命令中使用。在执行命令时，
内联函数会首先被调用，内联函数的结果将替代命令中的内联函数的位置。

SAC 提供了如下几类内联函数：

-  算术运算符；
-  常规算术运算函数；
-  字符串操作函数；
-  其他函数；

所有的内联函数的共同形式是：“``(func)``”，其中 ``func`` 为
内联函数名。某种程度上，内联函数与前面说到头段变量（“``& &``”）和
黑板变量（“``% %``”）类似，可以认为是通过“``( )``”引用了
内联函数的结果或值。

内联函数支持嵌套，目前最多可以嵌套10层。

算术运算符
----------

算术运算符即常规的加减乘除运算符，但又有不同，其一般形式如下：

.. code-block:: bash

        ( number operator number )

所有的操作数都被认为是实型的，所有的算术运算都按照双精度浮点型进行运算；

SAC支持的操作符是包括：“``+  -  *  /  **``\ ”。

看几个简单的例子:

.. code-block:: bash

    SAC> echo on
    SAC> setbb var1 4+7             # 忘记加括号了！“4+7”被当成了字符串
     setbb var1 4+7
    SAC> setbb var2 (4+7)
     setbb var2 (4+7)
     ==>  setbb var2 11             # 4+7=11
    SAC> setbb var3 (4+7/3)         # 优先级正确
     setbb var3 (4+7/3)
     ==>  setbb var3 6.33333
    SAC> setbb var4 ((4+7)/3)       # 括号改变优先级
     setbb var4 ((4+7)/3)           # 可以看作是内联函数的嵌套
     ==>  setbb var4 3.66667
    SAC> setbb var1 ( ( 4 + 7 ) / 3 )   # 支持空格
     setbb var1 ( ( 4 + 7 ) / 3 )
     ==>  setbb var1 3.66667

常规算术运算函数
----------------

SAC 提供了20个常规算术运算函数，其基本形式为“``(func arg1 arg2 ...)``”。
具体函数如 :numref:`table:regular-arithmetic-functions` 所示。

.. _table:regular-arithmetic-functions:

.. table:: 常规算数运算函数

   +------------+---------------------------+---------------------+
   | 命令       | 语法                      | 功能                |
   +============+===========================+=====================+
   | add        | ( add v1 v2 ... vn )      | v1+v2+...+vn        |
   +------------+---------------------------+---------------------+
   | subtract   | ( subtract v1 v2 ... vn ) | v1-v2-...-vn        |
   +------------+---------------------------+---------------------+
   | multiply   | ( multiply v1 v2 ... vn ) | v1*v2*...*vn        |
   +------------+---------------------------+---------------------+
   | divide     | ( divide v1 v2 ... vn )   | v1/v2/.../vn        |
   +------------+---------------------------+---------------------+
   | absolute   | ( absolute v )            | 取绝对值            |
   +------------+---------------------------+---------------------+
   | abs        | ( abs v )                 | 取绝对值            |
   +------------+---------------------------+---------------------+
   | power      | ( power v )               | 取10的v次方         |
   +------------+---------------------------+---------------------+
   | alog10     | ( alog10 v)               | 以10为底取v的对数   |
   +------------+---------------------------+---------------------+
   | alog       | ( alog v)                 | 取v的自然对数       |
   +------------+---------------------------+---------------------+
   | exp        | ( exp v)                  | 取e的v次方          |
   +------------+---------------------------+---------------------+
   | sqrt       | ( sqrt v)                 | 求v的平方根         |
   +------------+---------------------------+---------------------+
   | pi         | ( pi )                    | 返回pi值            |
   +------------+---------------------------+---------------------+
   | sine       | ( sine v )                | 正弦(v为弧度，下同) |
   +------------+---------------------------+---------------------+
   | cosine     | ( cosine v )              | 余弦                |
   +------------+---------------------------+---------------------+
   | tangent    | ( tangent v )             | 正切                |
   +------------+---------------------------+---------------------+
   | arcsine    | ( arcsine v )             | 反正弦              |
   +------------+---------------------------+---------------------+
   | arccosine  | ( arccosine v )           | 反余弦              |
   +------------+---------------------------+---------------------+
   | arctangent | ( arctangent v )          | 反正切              |
   +------------+---------------------------+---------------------+
   | integer    | ( integer v )             | 取整                |
   +------------+---------------------------+---------------------+
   | maximum    | ( maximum v1 v2 ... vn )  | 求最大值            |
   +------------+---------------------------+---------------------+
   | minimum    | ( minimum v1 v2 ... vn )  | 求最小值            |
   +------------+---------------------------+---------------------+

演示如下：

.. code-block:: bash

    SAC> echo on processed
    SAC> setbb var1 (add 1 3 4)         # 1+3+4
     ==>  setbb var1 8
    SAC> setbb var2 (subtract 1 3 4)    # 1-3-4
     ==>  setbb var2 -6
    SAC> setbb var3 (multiply 1 3 4)    # 1*3*4
     ==>  setbb var3 12
    SAC> setbb var4 (divide 1 3 4)      # 1/3/4
     ==>  setbb var4 0.0833333
    SAC> setbb var5 (absolute -5.1)     # abs(-5.1)
     ==>  setbb var5 5.1
    SAC> setbb var6 (power 5)           # 10^5
     ==>  setbb var6 100000
    SAC> setbb var7 (alog10 10000)      # log10(10000)
     ==>  setbb var7 4
    SAC> setbb var8 (alog 10000)        # ln(10000)
     ==>  setbb var8 9.21034
    SAC> setbb var9 (exp 5)             # e^5
     ==>  setbb var9 148.413
    SAC> setbb var10 (sqrt 9)           # sqrt(9)
     ==>  setbb var10 3
    SAC> setbb var11 (pi)               # PI
     ==>  setbb var11 3.14159
     SAC> setbb var12 (sine (pi/6))     # sin(30)
     ==>  setbb var12 0.5
    SAC> setbb var13 ((arcsine 0.5)*180/(pi))
     ==>  setbb var13 30
    SAC> setbb var14 (integer 3.11)
     ==>  setbb var14 3
    SAC> setbb var15 (max 3.11 -1.5 5)  # maximum 简写为 max
     ==>  setbb var15 5
    SAC> setbb var16 (min 3.11 -1.5 5)  # minimum 简写为 min
     ==>  setbb var16 -1.5

为了对一组数据做归一化，首先要找到所有数据中的绝对最大值，如下：

.. code-block:: bash

    SAC> r file1 file2 file3 file4
    SAC> echo on processed
    SAC> setbb vmax (max &1,depmax& &2,depmax& &3,depmax& &4,depmax&)
     ==> setbb vmax 1.87324
    SAC> setbb vmin (min &1,depmin& &2,depmin& &3,depmin& &4,depmin&)
     ==> setbb vmin -2.123371
    SAC> div ( max (abs %vmax%) (abs %vmin%) )      # 嵌套
     ==>  div 2.123371

此例可以通过多重嵌套的方式在单个命令中完成，但上面的写法可读性更强。

字符串操作函数
--------------

SAC 提供了若干个函数用于字符串的处理，如 :numref:`table:string-operation-functions`
所示：

.. _table:string-operation-functions:

.. table:: 字符串操作函数

   +-------------+-----------------------+------------------------------+
   | 命令        | 语法(简写形式)        | 功能                         |
   +=============+=======================+==============================+
   | change      | ( cha s1 s2 s3 )      | 在s3中用s1代替s2             |
   +-------------+-----------------------+------------------------------+
   | substring   | ( substring n1 n2 s ) | 取s中第n1到第n2个字符        |
   +-------------+-----------------------+------------------------------+
   | delete      | ( del s1 s2 )         | 从s2中删去s1                 |
   +-------------+-----------------------+------------------------------+
   | concatenate | ( conc s1 s2 ... sn ) | 将多个字符串拼接起来         |
   +-------------+-----------------------+------------------------------+
   | before      | ( bef s1 s2)          | 得到s2中位于s1前的部分字符串 |
   +-------------+-----------------------+------------------------------+
   | after       | ( aft s1 s2 )         | 得到s2中位于s1后的部分字符串 |
   +-------------+-----------------------+------------------------------+
   | reply       | ( rep s1 )            | 发送信息s1到终端并得到回应   |
   +-------------+-----------------------+------------------------------+

下面的例子展示了部分函数的用法：

.. code-block:: bash

    SAC> echo on processed
    SAC> setbb var1 (cha short long "this is short")
     ==>  setbb var1 this is long
    SAC> set var2 (del def abcdefghi)
     ==>  set var2 abcghi
    SAC> set var4 (before de abcdefg)
     ==>  set var4 abc
    SAC> set var4 (after de abcdefg)
     ==>  set var4 fg
    SAC> fg seis
    SAC> setbb month (substring 1 3 &1,kzdate&)
     ==>  setbb month MAR
    SAC> setbb val "1234567890"
    SAC> message (substring 1 5 %val%)
     ==>  message 12345
     12345

下面的例子展示 ``concatenate`` 函数的用法以及如何灵活定义标题：

.. code-block:: bash

    SAC> fg seis
    SAC> echo on processed
    SAC> setbb var (conc Seismogram of &1,kevnm& &1,kstnm&)
     ==>  setbb var SeismogramofK8108838CDV                 # 没有空格
    SAC> setbb var (conc "Seismogram of " &1,kevnm& " " &1,kstnm&)
     ==>  setbb var Seismogram of K8108838 CDV              # 含空格
    SAC> getbb var
     var = 'Seismogram of K8108838 CDV'
    SAC> title (conc "Seismogram of " &1,kevnm& " " &1,kstnm&)
     ==>  title Seismogram of K8108838 CDV                  # 错误标题！
    SAC> title '(conc "Seismogram of " &1,kevnm& " " &1,kstnm&)'
     ==>  title "(conc "Seismogram of " K8108838 " " CDV)"  # 错误标题！
    SAC> title "Seismogram of &1,kevnm& &1,kstnm&"
     ==>  title "Seismogram of K8108838 CDV"                # 正确标题！

下面的例子使用 ``reply`` 函数实现了交互：

.. code-block:: bash

    SAC> fg seis
    SAC> echo on processed
    SAC> rmean; rtr; taper
    SAC> setbb low (reply "Enter low freqency limit for bandpass: ")
    Enter low freqency limit for bandpass: 2.1          # 用户输入2.1
     ==>  setbb low 2.1
    SAC> setbb high (reply "Enter low freqency limit for bandpass: ")
    Enter low freqency limit for bandpass: 6.5          # 用户输入6.5
     ==>  setbb high 6.5
    SAC> bp c %low% %high%
     ==>  bp c 2.1 6.5

下面的例子中 ``reply`` 函数包含了一个默认值值：

.. code-block:: bash

    SAC> setbb bbday (reply "Enter the day of the week: [Monday]")
    Enter the day of the week: [Monday]Tuesday      # 用户输入Tuesday
    SAC> getbb bbday
     bbday = 'Tuesday'
    SAC> setbb bbday (reply "Enter the day of the week: [Monday]")
    Enter the day of the week: [Monday]             # 用户无输入
    SAC> getbb bbday
     bbday = 'Monday'

当 ``reply`` 函数执行时，引号中的字符串将出现在屏幕上，提示用户
输入。如果用户输入，SAC 会将输入的字符串作为返回值，如果用户只是敲击
回车键，SAC 则会使用该默认值“MONDAY”。

其他函数
--------

这类函数目前只有一个：\ ``gettime``\ ，其语法为 “``(gettime max|min [value])``\ ”。

``gettime`` 函数用于返回数据中首先出现大于或小于 value 的时间相对于
文件参考时刻的相对时间；若没有指定 value，\ ``max`` 会返回文件中第一
个最大值的相对时间，\ ``min`` 会返回文件中第一个最小值的相对时间。

对于所有的文件有一个最大振幅，要找到这些文件中第一个文件中第一次大于
该值所对应的时间偏移量：

.. code-block:: bash

    SAC> fg seis
    SAC> echo on processed
    SAC> setbb maxtime (gettime max)
     ==>  setbb maxtime 12.55
    SAC> setbb mintime (gettime min)
     ==>  setbb mintime 12.67

为了找到第一个大于或等于1.0的数据点的时间偏移，可以使用如下命令：

.. code-block:: bash

    SAC> fg seis
    SAC> echo on processed
    SAC> setbb valuetime ( gettime max 1.0 )
     ==> setbb valuatime 10.55
