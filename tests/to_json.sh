#! /usr/bin/env bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'
die() { echo "$*" 1>&2 ; exit 1; }

TEST=./to_json.sh


PATH='/bin:/usr/bin' $TEST &> /dev/null && {
    die "Error, no checks for jq tool"
}

cat << EOF | pbcopy
{
    "this": "that"
}
EOF

$TEST | grep 'this' &> /dev/null || {
    die "Error couldnt parse simple json"
}

cat << EOF | pbcopy
{
    'this': 'that'
}
EOF

$TEST | grep 'this' &> /dev/null || {
    die 'Error, couldnt parse single quotes json'
}


cat << EOF | pbcopy
"{\"this\": \"that\"}"
EOF

pbpaste

$TEST | grep 'this' &> /dev/null || {
    die 'Error, coudnt decode quoted json'
}

echo "All good with $TEST"
exit 0
