# meson setup bulid/ --prefix=/usr -Ddri-drivers-path=/usr/lib/riscv64-linux-gnu/pvr-dri \
#         -Dglvnd=true -Dglvnd-vendor-name=pvr \
#         -Dgallium-drivers=pvr -Dvulkan-drivers=pvr \
#         -Dglx=disabled -Dllvm=disabled -Dgbm=enabled

# ninja -C "$SRCDIR"/abbuild

# abinfo "Installing ..."
# mkdir -pv "$PKGDIR"/usr/lib "$PKGDIR"/usr/share/glvnd/egl_vendor.d
# DESTDIR="$SRCDIR"/tmp ninja -C "$SRCDIR"/abbuild install
# cp -av "$SRCDIR"/tmp/usr/lib/*pvr* "$PKGDIR"/usr/lib/
# cp -rv "$SRCDIR"/tmp/usr/lib/gbm "$PKGDIR"/usr/lib/
# ln -sfv pvr_gbm.so "$PKGDIR"/usr/lib/gbm/starfive_gbm.so
# cp -v "$SRCDIR"/tmp/usr/share/glvnd/egl_vendor.d/50_pvr.json "$PKGDIR"/usr/share/glvnd/egl_vendor.d/40_pvr.json



# meson setup build/ --prefix=/usr -Ddri-drivers-path=/usr/lib/riscv64-linux-gnu/pvr-dri \
#         -Dglvnd=true -Dglvnd-vendor-name=pvr \
#         -Dgallium-drivers=pvr -Dvulkan-drivers=pvr \
#         -Dglx=disabled -Dllvm=disabled -Dgbm=enabled

# ninja -C build

# echo "Installing ..."
# mkdir -pv /usr/lib /usr/share/glvnd/egl_vendor.d
# ninja -C build install
# cp -av /tmp/usr/lib/*pvr* /usr/lib/
# cp -rv /tmp/usr/lib/gbm /usr/lib/
# ln -sfv pvr_gbm.so /usr/lib/gbm/starfive_gbm.so
# cp -v /tmp/usr/share/glvnd/egl_vendor.d/50_pvr.json /usr/share/glvnd/egl_vendor.d/40_pvr.json
meson setup build/ --prefix=/usr -Ddri-drivers-path=/usr/lib/riscv64-linux-gnu/pvr-dri \
        -Dglvnd=true -Dglvnd-vendor-name=pvr \
        -Dgallium-drivers=pvr -Dvulkan-drivers=pvr \
        -Dglx=disabled -Dllvm=disabled -Dgbm=enabled -Dvalgrind=disabled

ninja -C build

echo "Installing ..."
mkdir -pv /usr/lib /usr/share/glvnd/egl_vendor.d
ninja -C build install
cp -rv /usr/lib/riscv64-linux-gnu/*pvr* /usr/lib/
cp -rv /usr/lib/riscv64-linux-gnu/gbm /usr/lib/
ln -sfv /usr/lib/riscv64-linux-gnu/gbm/pvr_gbm.so /usr/lib/riscv64-linux-gnu/gbm/starfive_gbm.so
cp -v /usr/share/glvnd/egl_vendor.d/50_pvr.json /usr/share/glvnd/egl_vendor.d/40_pvr.json
