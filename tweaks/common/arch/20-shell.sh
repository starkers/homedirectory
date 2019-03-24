#!/usr/bin/env bash
set -e

ME="$(whoami)"
CURRENT="$(grep ${ME} /etc/passwd | cut -d ":" -f 7)"
if ! grep -q zsh <<< $CURRENT ; then
  echo "$0: shell is not zsh (currently: ${CURRENT}, updating it"
  echo chsh -s $(which zsh) $USER
  sudo chsh -s $(which zsh) $USER

  echo "$0: your shell has changed.. please log out and log in again.. re-run install"
fi

if [ "$SHELL" == "$(which zsh)" ]; then
  exit 0
else
  echo "$0: refusing to continue without SHELL=zsh"
fi
exit 1
