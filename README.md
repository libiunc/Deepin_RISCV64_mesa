[题目是](https://github.com/oscomp/proj348-riscv-gpu-on-deepin)

原地址:**https://github.com/libiunc/Deepin_RISCV64_mesa**
==
使用扭曲的img闭源驱动(blobs,etc..)屏蔽调度,绑定pvr,做到最基本的调用

用什么能简单且直接的看到效果呢?

当然是**glmark2-es2-drm --visual-config s=1**啦😋, [可以看此视频](https://www.bilibili.com/video/BV1eD421g7pX/)

根据[https://github.com/deepin-community/qtbase-opensource-src/pull/28](url)以得到能用GPU的qt5杂交产物

这里感谢 [Icenowy](https://github.com/Icenowy) ,source:[here](https://github.com/libiunc/aosc-os-abbs/blob/stable/runtime-desktop/qt-5/01-runtime/patches/0013-Deepin-auto-select-opengl-or-opengles.patch).提供的patch完善了对qt5的gles调用基础支持 

~~为了不丢人,这里就不细说图形库相关内容了~~

根据与dalao交流所获得的消息得知,jh7110的soc-GPU闭源驱动只能跑OpenGL ES 

[使用的img闭源驱动:](https://github.com/starfive-tech/soft_3rdpart/blob/c43d4fab94b0ef3b492a6382e2282fa7a2695b9b/IMG_GPU/out/img-gpu-powervr-bin-1.19.6345021.tar.gz)

主要的操作:在mesa的22.1.3版本上[加上](https://github.com/Icenowy/aosc-os-pvr/tree/master/ddk119/mesa-ddk119/autobuild/patches) 所有 patch，[参考](https://github.com/Icenowy/aosc-os-pvr/blob/master/ddk119/mesa-ddk119/autobuild/build) 进行打包安装

[镜像下载](https://ci.deepin.com/repo/deepin/deepin-ports/cdimage/20240530/riscv64/deepin-23-beige-preview-riscv64-milkv-mars-20240530-103247.tar.xz)

      1 编译xorg 完成对dde-qt5的gles实现,并且修复xorg的pvrdri相关问题
   
      2 对dde-qt6的gles进行修补实现
   
      3 完善debian的构建依赖
   
      4 进行deb分发,进入软件源中 



学到了什么
   
      meson与ninja的编译流程
   
      使用git命令操作存储库与patch的生成与应用
   
      二进制驱动的分类
   
      ~~**齿轮能转**~~

      图形库相关的大量知识

      python虚拟环境的修改与应用(py venv)

板子很好玩期待后续发展
==
~~**以下是mesa 220103版本的readme**~~
===================================








`Mesa <https://mesa3d.org>`_ - The 3D Graphics Library
======================================================


Source
------

This repository lives at https://gitlab.freedesktop.org/mesa/mesa.
Other repositories are likely forks, and code found there is not supported.


Build & install
---------------

You can find more information in our documentation (`docs/install.rst
<https://mesa3d.org/install.html>`_), but the recommended way is to use
Meson (`docs/meson.rst <https://mesa3d.org/meson.html>`_):

.. code-block:: sh

  $ mkdir build
  $ cd build
  $ meson ..
  $ sudo ninja install


Support
-------

Many Mesa devs hang on IRC; if you're not sure which channel is
appropriate, you should ask your question on `OFTC's #dri-devel
<irc://irc.oftc.net/dri-devel>`_, someone will redirect you if
necessary.
Remember that not everyone is in the same timezone as you, so it might
take a while before someone qualified sees your question.
To figure out who you're talking to, or which nick to ping for your
question, check out `Who's Who on IRC
<https://dri.freedesktop.org/wiki/WhosWho/>`_.

The next best option is to ask your question in an email to the
mailing lists: `mesa-dev\@lists.freedesktop.org
<https://lists.freedesktop.org/mailman/listinfo/mesa-dev>`_


Bug reports
-----------

If you think something isn't working properly, please file a bug report
(`docs/bugs.rst <https://mesa3d.org/bugs.html>`_).


Contributing
------------

Contributions are welcome, and step-by-step instructions can be found in our
documentation (`docs/submittingpatches.rst
<https://mesa3d.org/submittingpatches.html>`_).

Note that Mesa uses gitlab for patches submission, review and discussions.


使用扭曲的闭源驱动(blobs,etc..)绑定pvr 
