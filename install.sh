#!/bin/bash
for i in $( ls ); do
  if [ $i = "install.sh" ]
  then
    continue
  fi
  if [ $i = "README.md" ]
  then
    continue
  fi
  if [ $i = "bootstrap.sh" ]
  then
    continue
  fi
  if [ $i = "root_stuff" ]
  then
    continue
  fi
  if [ $i = "aur" ]
  then
    continue
  fi
  stow $i -t ~
done

cd root_stuff
for i in $( ls ); do
  sudo stow $i -t /
done
