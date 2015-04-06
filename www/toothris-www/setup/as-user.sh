#!/bin/bash

set -e

. /toothris-www/setup/share.sh

# grunt-cli
sudo npm install -g grunt-cli@0.1.13

# bootstrap
git clone https://github.com/twbs/bootstrap /toothris-www/bootstrap.git
cd /toothris-www/bootstrap.git
git checkout v3.3.4
npm install

# jquery
mkdir /toothris-www/jquery
cd /toothris-www/jquery
npm install jquery@1.11.2

# aws-cli
fetch-aur /aw aws-cli
makepkg -sc --noconfirm
sudo pacman -U --noconfirm aws-cli-1.7.11-1-any.pkg.tar.xz
rm aws-cli-1.7.11-1-any.pkg.tar.xz

# stackless-python2
fetch-aur /st stackless-python2
makepkg -sc --noconfirm
yes | sudo pacman -U stackless-python2-2.7.6r3-1-x86_64.pkg.tar.xz
rm stackless-python2-2.7.6r3-1-x86_64.pkg.tar.xz

# python-rabbyt
# TODO: remove patch when upstream package is updated.
fetch-aur /py python-rabbyt
patch PKGBUILD /toothris-www/setup/python-rabbyt/PKGBUILD.patch
makepkg -sc --noconfirm
sudo pacman -U --noconfirm python-rabbyt-0.8.3-4-x86_64.pkg.tar.xz
rm python-rabbyt-0.8.3-4-x86_64.pkg.tar.xz

# toothris
# TODO: use aur package
cd /toothris-www/setup/toothris
makepkg -sc --noconfirm
sudo pacman -U --noconfirm toothris-0.0.0dev-1-any.pkg.tar.xz
rm toothris-0.0.0dev-1-any.pkg.tar.xz

# libxmp
fetch-aur /li libxmp
makepkg -sc --noconfirm
sudo pacman -U --noconfirm libxmp-4.3.5-1-x86_64.pkg.tar.xz
rm libxmp-4.3.5-1-x86_64.pkg.tar.xz

# xmp
fetch-aur /xm xmp
makepkg -sc --noconfirm
sudo pacman -U --noconfirm xmp-4.0.10-1-x86_64.pkg.tar.xz
rm xmp-4.0.10-1-x86_64.pkg.tar.xz

# ffmpeg-libfdk_aac
fetch-aur /ff ffmpeg-libfdk_aac
makepkg -sc --noconfirm
sudo pacman -U --noconfirm ffmpeg-libfdk_aac-1:2.5.4-1-x86_64.pkg.tar.xz
rm ffmpeg-libfdk_aac-1:2.5.4-1-x86_64.pkg.tar.xz
