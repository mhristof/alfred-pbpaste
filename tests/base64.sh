#! /usr/bin/env bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'
die() { echo "$*" 1>&2 ; exit 1; }

TEST=./base64.sh


ID="respects10Densest32Mizar"
B64="cmVzcGVjdHMxMERlbnNlc3QzMk1pemFyCg=="

echo $ID | pbcopy

$TEST | grep "$B64" &> /dev/null || {
    die 'Error while encoding base64'
}

echo $B64 | pbcopy

$TEST | grep "$ID" &> /dev/null || {
    die 'Error while decoding base64'
}

echo "All good with $TEST"

exit 0
