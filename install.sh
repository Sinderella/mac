#!/bin/bash

DIR="files"

mkdir $DIR

xcode-select --install

# rvm
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable

# source rvm
source ~/.rvm/scripts/rvm

# latest ruby
rvm install ruby --latest

# homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# homebrew bundle
brew tap Homebrew/bundle

# brew from Brewfile
brew bundle

# curl https://bootstrap.pypa.io/get-pip.py | python

# Alfred
wget https://cachefly.alfredapp.com/Alfred_3.4_850.dmg -P $DIR

# 1Password
wget https://app-updates.agilebits.com/download/OPM4 -P $DIR

# Evernote
wget "$(curl --silent https://evernote.com/download/get.php?file=EvernoteMac | grep dmg | cut -d'"' -f2)" -P $DIR

# Fantastical 2
wget https://flexibits.com/fantastical/download -P $DIR

# Hammerspoon
wget "$(curl --silent https://api.github.com/repos/Hammerspoon/hammerspoon/releases/latest | grep browser_download_url | cut -d '"' -f 4)" -P $DIR

# Sublime Text 3 Dev
wget "$(curl --silent https://www.sublimetext.com/3dev 2>&1 | grep dmg | cut -d'"' -f4)" -P $DIR

# VLC
wget "https:$(curl --silent https://www.videolan.org/vlc/download-macosx.en-GB.html 2>&1 | grep dmg | head -1 | cut -d"'" -f4)" -P $DIR

# Little Snitch Beta
wget "https://www.obdev.at/downloads/littlesnitch/LittleSnitch-4.0-public-beta-2.dmg" -P $DIR

# PyCharm
wget "https://data.services.jetbrains.com/products/download?code=PCP&platform=mac" --content-disposition -P $DIR

# RubyMine
wget "https://data.services.jetbrains.com/products/download?code=RM&platform=mac" --content-disposition -P $DIR

# Dash
wget "https://london.kapeli.com/downloads/v4/Dash.zip"

# iTerm
wget $(curl --silent https://www.iterm2.com/downloads.html | grep zip | grep stable | head -1 | cut -d'"' -f4) -P $DIR

# Franz
wget $(curl --silent https://api.github.com/repos/meetfranz/franz-app/releases/latest | grep browser_download_url | grep dmg | cut -d '"' -f 4) -P $DIR

# Thunderbird
wget $(curl --silent https://www.mozilla.org/en-GB/thunderbird/ | grep download | cut -d'"' -f 10 | grep download | head -1) --content-disposition -P $DIR
