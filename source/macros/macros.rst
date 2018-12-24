SAC 宏
======

简单的例子
----------

假如你有一些重复的工作需要完成，那么 SAC 宏显然可以帮你节省不少时间。例如，
要经常读取三个文件 ABC、DEF 和 XYZ，每个文件分别乘以不同的值，做 Fourier 变换，
然后将频谱的振幅部分绘制到 SGF 文件中，这样的一系列命令可以写入到 SAC 宏文件中：

.. code-block:: bash

    ** This certainly is a simple little macro.
    r ABC DEF XYZ
    mul 4 8 9
    fft
    bg sgf
    psp am

假设上面的代码保存到文件 ``mystuff`` 中，且该文件位于当前目录中，
可以通过下面的命令执行该宏文件：

.. code-block:: bash

    SAC> macro mystuff

终端中并不会显示正在执行的宏文件中的命令，可以使用 ``echo`` 命令来设置在终端
显示哪些东西。另外，若某行的第一列为星号则该行为注释行，SAC 不会去执行
注释行。

宏搜索路径
----------

当你执行一个宏文件而又没有给出宏文件的绝对路径时，SAC 会按照下面的路径
顺序搜索宏文件：

#. 在当前目录搜索；
#. 在 :doc:`/commands/setmacro` 命令设置的搜索目录中搜索；
#. 在SAC的全局宏目录（\ ``${SACHOME}/aux/macros``\ ）中搜索；

所有人都可以使用全局宏目录中的宏文件，可以使用 :doc:`/commands/installmacro`
命令将自己的宏文件安装到这个目录中。你也可以通过绝对/相对路径指定搜索路径。

宏参数
------

如果想要每次读取不同的文件或者乘以不同的值那么必须每次都修改该文件，
让宏文件在执行之前允许用户输入参数可以大大增加宏文件的灵活性。

SAC 宏参数的格式为：“``$n$``”，其中n从1开始。

下面将对先前的宏文件进行修改以使其可以接收文件名作为参数：

.. code-block:: bash

    r $1$ $2$ $3$
    mul 4 8 9
    fft
    bg sgf
    psp am

``$1$``\ 、\ ``$2$`` 和 ``$3$`` 分别表示宏文件接收到的第一、二、三个参数，
用下面的命令执行这个宏文件：

.. code-block:: bash

    SAC> macro mystuff ABC DEF XYZ

可以用下面的命令再次执行这个宏文件，但读取不同的文件：

.. code-block:: bash

    SAC> macro mystuff AAA BBB CCC

关键字驱动参数
--------------

关键字驱动参数允许用户按照任意顺序输入参数，这也使得宏文件的内容变得
简单易懂。

当参数的数目以及宏文件的大小不断增大的时候这就变得更加重要了。
下面将再一次修改这个例子以使其可以接受文件列表以及乘数的列表：

.. code-block:: bash

    $keys$ files values
    r $files$
    mul $values$
    fft
    bg sgf
    psp am

``$keys$`` 表明“files”和“values”是关键字。可以按照下面的输入来
执行这个宏文件：

.. code-block:: bash

    SAC> macro mystuff files ABC DEF XYZ values 4 8 9

因为参数的顺序不再重要，所以你可以像下面这样输入：

.. code-block:: bash

    SAC> macro mystuff values 4 8 9 files ABC DEF XYZ

这个宏文件并不限于读取三个文件，它对于文件的数目没有限制，只要文件数与
值数目相匹配就好。

宏参数缺省值
------------

有些时候会遇到这样的情况，宏文件的有些参数在多次执行的过程中经常但并不
总是拥有相同的值。为这些参数提供缺省值可以减少输入那些相同值的次数同时
又保有宏参数本身的灵活性。如下例所示：

.. code-block:: bash

    $keys$ files values
    $default$ values 4 8 9
    r $files$
    mul $values$
    fft
    bg sgf
    psp am

``$default$`` 指定了宏参数 ``values`` 的缺省值，若在执行宏文件时
不输入values的参数值那么这些参数将使用缺省值：

.. code-block:: bash

    SAC> macro mystuff files ABC DEF XYZ

如果想要使用不同的值，可以像下面这样输入：

.. code-block:: bash

    SAC> macro mystuff values 10 12 3 files ABC DEF XYZ

参数请求
--------

若执行宏文件时没有输入参数而这些参数又没有缺省值，SAC 会在终端中提示你
输入相应的参数值。在上面的例子中，如果你忘记输入参数则会出现下面的情况：

.. code-block:: bash

    SAC> macro mystuff
    files? ABC DEF XYZ          # 用户输入ABC DEF XYZ

注意到 SAC 并不会提示输入参数 ``values`` 的值，因为它们已经有了
缺省值。SAC 并非在一开始就提示输入参数，其等到需要计算参数值却发现没有
缺省值或者输入值时才会提示需要输入该参数。

联接
----

头段变量、黑板变量、宏参数以及字符串可以直接联接在一起。

.. code-block:: bash

    $keys$ station
    fg seis
    echo on
    setbb sta $station$.z
    setbb tmp ABC
    setbb tmp1 XYZ%tmp%
    setbb tmp2 (&1,o&)
    setbb fname $station$%tmp%%tmp1%%tmp2%.SAC

执行效果如下：

.. code-block:: bash

    SAC> m stuff station STA
     setbb sta $station$.z
     ==>  setbb sta STA.z
     setbb tmp ABC
     setbb tmp1 XYZ%tmp%
     ==>  setbb tmp1 XYZABC
     setbb tmp2 @(&1,o&@)
     ==>  setbb tmp2 (-41.43)
     setbb fname $station$%tmp%%tmp1%%tmp2%.SAC
     ==>  setbb fname STAABCXYZABC(-41.43).SAC

条件判断
--------

条件判断在任何一个编程语言中都是必不可少的，SAC 宏的条件判断语句与
Fortran77 类似，但不完全相同，要注意区分。

SAC 宏的条件判断格式如下：

.. code-block:: bash

      IF expr
        commands
      ELSEIF expr
        commands
      ELSE
        commands
      ENDIF

逻辑表达式 ``expr`` 具有如下形式：

.. code-block:: bash

        token 关系运算符 token

其中 ``token`` 可以是一个常数、宏参数、黑板变量或头段变量，关系
运算符则是 ``GT``\ 、\ ``GE``\ 、\ ``LE``\ 、\ ``LT``\ 、
``EQ``\ 、\ ``NE``\ 中的一个。上面的逻辑表达式在计算之前 ``token``
会被转换为浮点型数。

条件判断语句目前最多支持10次嵌套，且 ``elseif``\ 、\ ``else``
是可选的，\ ``elseif`` 的次数没有限制。

下面给出一个例子：

.. code-block:: bash

    r $1$
    markptp
    if &1,user0& ge 2.45
        fft
        psp am
    else
        message "Peak to peak for $1 below threshold."
    endif

在这个例子中，一个文件被读入内存，\ :doc:`/commands/markptp` 测出其最大峰峰值，
并保存到头段变量 ``user0`` 中，若该值大于某一确定值，则对其做 Fourier
变换并绘制振幅图，否则输出信息到终端。

循环控制
--------

循环特性允许在一个宏文件中重复执行一系列命令。通过固定循环次数、遍历元素
列表或者设定条件来执行一系列命令，也可以随时中断一次循环。
循环的最大嵌套次数为10次。其语法可以有多种形式：

.. code-block:: bash

    DO variable = start, stop [,increment]
        commands
    ENDDO

.. code-block:: bash

    DO variable FROM start TO stop [BY increment]
        commands
    ENDDO

.. code-block:: bash

    DO variable LIST entrylist
        commands
    ENDDO

.. code-block:: bash

    DO variable WILD [DIR name] entrylist
        commands
    ENDDO

.. code-block:: bash

    WHILE expr
        commands
    ENDDO

其中大写字符串均为关键字，不可更改：

-  variable 是循环变量名，在变量名前后加上“``$``”即可在 do 循环中引用 该变量；
-  ``start``\ 、\ ``stop``\ 、\ ``increment`` 循环变量的初值、终值、增值，
   ``start``\ 、\ ``stop`` 必须为整型数，\ ``increment`` 缺省值为1
-  ``entrylist`` 是 do 循环执行时变量可以取的所有值的集合，值之间
   以空格分开，其可以为整型、浮点型或字符型。\ ``DO WILD`` 中 ``entrylist``
   由字符串和通配符构成，循环执行前，这个列表将根据通配符扩展为一系列文件名。

下面给出一些 DO 循环的例子：

该宏文件对数据使用了 :doc:`/commands/dif` 以进行预白化处理，进行 Fourier 变换，
然后使用 :doc:`/commands/divomega` 命令去除预白化的影响，有时需要在做
变换之前多次预白化，那么就可以这样写：

.. code-block:: bash

    $keys$ file nprew
    $default$ nprew 1
    r $file
    do j = 1 , $nprew$
        dif
    enddo
    fft amph
    do j = 1 , $nprew$
        divomega
    enddo

下面这个例子，用相同的数据绘制5个不同的两秒时间窗的质点运动矢量图：

.. code-block:: bash

    r abc.r abc.t
    setbb time1 0
    do time2 from 2 to 10 by 2
        xlim %time1% $time2$
        title 'Particle motion from %time1% to $time2$'
        plotpm
        setbb time1 $time2$
    enddo

在下面的例子中，一个宏文件调用另一个名为 ``preview`` 的宏文件，
通过do循环以达到多次调用 ``preview`` 的目的：

.. code-block:: bash

    do station list abc def xyz
        do component list z n e
            macro preview $station$.$component$
        enddo
    enddo

在下面的示例展示了如何处理目录 ``mydir`` 中所有以 ``.Z`` 结束 的文件：

.. code-block:: bash

    do file wild dir mydir *.Z
        macro preview $file$
    enddo

最后一个例子有三个参数，第一个是文件名，第二个是一个常数，第三个是一个
阀值。宏文件读取了一个数据文件，然后每个数据点乘以一个常数直到其超过某
一阀值：

.. code-block:: bash

    r $1$
    while &1,depmax& gt $3$
        mul $2$
    enddo

另一个与 break 有关的宏文件：

.. code-block:: bash

    r $1$
    while 1 gt 0
        div $2
        if &1,depmax& gt $3$
            break
        endif
    enddo

这个 ``while`` 循环是一个无限循环，它只能通过 ``break`` 来中断。

嵌套与递归
----------

SAC 宏提供嵌套功能，不支持递归，但是 SAC 并不会去检查宏的调用是否保证不是
递归，因而需要用户去保证宏文件不要直接或间接调用自己。

中断宏
------

有些时候需要临时中断宏文件的执行，用户自己从终端输入一些命令，然后继续
执行宏文件。这个可以利用SAC的 ``pause`` 和 ``resume`` 特性做到。
当SAC在宏文件中遇到 ``$TERMINAL$`` 时会临时停止执行宏文件，更改
提示符为宏名，然后提示从终端输入命令，然后当 SAC 在终端中看到 ``$RESUME$``
时则会停止从终端读取命令继续从宏文件读取。如果你不想再继续执行宏文件中的
命令，可以在终端输入 ``$KILL$``\ ，SAC将关闭宏文件，回到上一层。
在一个宏文件中可以有多个 ``$TERMINAL$`` 中断。

调用外部程序
------------

你可以在 SAC 宏内部执行其他程序，可以向程序传递参数。如果程序是交互式的
你也可以将输入行发送给它，语法如下：

.. code-block:: bash

    $RUN$ program message
    inputlines
    ENDRUN

宏参数、黑板变量、头段变量、内联函数均可使用，在程序执行之前它们会被计算，
当程序执行结束，SAC 宏会在 ``ENDRUN`` 之后继续执行。

转义字符
--------

字符“``$``”和“``%``”在SAC中具有特殊的含义，有时在字符串中需要
使用这些特殊字符，但 SAC 会将其解释成一个变量，此时就需要使用转义字符，
SAC中的转义符为“``@``”，可以被转义的特殊符号包括：

-  ``$`` 宏参数标识符
-  ``%`` 黑板变量标识符
-  ``&`` 头段变量标识符
-  ``@`` 转义字符本身
-  ``()`` 内联函数起始符
