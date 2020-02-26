#! /usr/bin/env bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

if [[ "$(pbpaste | base64 -d)" = *[![:ascii:]]* ]]; then
    pbpaste | base64 -w 0
else
    pbpaste | base64 -d
fi

exit 0
