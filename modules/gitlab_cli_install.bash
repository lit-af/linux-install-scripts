#!/usr/bin/env bash

LATEST_RELEASE="1.33.0"

wget -q https://gitlab.com/gitlab-org/cli/-/releases/v$LATEST_RELEASE/downloads/glab_$LATEST_RELEASE\_Linux_x86_64.deb
sudo apt install -y ./glab_$LATEST_RELEASE\_Linux_x86_64.deb --fix-broken
rm -rf glab_$LATEST_RELEASE\_Linux_x86_64.deb