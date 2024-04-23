#!/usr/bin/env bash
# deleting rootless context if it exist
docker context rm -f rootless

# Delete docker group
sudo groupdel docker

# uninstall all conflicting packages
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
rm get-docker.sh

# Post Install Steps
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker