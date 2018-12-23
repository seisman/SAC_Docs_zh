数据来源
========

地震波形数据主要来自于全球各地震数据中心。各地震数据中心的数据下载方式略有不同，
但目前大部分数据中心已支持 `FDSN web service <https://www.fdsn.org/webservices/>`__\ ，
这些支持 FDSN web service 的数据中心均可使用 SOD、ObsPy等工具统一下载数据。

IRIS数据中心
------------

`IRIS DMC <http://ds.iris.edu/ds/nodes/dmc/>`_ 是全球最大的地震波形数据中心，
其提供了全球大多数地震台网的波形数据。
IRIS DMC的大部分数据是完全公开的，无需注册即可直接申请下载波形数据。

IRIS DMC web service: http://service.iris.edu

美国
----

- 北加州地震数据中心：
  `主页 <http://www.ncedc.org/>`__ |
  `web service <http://service.ncedc.org>`__
- 南加州地震数据中心：
  `主页 <http://www.scsn.org/>`__ |
  `web service <http://scedc.caltech.edu/>`__
- Texas地震数据中心：
  `主页 <http://www.beg.utexas.edu/texnet>`__ |
  `web service <http://rtserve.beg.utexas.edu/>`__

加拿大
------

`加拿大地震数据中心 <http://www.earthquakescanada.nrcan.gc.ca/index-en.php>`_\
提供了 `加拿大国家台网 <http://www.earthquakescanada.nrcan.gc.ca/stndon/CNSN-RNSC/index-en.php>`_\ 、
\ `Yellowknife Seismic Array <http://can-ndc.nrcan.gc.ca/yka/index-en.php>`_\ 、
POLARIS Network等台网/台阵的连续波形数据。连续波形数据则可以通过工具
`AutoDRM <http://www.earthquakescanada.nrcan.gc.ca/stndon/AutoDRM/index-en.php>`_ 下载。

欧洲
----

欧洲的地震数据中心相对比较多，但均支持web service。

- BGR Hannover, Germany: http://eida.bgr.de/
- Boğaziçi University, Kandilli Observatory: http://www.koeri.boun.edu.tr/2/tr/
- ETHZ: http://eida.ethz.ch/fdsnws/
- GEOFON Program, GFZ: http://geofon.gfz-potsdam.de/
- ICGC: http://www.icgc.cat/en/xarxasismica
- IPGP Data Center: http://centrededonnees.ipgp.fr
- INGV: http://webservices.ingv.it/
- LMU Munich, Germany: http://www.geophysik.uni-muenchen.de/observatory/seismology
- NIEP, Romania: http://www.orfeus-eu.org/eida/eida_niep.html
- NOA, Greece: http://bbnet.gein.noa.gr/
- ORFEUS Data Center: http://www.orfeus-eu.org/
- RESIF: http://seismology.resif.fr/

中国
----

`国家测震台网数据备份中心 <http://www.seisdmc.ac.cn/>`_\ ，隶属于
中国地震局地球物理研究所。到2014年底，国家测震台网已建成由170个台站
和3个小孔径台阵（共30个子台）组成的国家地震台网；859个台站组成的31个
区域地震台网，33个子台组成的6个火山监测台网；291套地震仪器组成的32个
应急流动观测台网。国家测震台网数据备份中心可以提供从2007年8月起的
全球 M5.5 级以上地震事件以及国内及周边地区 M3.5 级以上地震事件的波形数据。

要申请数据备份中心的数据，需要注册账户并升级账户属性。
要升级账户属性，需要按程序进行申请，并且签署和遵守
`相关协议 <http://www.seisdmc.ac.cn/class/view?id=8>`_\ 。

日本
----

`NIED <http://www.bosai.go.jp/>`_\ 是日本的国家防灾科学技术研究所。其
下包含若干台网：

- 高感度地震观测网 `Hi-net <http://www.hinet.bosai.go.jp/>`_
- 宽频带地震台网 `F-net <http://www.fnet.bosai.go.jp/>`_
- 强地面运动地震台网 `K-net和KiK-net <http://www.kyoshin.bosai.go.jp/>`_
- 火山观测网 `V-net <http://www.vnet.bosai.go.jp/>`_

南美
----

- USP Seismological Center, Brazil: http://www.moho.iag.usp.br/

澳大利亚
--------

- AusPass, Australia: http://auspass.edu.au/
