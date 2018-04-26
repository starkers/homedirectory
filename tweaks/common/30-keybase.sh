#!/usr/bin/env bash
set -e

### many things will fail without SSH etc.
### This requires functional keybase loginA

function kb_login(){
  echo "$0: log into keybase now"
  keybase login
}

function kb_is_logged_on(){
  local status="$(keybase status | grep "^Logged in:")"
  if grep -q "yes" <<<"$status" ; then
    return 0
  else
    return 1
  fi
}

function kb_check_kbfs(){
  # checks kbfs is mounted, it not launching the GUI should fix that
  if [ -d /keybase/private/starkers/ ]; then
    return 0
  else
    return 1
  fi
}

if kb_is_logged_on ; then
  echo "$0: keybase logged on, good"
else
  echo "$0: keybase not logged in"
  kb_login
fi


loop=0
launched=0
while [ ! -d /keybase/private/starkers/ ]; do
  let loop=loop+1
  if [ $loop == 0 ]; then
    echo "$0: KBFS not mounted (/keybase/private/starkers/)"
  fi
  if [ $loop -gt 20 ]; then
    echo $0: giving up on KBFS
    exit 1
  fi
  if [ $launched == 0 ]; then
    echo $0: launching Keybase gui
    run_keybase 1>/dev/null 2>/dev/null &
    let launched=1
  fi
  printf .
  sleep 1
done

