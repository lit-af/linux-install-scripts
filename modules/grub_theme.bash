#!/usr/bin/env bash

git clone https://github.com/vinceliuice/grub2-themes.git
cd grub2-themes/
sudo ./install.sh -t whitesur -b
cd ../
rm -fr grub2-themes