# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/phillbush/closest.git"
fi

inherit eutils ${SCM}

DESCRIPTION="focus the closest window in a given direction"
HOMEPAGE="https://github.com/phillbush/closest"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/phillbush/closest/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="x11-libs/libX11
	x11-libs/libXinerama
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	emake PREFIX= DESTDIR="${D}" MANPREFIX="/usr/share/man" install
}
