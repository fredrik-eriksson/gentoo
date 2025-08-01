# Copyright 2020-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DIST_AUTHOR=NEILB
DIST_VERSION=1.08

inherit perl-module

DESCRIPTION="Recursively copy Perl datatypes"

SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~arm64 ~hppa ~mips ppc ~ppc64 ~s390 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	virtual/perl-Exporter
"

BDEPEND="
	${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker
	test? (
		virtual/perl-Carp
		virtual/perl-Data-Dumper
	)
"
