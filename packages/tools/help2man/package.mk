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

PKG_NAME="help2man"
PKG_VERSION="1.47.4"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://www.gnu.org/software/help2man/"
PKG_URL="http://mirror.ibcp.fr/pub/gnu/help2man/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_HOST="ccache:host"
PKG_SECTION="tool"
PKG_SHORTDESC="Program to create simple man pages from the --help and --version output of other programs. "
PKG_LONGDESC="Program to create simple man pages from the --help and --version output of other programs."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

export CXX="$ROOT/$TOOLCHAIN/bin/host-g++"

PKG_CONFIGURE_OPTS_HOST="--disable-nls"

makeinstall_host() {
  chmod -v 755 $ROOT/$PKG_BUILD/.$HOST_NAME/help2man
  mkdir -p $ROOT/$TOOLCHAIN/bin/
  cp -P $ROOT/$PKG_BUILD/.$HOST_NAME/help2man $ROOT/$TOOLCHAIN/bin/.
}
