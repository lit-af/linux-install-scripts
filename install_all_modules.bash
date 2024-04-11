#!/usr/bin/env bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y apt-utils curl htop neofetch net-tools vim
cd modules/

# Drivers
#./nvidia_driver_install.bash
#./killer_wifi_6e_ax1675_driver_install.bash

# Generic Software
./google_chrome_install.bash
#./slack_install.bash

# Generic Tools
sudo apt install -y openssh-server
sudo snap install pdfarranger
./speedtest_cli_install.bash
#./obs_studio_install.bash
./flameshot_install.bash
./grub_theme.bash
./balenaEtcher.bash

# Developer Tools
sudo apt install -y git git-lfs 
sudo apt install -y gcc-12 libstdc++-12-dev
./azure_sphere_sdk.bash
#./nrf-connect-sdk.bash
./github_cli_install.bash
./gitlab_cli_install.bash
./vscode_install.bash
./cppcheck_install.bash
./terminator_install.bash
./docker.bash
./oh-my-zsh.bash

# Customizations
./ubuntu_22_tweaks.bash

# Robotics Tools
# ./ros_install.bash
# ./gazebo_fortress_install.bash

cd ../

echo "INFO: Installation complete. Rebooting is strongly suggested"
