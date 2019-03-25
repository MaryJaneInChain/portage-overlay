# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6} )
inherit git-r3 python-single-r1 gnome2-utils

DESCRIPTION="Collection of tools useful for audio production"
HOMEPAGE="http://kxstudio.linuxaudio.org/Applications:Cadence"
SRC_BASE="https://github.com/falkTX/Cadence/archive/"
SRC_URI="${SRC_BASE}/v${PV}.tar.gz -> ${P}-amd64.tar.gz"
KEYWORDS="~amd64"
LICENSE="GPL-2"
SLOT="0"

IUSE="-pulseaudio a2jmidid ladish opengl"

RDEPEND="${PYTHON_DEPS}
	virtual/jack:0
	dev-python/PyQt5[dbus,gui,opengl?,svg,widgets,${PYTHON_USEDEP}]
	dev-python/dbus-python[${PYTHON_USEDEP}]
	a2jmidid? ( media-sound/a2jmidid[dbus] )
	ladish? ( media-sound/ladish )
	pulseaudio? ( media-sound/pulseaudio[jack] )"
DEPEND=${RDEPEND}

src_prepare() {
	sed -i -e "s/python3/${EPYTHON}/" \
		data/cadence \
		data/cadence-aloop-daemon \
		data/cadence-jacksettings \
		data/cadence-logs \
		data/cadence-render \
		data/cadence-session-start \
		data/catarina \
		data/catia \
		data/claudia \
		data/claudia-launcher || die "sed failed"
	default
}

src_compile() {
	myemakeargs=(PREFIX="/usr"
		SKIP_STRIPPING=true
	)
	emake "${myemakeargs[@]}"
}

src_install() {
	emake PREFIX="/usr" DESTDIR="${D}" install

	# Clean up stuff that shouldn't be installed
	rm -rf "${D}/etc/X11/xinit/xinitrc.d/61cadence-session-inject"
	rm -rf "${D}/etc/xdg/autostart/cadence-session-start.desktop"
	rm -rf "${D}/usr/share/applications/catarina.desktop"
	rm -rf "${D}/usr/bin/catarina"
	if use !pulseaudio; then
		rm -rf "${D}/usr/bin/cadence-pulse2jack"
		rm -rf "${D}/usr/bin/cadence-pulse2loopback"
		rm -rf "${D}/usr/share/cadence/pulse2jack"
		rm -rf "${D}/usr/share/cadence/pulse2loopback"
	fi
	if use !ladish; then
		rm -rf "${D}/usr/bin/claudia-launcher"
		rm -rf "${D}/usr/bin/claudia"
		rm -rf "${D}/usr/share/cadence/icons/claudia-hicolor/"
		rm -rf "${D}/usr/share/applications/claudia.desktop"
		rm -rf "${D}/usr/share/applications/claudia-launcher.desktop"
	fi
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
