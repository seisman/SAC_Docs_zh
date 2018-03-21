SAC变体
=======

SAC的发展史还是很曲折的，这也导致SAC存在多个不同的变体。

Fortran SAC
    即SAC的Fortran语言实现。最后一个分发版本发布于2003年，版本号10.6f。曾经以
    限制性的形式在iaspei软件库中分发。

SAC2000
    从Fortran源码转换为C源码，并以C源码为基础继续维护。该版本加入了数据库特性
    以及一些新的命令。目前该版本已不再分发。

SAC/IRIS
    由SAC2000衍生的版本，不包含数据库特性 [1]_，也就是本文档所介绍的版本，
    在本文档中称为SAC。现在由IRIS下的SAC开发小组负责维护，并由IRIS分发。

SAC/BRIS
    也称为 MacSAC，主要在 MacOS X 下使用。该变种由 10.6d Fortran源码衍生而来，
    后期与10.6f集成。该变种除了提供 MacOS X 下预编译的安装包外，还提供了编译
    脚本方便用户自行在其他 Linux 系统下编译使用。该变种的功能是 SAC/IRIS 的
    超集，相对于 SAC/IRIS 的最主要扩展在于增强了宏语言的功能以及处理台阵数据的
    能力，以及支持直接读取 miniSEED 格式的数据文件。 其作者为
    `George Helffrich <http://www1.gly.bris.ac.uk/~george/gh.html>`_ 。

.. [1] 目前 的SAC/IRIS中还可以看到一些与数据库特性相关的命令和选项，比如很多
   命令中的commit、rollback、recalltrace 选项，这些选项的存在属于历史遗留问题，
   且已经基本不再维护，因而本文档中完全没有提及。
