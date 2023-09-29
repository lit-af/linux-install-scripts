#!/usr/bin/env bash

## Prerequisites
sudo apt-get update
sudo apt-get install -y net-tools curl

## Get SDK
wget -q https://aka.ms/AzureSphereSDKInstall/Linux

## Unpack 
tar xfz Linux

## Install
sudo ./install_azure_sphere_sdk.sh -y

## Clean up
rm Linux
rm install_azure_sphere_sdk.sh