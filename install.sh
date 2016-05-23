#!/bin/bash
for i in $( ls ); do
  if [ $i = "install.sh" ]
  then
    continue
  fi
  stow $i -t ~
done
