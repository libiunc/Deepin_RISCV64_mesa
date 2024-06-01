echo "Creating directory skeleton ..."
mkdir -pv usr/{lib,share} etc

echo "Copying library files ..."
for i in libGLESv1_CM_PVR_MESA libGLESv2_PVR_MESA libglslcompiler \
         libpvr_dri_support libPVROCL libPVRScopeServices libsrv_um \
         libsutu_display libufwriter libusc libVK_IMG
do
        cp -v target/usr/lib/${i}.so usr/lib/riscv64-linux-gnu/
done

echo "Copying auxillary files ..."
cp -rv target/lib/firmware/ usr/lib/riscv64-linux-gnu/
cp -rv target/etc/vulkan/ usr/share/
cp -v  target/etc/vulkan/icd.d/{icdconf,pvr}.json /usr/share/vulkan/icd.d/pvr.json
cp -rv target/etc/OpenCL/ /usr/share/OpenCL/

echo "Fixing permissions ..."
chmod -v 755 usr/lib/riscv64-linux-gnu/lib*.so

