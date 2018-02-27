#!/bin/bash
set -euxo pipefail

pacman -S xfce4 xf86-video-intel xorg-server base-devel openssh

pacman -S neovim python-neovim redshift docker nodejs tarsnap go xmonad stow python python2 zsh jq htop ffmpeg imagemagick abook pass task xclip weechat tmux mutt inkscape firefox npm python-pip adobe-source-code-pro-fonts ripgrep fzf hugo python-setuptools python2-setuptools rustup scour python-websocket-client python2-websocket-client ttf-freefont ttf-liberation ttf-droid docker-compose tlp

cd aur
for i in $( ls ); do
  cd $i
  if ! ls *.pkg.tar.xz
  then
    sudo -u davidbanham makepkg --ignorearch --clean --syncdeps --force
  fi
  pacman -U *.pkg.tar.xz
  cd ..
done
cd ..

usermod -aG docker $USER
systemctl enable docker lightdm.service tlp.service tlp-sleep.service

mkdir -p ~/.npm-global
npm config set prefix '~/.npm-global'
sudo -u davidbanham npm install -g typescript coffeescript yarn livedown coffee-script nesh

go get github.com/davidbanham/termcolour
go get github.com/davidbanham/monty

gcloud config set project speedtest-186210
gcloud auth login
gcloud container clusters get-credentials speedtest --zone australia-southeast1-a
