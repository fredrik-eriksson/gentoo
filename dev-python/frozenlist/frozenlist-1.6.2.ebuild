# Copyright 2021-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{11..14} python3_13t pypy3_11 )

inherit distutils-r1

DESCRIPTION="A list-like structure which implements collections.abc.MutableSequence"
HOMEPAGE="
	https://pypi.org/project/frozenlist/
	https://github.com/aio-libs/frozenlist/
"
SRC_URI="
	https://github.com/aio-libs/frozenlist/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm arm64 ~hppa ~loong ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc x86"
IUSE="+native-extensions"

BDEPEND="
	dev-python/expandvars[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
	native-extensions? (
		$(python_gen_cond_dep '
			dev-python/cython[${PYTHON_USEDEP}]
		' 'python*')
	)
"

distutils_enable_tests pytest

python_compile() {
	# pypy is not using the C extension
	if ! use native-extensions || [[ ${EPYTHON} != python* ]]; then
		local -x FROZENLIST_NO_EXTENSIONS=1
	fi

	distutils-r1_python_compile
}

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	rm -rf frozenlist || die
	epytest -o addopts=
}
