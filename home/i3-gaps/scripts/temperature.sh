#!/usr/bin/env bash
# vim:ts=2:sw=2:expandtab

if [ "X$1" == "X" ]; then
    CORE='Core 0'
  else
    CORE="${1}"
fi
OUTPUT=$(sensors -Au)

IFS=$'\n'
DATA=$(echo "${OUTPUT}" | egrep -A4 "${CORE}")
CURRENT=$(echo "${DATA}" | grep -Po "(?<=_input: )([0-9]+)")
HIGH=$(echo "${DATA}" | grep -Po "(?<=_max: )([0-9]+)")
#CRIT=$(echo "${DATA}" | grep -Po "(?<=_crit: )([0-9]+)")

echo "${CURRENT}"

[[ "${CURRENT}" -gt "${HIGH}" ]] && exit 33
exit 0
