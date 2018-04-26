#!/usr/bin/env bash
set -e

## Hides tabs
## - you must have run firefox at least once to have a profile directory
## - will not restart firefox for you

echo $0: hiding firefox top tabs

INI_FILE="${HOME}/.mozilla/firefox/profiles.ini"
if [ ! -f "$INI_FILE" ]; then
  echo "$: sorry.. could not find ${INI_FILE}.. please launch firefox at least once"
  exit 1
fi

PROFILE="$(grep Path "${INI_FILE}" | cut -d "=" -f 2)"
mkdir -p "${HOME}/.mozilla/firefox/$PROFILE/chrome"

cat >"${HOME}/.mozilla/firefox/$PROFILE/chrome/userChrome.css"<<EOF
#TabsToolbar {
  visibility: collapse !important;
}
EOF
