#!/usr/bin/env bash

###############################################################################
# Author:      David Stark
# Vim:         ts=4 et sw=4 sts=4
# Notes:       
###############################################################################


for a in *.deb ; do
  set -x
  dpkg -i "$a"
  set +x
done

a=b

cat >/usr/share/xsessions/gnome-i3.desktop<<EOF
[Desktop Entry]
Name=GNOME with i3
Comment=A GNOME fallback mode session using i3 as the window manager.
Exec=gnome-session --session=i3
TryExec=gnome-session
Type=XSession
EOF

# cat >/usr/share/xsessions/i3.desktop<<EOF
# [Desktop Entry]
# Name=i3
# Comment=improved dynamic tiling window manager
# Exec=i3
# TryExec=i3
# Type=Application
# X-LightDM-DesktopName=i3
# DesktopNames=i3
# Keywords=tiling;wm;windowmanager;window;manager;
# EOF

cat >/usr/share/gnome-session/sessions/i3.session<<EOF
[GNOME Session]
Name=gnome-i3
RequiredComponents=gnome-settings-daemon;i3-gnome;
EOF


apt install libxcb-xinerama0 libev4 libxcb-cursor0 compton feh rofi shutter libconfuse-common libconfuse0 libxcb-dpms0 libxdg-basedir1 suckless-tools xbacklight
