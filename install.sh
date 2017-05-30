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
  stow $i -t ~
done
