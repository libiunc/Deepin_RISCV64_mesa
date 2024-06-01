#apt-get install byacc bison meson flex python3-pkgconfig valgrind -y
apt-get  install llvm-dev byacc bison meson flex python3-pkgconfig cmake valgrind libwayland-egl-backend-dev  libunwind-dev libxcb-dri2-0-dev libxcb-dri3-dev xcb-proto libxcb-util-dev libxshmfence-dev
pip install packaging mako ninja --break-system-packages
#python env check
#deb requires install 可能是我太菜了，这构建环境要的东西确实有一点多