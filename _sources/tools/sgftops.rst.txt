sgftops
=======

SGF 格式是 SAC 自定义的图像文件格式，转换到常见的其他图像格式，需要使用
转换工具 ``sgftops``\ 。

``sgftops`` 可以将 SGF 格式的文件转换为 PS 格式。其用法如下：

.. code-block:: console

    $ sgftops
    Usage: sgftops sgf_file ps_file [line_width scale_id]
        sgf_file   :  SGF 文件名
        ps_file    :  PS 文件名
        line_width :  图像线宽，可以取1,1.5,2等等
        scale_id   :    - i : landscape模式加上文件id
                        - s : 对图像进行平移、旋转、缩放
                        - si：landscape模式+文件id+平移+旋转+缩放

示例如下：

.. code-block:: console

    $ sgftops f001.sgf f001.ps 2 si
    First translates (x and y), then rotates, then scales:
       [Default] landscape: 8 0 90 1  to prompts
       Sample portrait:  0.5 0.5 0 0.75

    x translation : 0.5
    y translation : 0.5
    rotation angle: 0
    scale........ : 0.75

``sgftoeps`` 和 ``sgftox`` 通过调用 ``sgftops``\ ，将 sgf 文件转换为 eps 文件
或直接显示在图形窗口中，这二者均依赖于 ``ghostscript``\ ， 不再多说。
