#! /usr/bin/env bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

command -v jq &> /dev/null || {
    echo "Error, couldnt not find jq in path"
    exit 1
}

pbpaste | grep '\\"' &> /dev/null && pbpaste | grep -oP '^".*"$' &> /dev/null && {
    pbpaste | sed 's/^"//g' | sed 's/"$//g' | sed 's!\\!!g' | jq .
    exit 0
}

pbpaste | jq . &> /dev/null && {
    pbpaste | jq .
    exit 0
}

pbpaste | tr -s "'" '"' | jq . &> /dev/null && {
    pbpaste | tr -s "'" '"' | jq .
}

exit 0
