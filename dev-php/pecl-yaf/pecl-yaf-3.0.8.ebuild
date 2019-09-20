# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
PHP_EXT_NAME="yaf"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"

USE_PHP="php7-0 php7-1 php7-2 php7-3"

inherit php-ext-pecl-r3

# Really only build for 7.0
USE_PHP="php7-0 php7-1 php7-2 php7-3"

KEYWORDS="~amd64 ~x86"

DESCRIPTION="Yaf is a PHP framework similar to zend framework"
LICENSE="PHP-3.01"
SLOT="0"
