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

PKG_NAME="RTL8723BS_BT"
PKG_VERSION="09eb91f"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/lwfinger/rtl8723bs_bt"
PKG_URL="https://github.com/lwfinger/rtl8723bs_bt/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_SECTION="driver"
PKG_SHORTDESC="Realtek RTL8723BS Bluetooth driver"
PKG_LONGDESC="Realtek RTL8723BS Bluetooth driver"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
    make V=1 \
	ARCH=$TARGET_KERNEL_ARCH \
	KSRC=$(kernel_path) \
	CROSS_COMPILE=$TARGET_PREFIX \
	CONFIG_POWER_SAVING=n
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/firmware/rtl_bt
    cp rtlbt_fw_new $INSTALL/usr/lib/firmware/rtl_bt/rtlbt_fw
    cp rtlbt_config $INSTALL/usr/lib/firmware/rtl_bt/.
  mkdir -p $INSTALL/usr/sbin
    cp -p rtk_hciattach $INSTALL/usr/sbin/.
  mkdir -p $INSTALL/usr/config
    cp -p start_bt.sh $INSTALL/usr/config/autostart.sh
}
