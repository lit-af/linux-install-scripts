#!/usr/bin/env bash
OWNER="balena-io"
REPO="etcher"
LATEST_RELEASE=$(curl -L -s -H 'Accept: application/json' https://github.com/$OWNER/$REPO/releases/latest/)
LATEST_VERSION=$(echo $LATEST_RELEASE | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
LATEST_VERSION_NUMBER=$(echo $LATEST_VERSION | sed 's/v//')
echo "Balena Etcher latest release version: $LATEST_VERSION"
wget -q https://github.com/balena-io/etcher/releases/download/$LATEST_VERSION/balena-etcher_$LATEST_VERSION_NUMBER\_amd64.deb
sudo apt install -y ./balena-etcher_$LATEST_VERSION_NUMBER\_amd64.deb --fix-broken
rm balena-etcher_$LATEST_VERSION_NUMBER\_amd64.deb