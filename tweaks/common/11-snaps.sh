#!/usr/bin/env bash
set -e

# list of --classic snaps to install
declare -a snap_classic=(
  intellij-idea-ultimate
  pycharm-professional
  slack
)

# snap install {{ these }}
declare -a snap_vanilla=(
  bitwarden
  postman
  slack-term
  spotify
  whatsdesk
)

function is_arch(){
  if [ -f /etc/pacman.conf ]; then
    return 0
  else
    return 1
  fi
}

function is_installed_snap(){
  set +e
  local FOO="$(snap list | awk '{print $1}' | grep ^${1}$)"
  set -e
  if [ ${FOO}X == X ]; then
    return 1
  else
    return 0
  fi

}

function install_snap_classic(){
  sudo snap install ${1} --classic
  rc=$?
  return ${rc}
}

function install_snap_vanilla(){
  snap install ${1}
  rc=$?
  return ${rc}
}


for i in "${snap_classic[@]}" ; do
  echo "classic: ${i}"
  if ! is_installed_snap ${i}; then
    echo "${i} is not installed in snap classic.. installing it"
    install_snap_classic "${i}"
  fi
done

for i in "${snap_vanilla[@]}" ; do
  echo "vanilla: ${i}"
  if ! is_installed_snap ${i}; then
    echo "${i} is not installed in snap vanilla.. installing it"
    install_snap_vanilla "${i}"
  fi
done

