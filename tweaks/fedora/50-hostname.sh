#!/usr/bin/env bash

CURRENT="$(hostnamectl --static)"

if [ X${CURRENT} == "Xlocalhost.localdomain" ]; then
  echo "your hostname is unset.."
  read -p "type your new hostname: " NEWSTATIC
  read -p "type a pretty name (EG: Johns 2nd laptop): " NEWPRETTY

  set -x
  sudo hostnamectl set-hostname --static "${NEWSTATIC}"
  sudo hostnamectl set-hostname --pretty "${NEWPRETTY}"
fi
