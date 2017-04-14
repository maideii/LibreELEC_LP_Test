################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="RTL8723BS"
PKG_VERSION="b3def82"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/hadess/rtl8723bs"
PKG_URL="https://github.com/hadess/rtl8723bs/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_SECTION="driver"
PKG_SHORTDESC="Realtek RTL8723BS WIFI Linux >4.5 driver"
PKG_LONGDESC="Realtek RTL8723BS WIFI Linux >4.5 driver"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
       make V=1 \
       ARCH=$TARGET_KERNEL_ARCH \
       KSRC=$(kernel_path) \
       CROSS_COMPILE=$TARGET_PREFIX     
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/modules/$(get_module_dir)/$PKG_NAME
    cp *.ko $INSTALL/usr/lib/modules/$(get_module_dir)/$PKG_NAME

  mkdir -p $INSTALL/usr/lib/firmware/rtl_bt
    cp rtl8723bs_bt.bin $INSTALL/usr/lib/firmware/rtl_bt/.

  mkdir -p $INSTALL/usr/lib/firmware/rtlwifi
    cp  rtl8723bs_*.bin $INSTALL/usr/lib/firmware/rtlwifi/.
}
