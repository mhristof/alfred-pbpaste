#! /usr/bin/env bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
#set -euo pipefail
#IFS=$'\n\t'

while read -r line; do
    aws_key=$(echo $line | grep -oP '(?<![A-Z0-9])[A-Z0-9]{20}(?![A-Z0-9])')
    if [[ ! -z $aws_key ]]; then
        line=$(echo $line | sed "s/$aws_key/${aws_key:0:5}xxxxxxxxxx${aws_key:15:20}/g")
    fi

    aws_secret=$(echo $line |  grep -oP '(?<![A-Za-z0-9/+=])[A-Za-z0-9/+=]{40}(?![A-Za-z0-9/+=])')
    if [[ ! -z $aws_secret ]]; then
        line=$(echo $line | sed "s!${aws_secret}!${aws_secret:0:5}xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx${aws_secret:35:40}!g")
    fi
    echo $line
done < <(pbpaste)

exit 0
