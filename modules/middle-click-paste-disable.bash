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
echo "Middle click paste will be disabled at next boot"

echo "Firefox: Now configuring middlemouse.paste"
function ff_set()
{
    local file_path=$(find ~/snap/firefox/common/.mozilla/firefox/ -name '*.default' -type d)
    local user_js_file="${file_path}/user.js"
    touch $user_js_file
    sed -i 's/user_pref("'$1'",.*);/user_pref("'$1'",'$2');/' $user_js_file
    grep -q $1 $user_js_file || echo "user_pref(\"$1\",$2);" >> $user_js_file
}

ff_set middlemouse.paste 'false'
echo "Firefox: middlemouse.paste configured"