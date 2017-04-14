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

PKG_NAME="texinfo"
PKG_VERSION="6.3"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://ftp.gnu.org/gnu/texinfo/"
PKG_URL="http://ftp.gnu.org/gnu/texinfo/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="ccache:host pcre:host"
PKG_SECTION="toolchain/devel"
PKG_SHORTDESC="Program to output a single source file to different formats."
PKG_LONGDESC="Program to output a single source file to different formats such as dvi, html, info, pdf, xml, etc."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

export CXX="$ROOT/$TOOLCHAIN/bin/host-g++"
export CPP="cpp"
export RANLIB="ranlib"

PKG_CONFIGURE_OPTS_HOST="--with-gnu-ld \
			 --disable-perl-xs \
			 --disable-perl-api-texi-build \
			 --disable-nls"

makeinstall_target() {
  mkdir -p $ROOT/$TOOLCHAIN/bin/
  cp -P $ROOT/$PKG_BUILD/.$HOST_NAME/* $ROOT/$TOOLCHAIN/bin/.
  mkdir -p $ROOT/$TOOLCHAIN/share/
  cp -P $ROOT/$PKG_BUILD/.$HOST_NAME/texinfo/* $ROOT/$TOOLCHAIN/share/texinfo.
}

