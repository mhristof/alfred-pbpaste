#
#

SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.ONESHELL:


pbpaste.alfredworkflow:
	git archive  --format zip HEAD > pbpaste.alfredworkflow

version:
	@grep version info.plist -A1 | tail -1  | grep -oP '[\d\.]*'

mversion:
	@git show origin/master:info.plist | grep version -A1 | tail -1  | grep -oP '[\d\.]*'

all:
	@echo "Makefile needs your attention"


# vim:ft=make
#
