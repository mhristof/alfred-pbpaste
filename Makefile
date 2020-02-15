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

validate:
	xmllint info.plist
	awk '/items/,/<\/string/' info.plist | grep -v items | sed 's/.*string>\[/\[/g' | sed 's!</string>!!g' | jq

all:
	@echo "Makefile needs your attention"


# vim:ft=make
#
