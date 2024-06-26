# linux-install-scripts
Tested on Ubuntu Focal 20.04 LTS
## Available modules
### Drivers
- Nvidia GPU driver
- Wi-Fi driver fix for **Killer(R) Wi-Fi 6E AX1675s 160MHz Wireless Network Adapter (211NGW)** in **Alienware x17 R2**

### Generic Software
- Google Chrome
- Slack Desktop
- teams-for-linux

### Generic Tools
- SSH server
- SpeedTest.net cli
- OBS Studio
- Flameshot (screenshot software)
- BalenaEtcher
- Terminator
- Oh-my-zsh

### Developer Tools
- CppCheck (with GUI)
- Docker
- git
- git-lfs
- GitHub cli
- GitLab cli
- Visual Studio Code

### Robotics Tools
- ROS
- Gazebo Fortress (from sources)

### Customisations
- middle click paste disable
- grub whitesur theme

## Usage
### Install all modules
1. `cd linux-install-scripts`
2. Comment the modules you don't require in the `install_all_modules.bash` script using `nano` or `gedit`
3. `chmod 755 install_all_modules.bash`
4. `chmod 755 modules/*.bash`
5. `./install_all_modules.bash`

### Install a single module
1. `cd linux-install-scripts/modules/`
2. run the selected script. ex.: `./gazebo_fortress_install.bash`
