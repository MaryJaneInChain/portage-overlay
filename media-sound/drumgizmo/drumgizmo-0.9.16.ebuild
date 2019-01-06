# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="An open source cross-platform drum plugin & stand-alone application."
HOMEPAGE="https://www.drumgizmo.org"
SRC_URI="http://www.drumgizmo.org/releases/${P}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT=0
KEYWORDS="~amd64"
IUSE="+gui cli debug +lv2 cpu_flags_x86_sse cpu_flags_x86_sse2 +libsamplerate vst zita"
REQUIRED_USE="^^ ( libsamplerate zita )"

RDEPEND="virtual/jack
	lv2? ( media-libs/lv2 )
	cli? ( media-libs/libsmf )
	zita? ( media-libs/zita-resampler )
	libsamplerate? ( media-libs/libsamplerate )
	vst? ( media-libs/vst-sdk )
	x11-libs/libX11
	>=media-libs/libsndfile-1.0.21
	>=media-libs/libpng-1.2
	dev-libs/expat"
DEPEND="${RDEPEND}"
