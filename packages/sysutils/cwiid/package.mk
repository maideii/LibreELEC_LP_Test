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

PKG_NAME="cwiid_"
PKG_VERSION="0.6.00+svn201"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/abstrakraft/cwiid"
PKG_URL="https://launchpad.net/ubuntu/+archive/primary/+files/$PKG_NAME$PKG_VERSION.orig.tar.gz"
PKG_SOURCE_DIR="cwiid-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain bluez flex:host bison:host Python"
PKG_SECTION="system"
PKG_LONGDESC="Linux Nintendo Wiimote interface."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="--srcdir=.. \
			   --disable-ldconfig \
			   --without-python"

post_configure_target() {
  mkdir -p $ROOT/$PKG_BUILD/.$TARGET_NAME/common/include
    cp -P $ROOT/$PKG_BUILD/common/include/*.mak $ROOT/$PKG_BUILD/.$TARGET_NAME/common/include/.
  mkdir -p $ROOT/$PKG_BUILD/.$TARGET_NAME/libcwiid
    cp -P $ROOT/$PKG_BUILD/libcwiid/*.c $ROOT/$PKG_BUILD/.$TARGET_NAME/libcwiid/.
    cp -P $ROOT/$PKG_BUILD/libcwiid/*.h $ROOT/$PKG_BUILD/.$TARGET_NAME/libcwiid/.
  mkdir -p $ROOT/$PKG_BUILD/.$TARGET_NAME/wminput
    cp -P $ROOT/$PKG_BUILD/wminput/*.c $ROOT/$PKG_BUILD/.$TARGET_NAME/wminput/.
    cp -P $ROOT/$PKG_BUILD/wminput/*.h $ROOT/$PKG_BUILD/.$TARGET_NAME/wminput/.
    cp -P $ROOT/$PKG_BUILD/wminput/*.l $ROOT/$PKG_BUILD/.$TARGET_NAME/wminput/.
    cp -P $ROOT/$PKG_BUILD/wminput/*.y $ROOT/$PKG_BUILD/.$TARGET_NAME/wminput/.
    cp -P $ROOT/$PKG_BUILD/wminput/action_enum.* $ROOT/$PKG_BUILD/.$TARGET_NAME/wminput/.
    cp -PR $ROOT/$PKG_BUILD/wminput/configs $ROOT/$PKG_BUILD/.$TARGET_NAME/wminput

  mkdir -p $ROOT/$PKG_BUILD/.$TARGET_NAME/wminput/plugins/acc
    cp -P $ROOT/$PKG_BUILD/wminput/plugins/acc/acc.* $ROOT/$PKG_BUILD/.$TARGET_NAME/wminput/plugins/acc/.

  mkdir -p $ROOT/$PKG_BUILD/.$TARGET_NAME/wminput/plugins/ir_ptr
    cp -P $ROOT/$PKG_BUILD/wminput/plugins/ir_ptr/ir_ptr.* $ROOT/$PKG_BUILD/.$TARGET_NAME/wminput/plugins/ir_ptr/.

  mkdir -p $ROOT/$PKG_BUILD/.$TARGET_NAME/wminput/plugins/led
    cp -P $ROOT/$PKG_BUILD/wminput/plugins/led/led.* $ROOT/$PKG_BUILD/.$TARGET_NAME/wminput/plugins/led/.

  mkdir -p $ROOT/$PKG_BUILD/.$TARGET_NAME/wminput/plugins/nunchuk_acc
    cp -P $ROOT/$PKG_BUILD/wminput/plugins/nunchuk_acc/nunchuk_acc.* $ROOT/$PKG_BUILD/.$TARGET_NAME/wminput/plugins/nunchuk_acc/.

  mkdir -p $ROOT/$PKG_BUILD/.$TARGET_NAME/wminput/plugins/nunchuk_stick2btn
    cp -P $ROOT/$PKG_BUILD/wminput/plugins/nunchuk_stick2btn/nunchuk_stick2btn.* $ROOT/$PKG_BUILD/.$TARGET_NAME/wminput/plugins/nunchuk_stick2btn/.

  mkdir -p $ROOT/$PKG_BUILD/.$TARGET_NAME/lswm
    cp -P $ROOT/$PKG_BUILD/lswm/lswm.* $ROOT/$PKG_BUILD/.$TARGET_NAME/lswm/.

  mkdir -p $ROOT/$PKG_BUILD/.$TARGET_NAME/man
    cp -PR $ROOT/$PKG_BUILD/man/man1 $ROOT/$PKG_BUILD/.$TARGET_NAME/man

  mkdir -p $ROOT/$PKG_BUILD/.$TARGET_NAME/doc
    cp -P $ROOT/$PKG_BUILD/doc/wminput.list $ROOT/$PKG_BUILD/.$TARGET_NAME/doc
    cp -P $ROOT/$PKG_BUILD/doc/Xmodmap $ROOT/$PKG_BUILD/.$TARGET_NAME/doc
}

make_target() {
  LDFLAGS="$LDFLAGS -lbluetooth -lpthread"
}
