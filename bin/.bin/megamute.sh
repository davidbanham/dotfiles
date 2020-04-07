#!/bin/bash

SOURCES=`pacmd list-sources| grep -v monitor | grep "name:" | sed "s/name\: //" | sed "s/<//" | sed "s/>//"`

if grep --quiet muted ~/.global_mic_status
then
  for src in $SOURCES
  do
    pacmd set-source-mute $src false
    echo "hot" > ~/.global_mic_status
  done
else
  for src in $SOURCES
  do
    pacmd set-source-mute $src true
    echo "muted" > ~/.global_mic_status
  done
fi
