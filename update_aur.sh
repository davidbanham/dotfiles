#!/bin/bash
set -euxo pipefail

if ! ls submodules_updated
then
  git submodule update --recursive --remote
  touch submodules_updated
fi

if test -z $(cat aurs)
then
  ls aur > aurs
fi

cd aur
for i in $( cat ../aurs ); do
  cd $i
  if ls *.pkg.tar.xz
  then
    rm *.pkg.tar.xz
  fi
  sudo -u davidbanham makepkg --ignorearch --clean --syncdeps --force
  pacman -U *.pkg.tar.xz
  cd ..
  tail -n +2 ../aurs > ../new_aurs && mv ../new_aurs ../aurs
done
cd ..

rm submodules_updated
rm aurs
