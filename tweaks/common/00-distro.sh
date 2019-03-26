#!/usr/bin/env bash
set -e


function is_arch(){
  if [ -f /etc/pacman.conf ]; then
    return 0
  else
    return 1
  fi
}

function is_fedora(){
  if [ -f /etc/fedora-release ]; then
    return 0
  else
    return 1
  fi
}

if is_arch; then
  ./arch/*
fi


if is_fedora; then
  for a in ./fedora/* ; do
    $a
  done
fi

