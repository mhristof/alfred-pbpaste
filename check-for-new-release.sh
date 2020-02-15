#! /usr/bin/env bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/

current=$(make version)
latest=$(curl --silent https://api.github.com/repos/mhristof/alfred-pbpaste/releases | jq '.[].assets[0] | select(.browser_download_url != null) | .browser_download_url' -r | head -1)

echo $latest | grep $current &> /dev/null

if [[ $? -ne 0 ]] && [[ ! -z $latest ]]; then
    echo $latest
fi

exit 0
