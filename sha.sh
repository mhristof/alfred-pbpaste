#! /usr/bin/env bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

pbpaste | sha256sum  | awk '{print $1}'

exit 0
