#!/usr/bin/env bash

## Bash
### dark
echo "alias dark='gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark \
&& gsettings set org.gnome.desktop.interface color-scheme prefer-dark'" >> ${HOME}/.bashrc

###light
echo "alias light='gsettings set org.gnome.desktop.interface gtk-theme Adwaita \
&& gsettings set org.gnome.desktop.interface color-scheme prefer-light'" >> ${HOME}/.bashrc

## zsh
### dark
echo "alias dark='gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark \
&& gsettings set org.gnome.desktop.interface color-scheme prefer-dark'" >> ${HOME}/.zshrc

###light
echo "alias light='gsettings set org.gnome.desktop.interface gtk-theme Adwaita \
&& gsettings set org.gnome.desktop.interface color-scheme prefer-light'" >> ${HOME}/.zshrc

## Multiple audio sources gnome extension
gnome-extensions install sound-output-device-chooser@kgshank.net
gnome-extensions enable sound-output-device-chooser@kgshank.net
