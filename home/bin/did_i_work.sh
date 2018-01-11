#!/usr/bin/env bash

HIST_FILE="${HOME}/.zsh_history"


tmpf="$(mktemp)"


grep_include="make ACCOUNT=shared|ACCOUNT=production|ACCOUNT=staging"
grep_exclude="drone|gocd|grep|gcloud|deps"

function epoch_to_human(){
  date -d "@${1}" +"%Y-%m-%d %H:%M:%S"
}

# epoch_to_human "$@"



egrep "${grep_include}" "${HIST_FILE}" | egrep -v "${grep_exclude}" > "${tmpf}"


while IFS= read -r var
do
  EPOCH="$(cut -c 3-12 <<<"$var")"
  HUMAN_TIME="$(date -d "@${EPOCH}" +"%Y-%m-%d %H:%M:%S")"
  NEW_VAR="$(cut -c 16-9999 <<<"${var}")"
  echo "${HUMAN_TIME}: ${NEW_VAR}"
done < "${tmpf}"



rm "${tmpf}"
