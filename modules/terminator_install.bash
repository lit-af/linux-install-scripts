#!/usr/bin/env bash
sudo apt install terminator -y
gsettings set org.gnome.desktop.default-applications.terminal exec /usr/bin/terminator
