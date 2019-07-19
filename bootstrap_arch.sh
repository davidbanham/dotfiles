#!/bin/bash
set -euxo pipefail

cat ./pkglist.txt | pacman -S

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
