#!/usr/bin/env bash

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh

rm get-docker.sh

# Install newuidmap & newgidmap binaries
sudo apt-get install -y uidmap

sh -c "dockerd-rootless-setuptool.sh install"