[题目是](https://github.com/oscomp/proj348-riscv-gpu-on-deepin)

0630update:本项目最终没有入围,所以,寄拉😋~
==

最终进度止步于:能跑glmark2-es2-drm

入围后继续的可能进度是:

      DDE软件基本调用

      打包成deb,dpkg即装即用
      
      合并进入Deepin源

如果您想在240625之后获取(相对的)实时进度,[请关注](https://github.com/deepin-community/qtbase-opensource-src)
==
~~或者pm羊瞄dalao~~



对于这块开发板我对其可能的操作有:

      提供PWM风扇控制(好像有人做了)

      nvme启动镜像(改一下spi内的ubbot就行)

      引入手摇加解密库(RISC-V软路由,启动!)

      ~~出售~~

不可能的操作有:

      使用rust重写显示驱动以支持OpenGL&ES Vulkan 等

      修改视频编解码器

原地址:**https://github.com/libiunc/Deepin_RISCV64_mesa**

请**务必**使用[这个](https://github.com/libiunc/Deepin_RISCV64_mesa)github仓库进行评测,
==
使用扭曲的img闭源驱动(blobs,etc..)屏蔽调度,绑定pvr,做到最基本的调用

用什么能简单且直接的看到效果呢?

当然是**glmark2-es2-drm --visual-config s=1**啦😋, [可以看此视频](https://www.bilibili.com/video/BV1eD421g7pX/)

根据[https://github.com/deepin-community/qtbase-opensource-src/pull/28](url)以得到能用GPU的qt5杂交产物

这里感谢 [Icenowy](https://github.com/Icenowy) ,source:[here](https://github.com/libiunc/aosc-os-abbs/blob/stable/runtime-desktop/qt-5/01-runtime/patches/0013-Deepin-auto-select-opengl-or-opengles.patch).提供的patch完善了对qt5的gles调用基础支持 

~~为了不丢人,这里就不细说图形库相关内容了~~

根据与dalao交流所获得的消息得知,jh7110的soc-GPU闭源驱动只能跑OpenGL ES 
=
是的,它不能跑GL只能ES,在这之前Deepin的DDE(个人定义为KDE的特色版本)由llvmpipe渲染,简称cpu渲染
=

[使用的img闭源驱动:](https://github.com/starfive-tech/soft_3rdpart/blob/c43d4fab94b0ef3b492a6382e2282fa7a2695b9b/IMG_GPU/out/img-gpu-powervr-bin-1.19.6345021.tar.gz)

主要的操作:在mesa的22.1.3版本上[加上](https://github.com/Icenowy/aosc-os-pvr/tree/master/ddk119/mesa-ddk119/autobuild/patches) 所有 patch，[参考](https://github.com/Icenowy/aosc-os-pvr/blob/master/ddk119/mesa-ddk119/autobuild/build) 进行打包安装


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

