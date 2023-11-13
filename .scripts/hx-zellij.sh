#!/bin/bash
if test -z "$1"
then
  echo "File name not provided"
  exit 1
fi

fileName=$(readlink -f $1) # full path to file

zellij action move-focus right
zellij action write 27 # send escape-key
zellij action write-chars ":o $fileName"
zellij action write 13 # send enter-key
