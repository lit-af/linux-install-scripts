#!/usr/bin/env bash
sudo apt install sxhkd

mkdir -p ~/.config/sxhkd
# capture plain middle click with the no-op ':'
cat << EOF >> ~/.config/sxhkd/sxhkdrc
button2
     :
EOF

# run sxhkd at startup (this is the same as doing it manually via 'Startup Applications')
mkdir -p ~/.config/autostart
cat << EOF > ~/.config/autostart/sxhkd.desktop
[Desktop Entry]
Type=Application
Exec=sxhkd
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=sxhkd
Comment=catch plain middle click in non Gnome apps
EOF
echo Middle click paste will be disabled at next boot