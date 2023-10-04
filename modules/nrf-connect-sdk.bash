#!/usr/bin/env bash

OWNER="nrfconnect"
REPO="sdk-nrf"
LATEST_RELEASE=$(curl -L -s -H 'Accept: application/json' https://github.com/$OWNER/$REPO/releases/latest/)
LATEST_VERSION=$(echo $LATEST_RELEASE | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
LATEST_VERSION_NUMBER=$(echo $LATEST_VERSION | sed 's/v//')

ZEPHYR_SDK_NG_RELEASE="0.16.1"

NRF_CLI_TOOLS_VERSION_NUM_MASTER=10
NRF_CLI_TOOLS_VERSION_NUM_SUB=23
NRF_CLI_TOOLS_VERSION_NUM_FIX=0

sudo apt update && sudo apt upgrade -y

## Install the required tools
sudo apt install --no-install-recommends -y git cmake ninja-build gperf \
    ccache dfu-util device-tree-compiler wget \
    python3-dev python3-pip python3-setuptools python3-tk python3-wheel xz-utils file \
    make gcc gcc-multilib g++-multilib libsdl2-dev libmagic1
mkdir ${HOME}/gn && cd ${HOME}/gn
wget -O gn.zip https://chrome-infra-packages.appspot.com/dl/gn/gn/linux-amd64/+/latest
yes | unzip gn.zip && rm gn.zip
echo 'export PATH=${HOME}/gn:"$PATH"' >> ${HOME}/.bashrc
source ${HOME}/.bashrc

## Install west
pip3 install --user west
echo 'export PATH=~/.local/bin:"$PATH"' >> ~/.bashrc
source ~/.bashrc

## Get the nRF Connect SDK code
west init -m https://github.com/nrfconnect/sdk-nrf --mr $LATEST_VERSION
west update
west zephyr-export

## Install additional Python dependencies
sudo apt install -y python3-venv
python3 -m venv ~/ncs/.venv
source ~/ncs/.venv/bin/activate

yes | pip install -r zephyr/scripts/requirements.txt
yes | pip install -r nrf/scripts/requirements.txt
yes | pip install -r bootloader/mcuboot/scripts/requirements.txt

## Install the Zephyr RTOS SDK
cd ~
wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v$ZEPHYR_SDK_NG_RELEASE/zephyr-sdk-$ZEPHYR_SDK_NG_RELEASE\_linux-x86_64.tar.xz
wget -O - https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v$ZEPHYR_SDK_NG_RELEASE/sha256.sum | shasum --check --ignore-missing
yes | tar xf zephyr-sdk-$ZEPHYR_SDK_NG_RELEASE\_linux-x86_64.tar.xz
cd zephyr-sdk-$ZEPHYR_SDK_NG_RELEASE
yes | ./setup.sh

sudo cp ~/zephyr-sdk-$ZEPHYR_SDK_NG_RELEASE/sysroots/x86_64-pokysdk-linux/usr/share/openocd/contrib/60-openocd.rules /etc/udev/rules.d
sudo udevadm control --reload

# Install nRF command line tools
wget https://nsscprodmedia.blob.core.windows.net/prod/software-and-other-downloads/desktop-software/nrf-command-line-tools/sw/versions-$NRF_CLI_TOOLS_VERSION_NUM_MASTER-x-x/$NRF_CLI_TOOLS_VERSION_NUM_MASTER-$NRF_CLI_TOOLS_VERSION_NUM_SUB-$NRF_CLI_TOOLS_VERSION_NUM_FIX/nrf-command-line-tools_$NRF_CLI_TOOLS_VERSION_NUM_MASTER.$NRF_CLI_TOOLS_VERSION_NUM_SUB.$NRF_CLI_TOOLS_VERSION_NUM_FIX\_amd64.deb
sudo dpkg -i nrf-command-line-tools_$NRF_CLI_TOOLS_VERSION_NUM_MASTER.$NRF_CLI_TOOLS_VERSION_NUM_SUB.$NRF_CLI_TOOLS_VERSION_NUM_FIX\_amd64.deb
sudo apt install -y /opt/nrf-command-line-tools/share/JLink_Linux_V788j_x86_64.deb --fix-broken
