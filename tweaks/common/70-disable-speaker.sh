#!/usr/bin/env bash

echo "blacklist pcspkr" | sudo tee /etc/modprobe.d/nobeep.conf
