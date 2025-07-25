# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit tree-sitter-grammar

DESCRIPTION="OCaml grammar for Tree-sitter"
HOMEPAGE="https://github.com/tree-sitter/tree-sitter-ocaml"
S=${WORKDIR}/${P}/grammars/ocaml

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
