#!/bin/bash

DIR="files"
BAK="bak"

mkdir $0/$DIR
mkdir $0$BAK

unpack_dmg () {
  echo "$(date) [*] Mounting $1"
  MOUNTDIR=$(echo `hdiutil mount $1 | tail -1 | awk '{$1=$2=""; print $0}'` | xargs -0 echo)
  echo "$(date) [+] Mounted at $MOUNTDIR"
  echo "$(date) [*] Copying *.app to /Applications/"
  cp -R "$MOUNTDIR"/*.app $DIR
  echo "$(date) [+] Copied"
  echo "$(date) [*] Detaching $MOUNTDIR"
  hdiutil detach "$MOUNTDIR"
  echo "$(date) [+] Detached"
}

# Alfred
wget https://cachefly.alfredapp.com/Alfred_3.4_850.dmg -P $DIR

# 1Password
wget https://app-updates.agilebits.com/download/OPM4 --content-disposition -P $DIR

# Evernote
wget "$(curl --silent https://evernote.com/download/get.php?file=EvernoteMac | grep dmg | cut -d'"' -f2)" -P $DIR

# Fantastical 2
wget https://flexibits.com/fantastical/download --content-disposition -P $DIR

# Hammerspoon
wget "$(curl --silent https://api.github.com/repos/Hammerspoon/hammerspoon/releases/latest | grep browser_download_url | cut -d '"' -f 4)" -P $DIR

# Sublime Text 3 Dev
wget "$(curl --silent https://www.sublimetext.com/3dev 2>&1 | grep dmg | cut -d'"' -f4)" -P $DIR

# VLC
wget "https:$(curl --silent https://www.videolan.org/vlc/download-macosx.en-GB.html 2>&1 | grep dmg | head -1 | cut -d"'" -f4)" -P $DIR

# Little Snitch Beta
wget "https://www.obdev.at/downloads/littlesnitch/LittleSnitch-4.0-public-beta-2.dmg" -P $DIR

# PyCharm
wget $(curl --silent "https://data.services.jetbrains.com/products/releases?code=PCP&latest=true&type=release" | cut -d'"' -f30) --content-disposition -P $DIR

# RubyMine
wget $(curl --silent "https://data.services.jetbrains.com/products/releases?code=RM&latest=true&type=release" | cut -d'"' -f30) --content-disposition -P $DIR

# Dash
wget "https://london.kapeli.com/downloads/v4/Dash.zip" -P $DIR

# iTerm
wget $(curl --silent https://www.iterm2.com/downloads.html | grep zip | grep stable | head -1 | cut -d'"' -f4) -P $DIR

# Franz
wget $(curl --silent https://api.github.com/repos/meetfranz/franz-app/releases/latest | grep browser_download_url | grep dmg | cut -d '"' -f 4) -P $DIR

# Thunderbird
wget $(curl --silent https://www.mozilla.org/en-GB/thunderbird/ | grep download | cut -d'"' -f 10 | grep download | head -1) --content-disposition -P $DIR

# FileZilla
wget $(curl --silent https://filezilla-project.org/download.php\?platform\=osx | grep zip | cut -d'"' -f4) -P $DIR

for f in $DIR/*.dmg
do
  unpack_dmg $f
  mv "$f" $BAK/
done

for f in $DIR/*.zip
do
  unzip -q $f -d $DIR
  mv "$f" $BAK/
done
