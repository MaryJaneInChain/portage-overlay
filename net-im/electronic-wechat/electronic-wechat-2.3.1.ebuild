# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils unpacker versionator

DESCRIPTION="A better WeChat on macOS and Linux. Built with Electron by Zhongyi Tong."
HOMEPAGE="https://github.com/kooritea/electronic-wechat"
SRC_BASE="https://github.com/kooritea/${PN}/releases/download/v${PV}"
SRC_URI="${SRC_BASE}/electronic-wechat-linux-x64-${PV}.zip -> ${P}-amd64.zip"

LICENSE="MIT"
SLOT=0
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror strip"

DEPEND=""
RDEPEND="gnome-base/gconf
    x11-libs/gtk+:2
    virtual/udev
    dev-libs/libgcrypt
    x11-libs/libnotify
    x11-libs/libXtst
    dev-libs/nss
    dev-lang/python
    gnome-base/gvfs
    x11-misc/xdg-utils
    net-print/cups
"

S=${WORKDIR}

src_prepare(){
	mv electronic-wechat* ${PN}
}

src_install() {
	insinto /opt
	doins -r ${S}/${PN}
	fperms 0755 /opt/${PN}/electronic-wechat
	dosym "/opt/${PN}/electronic-wechat" /usr/bin/electronic-wechat
}
