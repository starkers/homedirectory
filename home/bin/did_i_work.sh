#!/usr/bin/env bash

# I have a bad memory.. this can be handy to quickly check if I worked on a day

ARG1="$1"

HIST_FILE="${HOME}/.zsh_history"


tmpf="$(mktemp)"

# if I was doing work I hope I ran something like this:
grep_include="make ACCOUNT=shared|ACCOUNT=production|ACCOUNT=staging"
grep_exclude="drone|gocd|grep|gcloud|deps"

# converts zsh timestamps (epoch) to something human "$@"
function epoch_to_human(){
  date -d "@${1}" +"%Y-%m-%d %H:%M:%S"
}




if [ "X$ARG1" == Xall ]; then
  cp "${HIST_FILE}" "${tmpf}"
  while IFS= read -r var
  do
    EPOCH="$(cut -c 3-12 <<<"$var")"
    HUMAN_TIME="$(date -d "@${EPOCH}" +"%Y-%m-%d %H:%M:%S")"
    NEW_VAR="$(cut -c 16-9999 <<<"${var}")"
    echo "${HUMAN_TIME}: ${NEW_VAR}"
  done < "${tmpf}"
else

  egrep "${grep_include}" "${HIST_FILE}" | egrep -v "${grep_exclude}" > "${tmpf}"
  while IFS= read -r var
  do
    EPOCH="$(cut -c 3-12 <<<"$var")"
    HUMAN_TIME="$(date -d "@${EPOCH}" +"%Y-%m-%d %H:%M:%S")"
    NEW_VAR="$(cut -c 16-9999 <<<"${var}")"
    echo "${HUMAN_TIME}: ${NEW_VAR}"
  done < "${tmpf}"

fi

rm "${tmpf}"
