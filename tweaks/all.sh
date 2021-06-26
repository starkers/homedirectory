#!/usr/bin/env bash

# launch distro-specific stuff
./distro.sh



for a in ./common/*.sh ; do
  echo "+$a"
  $a
done

