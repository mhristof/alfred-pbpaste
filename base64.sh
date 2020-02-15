#! /usr/bin/env bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

pbpaste | base64 -d &> /dev/null && {
    pbpaste | base64 -d
    exit 0
}

pbpaste | base64

exit 0
