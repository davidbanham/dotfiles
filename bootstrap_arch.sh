#!/bin/bash
set -euxo pipefail

pacman -S xfce4 xf86-video-intel xorg-server base-devel openssh

pacman -S neovim python-neovim redshift docker nodejs tarsnap go xmonad stow python python2 zsh jq htop ffmpeg imagemagick abook pass task xclip weechat tmux mutt inkscape firefox npm python-pip adobe-source-code-pro-fonts ripgrep fzf hugo python-setuptools python2-setuptools rustup scour python-websocket-client python2-websocket-client ttf-freefont ttf-liberation ttf-droid docker-compose tlp xdg-utils lynx postgresql bc arduino pulseaudio pulseaudio-alsa pulseaudio-bluetooth xfce4-pulseaudio-plugin pavucontrol minicom bluez bluez-utils blueman-manager zip unzip virtualbox s3cmd go-tools siege arp-scan opencv

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
systemctl enable docker lightdm.service tlp.service tlp-sleep.service pulseaudio.service netctl-auto@wlp2s0.service

mkdir -p ~/.npm-global
npm config set prefix '~/.npm-global'
sudo -u davidbanham npm install -g typescript coffeescript yarn livedown coffee-script nesh

go get github.com/davidbanham/termcolour
go get github.com/davidbanham/monty

gcloud config set project speedtest-186210
gcloud auth login
gcloud container clusters get-credentials speedtest --zone australia-southeast1-a

echo "Arduino Bash C Docker Express Go HTML JavaScript Markdown MomentJS NodeJS PhoneGap PostgreSQL React Redis Rust SVG Vim" | xargs -n 1 | awk '{print "^"$$1"$"}' | xargs -n 1 dasht-docsets-install -f
