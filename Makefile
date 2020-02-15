#
#

SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.ONESHELL:


pbpaste.alfredworkflow:
	git archive  --format zip HEAD > pbpaste.alfredworkflow

all:
	@echo "Makefile needs your attention"


# vim:ft=make
#
