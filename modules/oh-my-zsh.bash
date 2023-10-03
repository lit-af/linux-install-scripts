#!/usr/bin/env bash
## Install ZSH
sudo apt install -y zsh

## Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

## Set zsh as default shell
chsh -s $(which zsh)