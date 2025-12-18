#!/usr/bin/env bash
log "Installing dependencies"
sudo apt-get update
sudo apt-get install -y \
git wget unzip python3 python3-pip \
simg2img img2simg lz4 \
android-sdk-libsparse-utils


pip3 install --user protobuf
