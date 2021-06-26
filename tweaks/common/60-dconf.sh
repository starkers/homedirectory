#!/usr/bin/env bash


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd -P )"
cd ${DIR}



declare -a mappings=(
  /com/gexperts/Tilix/:tilix-settings.dconf
)

function usage(){
cat <<EOF

Usage:
  - "$0"       (without arg) will resture dconf settings from disk
  - "$0 dump"  will dump the current settings to disk

EOF
exit 0
}

if [ "X$1" == X ]; then
  for i in ${mappings[@]}; do
    confPath="$(cut -d ":" -f 1 <<<"${i}")"
    confFile="$(cut -d ":" -f 2 <<<"${i}")"
    echo loading $confPath
    dconf load "$confPath" < "$confFile"
  done
elif [ X${1} == Xdump ]; then
  for i in ${mappings[@]}; do
    confPath="$(cut -d ":" -f 1 <<<"${i}")"
    confFile="$(cut -d ":" -f 2 <<<"${i}")"
    echo dumping $confPath
    dconf dump "$confPath" > "$confFile"
  done
else
  usage
fi

