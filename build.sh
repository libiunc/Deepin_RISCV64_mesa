meson setup bulid/ --prefix=/usr -Ddri-drivers-path=/usr/lib/riscv64-linux-gnu/pvr-dri \
        -Dglvnd=true -Dglvnd-vendor-name=pvr \
        -Dgallium-drivers=pvr -Dvulkan-drivers=pvr \
        -Dglx=disabled -Dllvm=disabled -Dgbm=enabled