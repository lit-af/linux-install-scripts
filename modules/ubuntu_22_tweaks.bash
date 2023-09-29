#!/usr/bin/env bash

# dark
echo "alias dark='gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark \
&& gsettings set org.gnome.desktop.interface color-scheme prefer-dark'" >> ${HOME}/.bashrc

# light
echo "alias light='gsettings set org.gnome.desktop.interface gtk-theme Adwaita \
&& gsettings set org.gnome.desktop.interface color-scheme prefer-light'" >> ${HOME}/.bashrc