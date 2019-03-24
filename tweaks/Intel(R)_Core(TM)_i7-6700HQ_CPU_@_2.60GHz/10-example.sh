#!/usr/bin/env bash
set -e

declare -a words=(
  hello
  world
  this
  is
  an
  XPS-15
)

# add myself to these groups
for i in "${words[@]}" ; do
    echo ${i}
done
