SAC 头段结构
============

SAC 头段区包含了一系列头段变量，从这些头段变量中可以了解到波形
记录的很多信息，比如台站经纬度、发震时刻、震相到时等等。下表
列出了 SAC 头段区的全部头段变量。

.. table:: SAC 头段变量列表
   :align: center

   ===== ===== ========= ========= ========= ======= ==========
   字节  类型
   ===== ===== ========= ========= ========= ======= ==========
   0     F     delta     depmin    depmax    scale   odelta
   20    F     b         e         o         a       internal
   40    F     t0        t1        t2        t3      t4
   60    F     t5        t6        t7        t8      t9
   80    F     f         resp0     resp1     resp2   resp3
   100   F     resp4     resp5     resp6     resp7   resp8
   120   F     resp9     stla      stlo      stel    stdp
   140   F     evla      evlo      evel      evdp    mag
   160   F     user0     user1     user2     user3   user4
   180   F     user5     user6     user7     user8   user9
   200   F     dist      az        baz       gcarc   internal
   220   F     internal  depmen    cmpaz     cmpinc  xminimum
   240   F     xmaximum  yminimum  ymaximum  unused  unused
   260   F     unused    unused    unused    unused  unused
   280   N     nzyear    nzjday    nzhour    nzmin   nzsec
   300   N     nzmsec    nvhdr     norid     nevid   npts
   320   N     internal  nwfid     nxsize    nysize  unused
   340   I     iftype    idep      iztype    unused  iinst
   360   I     istreg    ievreg    ievtyp    iqual   isynth
   380   I     imagtyp   imagsrc   unused    unused  unused
   400   I     unused    unused    unused    unused  unused
   420   L     leven     lpspol    lovrok    lcalda  unused
   440   K     kstnm     kevnm\*
   464   K     khole     ko        ka
   488   K     kt0       kt1       kt2
   512   K     kt3       kt4       kt5
   536   K     kt6       kt7       kt8
   560   K     kt9       kf        kuser0
   584   K     kuser1    kuser2    kcmpnm
   608   K     knetwk    kdatrd    kinst
   ===== ===== ========= ========= ========= ======= ==========

整个头段区，共有头段变量133个，占632个字节。头段区的前四个字节是第一个
头段变量 ``delta``\ ，第5–8个字节是第二个头段变量 ``depmin``\ ，
第21–24个字节是第6个头段变量 ``b``\ ，以此类推。

表的第一列给出了当前行的第一个头段变量在文件中的起始字节，第二列给出了
当前行的头段变量的变量类型。

下表列出了 SAC 头段中的头段变量类型及其相关信息。第一列为头段变量类型代码，
第二类给出了其代表的头段变量类型，第三列指出 C 源码中该变量的是用什么类型定义的，
第四列给出了每个变量所占据的字节数，第五列给出了写字符型 SAC 文件时的输出格式，
最后一列则给出该类型的未定义值。

.. table:: 变量类型说明
   :align: center

   ====== ====== ========= ====== ========== ==============
   类型码  类型  C 类型    字节数 printf     未定义值
   ====== ====== ========= ====== ========== ==============
   ``F``  浮点型 ``float`` 4      ``%15.7f`` ``-12345.0``
   ``N``  整型   ``int``   4      ``%10d``   ``-12345``
   ``I``  枚举型 ``int``   4      ``%10d``   ``-12345``
   ``L``  逻辑型 ``int``   4      ``%10d``   ``FALSE``
   ``K``  字符型 ``char*`` 8      ``%-8.8s`` ``"-12345  "``
   ``A``  辅助型
   ====== ====== ========= ====== ========== ==============

说明：

-  所有头段变量的变量名均以变量类型码开头，比如 ``nvhdr`` 是 N 型变量，
   ``leven`` 是 L 型变量，但 F 型变量除外；
-  枚举型变量本质上是 ``int`` 型，只能在固定的几个值中取值；
-  逻辑型变量可以取值 ``TRUE`` 和 ``FALSE``\ ，本质上分别是整型的1和0；
-  字符型变量长度为8\ [1]_，只有 ``kevnm`` 很特殊，其长度为16；
-  变量名为 ``internal`` 表示该变量是 SAC 内部使用的头段变量，
   用户不可对其进行操作；
-  变量名为 ``unused`` 表示该变量尚未使用，为以后可能出现的
   新头段变量占位；
-  当某个头段变量未定义时，其包含未定义值；不同类型的头段变量有不同
   的未定义值；若一个整型头段变量的值为 ``-12345``\ ，则认为该变量
   未定义；实际使用时，可以直接用 ``undef`` 表示所有类型的头段变量
   的未定义值，SAC 会根据头段变量的类型自动将其转换成相应类型的未定义值。
-  辅助型变量并不在 SAC 头段区中，而是从其它头段变量推导得到的。

.. [1] C 语言中用 ``\0`` 作为字符串的结束标识符，因而源码中变量的实际长度为9。
