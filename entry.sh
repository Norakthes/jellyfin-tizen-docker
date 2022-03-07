#!/bin/bash

# Prepare Jellyfin Web
cd ~
git clone https://github.com/jellyfin/jellyfin-web.git
cd jellyfin-web
npm ci --no-audit

cd ~

# Prepare Jellyfin Tizen
git clone https://github.com/jellyfin/jellyfin-tizen.git
cd jellyfin-tizen
JELLYFIN_WEB_DIR=../jellyfin-web/dist yarn install

mkdir ~/jellyfin-tizen/output
# Run Tizen CLI build
export PATH=$PATH:$HOME/tizen-studio/tools/ide/bin
tizen build-web -e ".*" -e gulpfile.js -e README.md -e "node_modules/*" -e "package*.json" -e "yarn.lock"
tizen package -t wgt -o ~/output -- .buildResult
