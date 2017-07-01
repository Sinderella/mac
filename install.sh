#!/bin/bash

CLONE_DIR="~/clones"

# homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# homebrew bundle
brew tap Homebrew∂/bundle

# brew from Brewfile
brew bundle

# download apps
. download_app.sh

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# config fzf
. /usr/local/opt/fzf/install

# pip
curl https://bootstrap.pypa.io/get-pip.py | python

# rvm
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://get.rvm.io | bash -s stable

# source rvm
. ~/.rvm/scripts/rvm

# metasploit
cd $CLONE_DIR && git clone https://github.com/rapid7/metasploit-framework; cd -

# pick ruby based on metasploit
rvm --install $(cat $CLONE_DIR/metasploit-framework/.ruby-version)

# install bundled gems
cd $CLONE_DIR && bundle install && cd -

# help me doc
brew doctor

echo "Drag and drop applications in files/, or install them otherwise..."
echo "Once done, feel free to remove bak/ folder"
