# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/9wm/9wm.git"
fi

DESCRIPTION="X11 window manager inspired by Plan 9's rio"
HOMEPAGE="https://github.com/9wm/9wm"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/9wm/9wm/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="
	x11-libs/libX11
	x11-libs/libXext
"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( CREDITS.md CUSTOMIZING.md README.md )

src_install() {
	default
	newman ${PN}.man ${PN}.1
}
