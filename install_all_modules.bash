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
./teams-for-linux.bash

# Generic Tools
sudo apt install -y openssh-server
sudo snap install pdfarranger
./speedtest_cli_install.bash
#./obs_studio_install.bash
#./flameshot_install.bash
./grub_theme.bash
#./balenaEtcher.bash

# Developer Tools
sudo apt install -y git git-lfs 
sudo apt install -y gcc-12 g++-12 libstdc++-12-dev gcovr
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 12
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-12 12
sudo update-alternatives --install /usr/bin/gcov gcov /usr/bin/gcov-12 12

#./azure_sphere_sdk.bash
#./nrf-connect-sdk.bash
./github_cli_install.bash
./gitlab_cli_install.bash
./vscode_install.bash
./cppcheck_install.bash
./terminator_install.bash
./docker.bash
./oh-my-zsh.bash

# Customizations

# Robotics Tools
# ./ros_install.bash
# ./gazebo_fortress_install.bash

cd ../

echo "INFO: Installation complete. Rebooting is strongly suggested"
