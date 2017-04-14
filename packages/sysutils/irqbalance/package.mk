################################################################################
#      This file is part of LibreELEC - https://LibreELEC.tv
#      Copyright (C) 2016 Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="irqbalance"
PKG_VERSION="0e0dd4c"
PKG_REV="1"
PKG_ARCH="i386 x86_64 arm"
PKG_LICENSE="other"
PKG_SITE="https://github.com/Irqbalance/irqbalance"
PKG_URL="https://github.com/Irqbalance/irqbalance/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain systemd glib"
PKG_SECTION="system"
PKG_SHORTDESC="irqbalanced: distribute hardware interrupts across processors on a multiprocessor system."
PKG_LONGDESC="irqbalanced: distribute hardware interrupts across processors on a multiprocessor system."
PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--with-systemd --with-glib2 --without-libcap-ng"

post_makeinstall_target() {
  mkdir -p $INSTALL/etc
    cp $ROOT/$PKG_BUILD/misc/irqbalance.env $INSTALL/etc/irqbalance

  mkdir -p $INSTALL/usr/lib/systemd/system
    cp $ROOT/$PKG_BUILD/misc/irqbalance.service $INSTALL/usr/lib/systemd/system
}

post_install() {
  enable_service irqbalance.service
}
