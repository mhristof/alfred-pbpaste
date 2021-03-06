#! /usr/bin/env bash

pbpaste | while IFS= read line; do
    aws_key=$(echo $line | grep -oP '(?<![A-Z0-9])[A-Z0-9]{20}(?![A-Z0-9])')
    if [[ ! -z $aws_key ]]; then
        line=$(echo $line | sed "s/$aws_key/${aws_key:0:5}xxxxxxxxxx${aws_key:15:20}/g")
    fi

    aws_secret=$(echo $line |  grep -oP '(?<![A-Za-z0-9/+=])[A-Za-z0-9/+=]{40}(?![A-Za-z0-9/+=])')
    if [[ ! -z $aws_secret ]]; then
        line=$(echo $line | sed "s!${aws_secret}!${aws_secret:0:5}xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx${aws_secret:35:40}!g")
    fi

    line=${line/$USER/username}

    echo $line
done

exit 0
