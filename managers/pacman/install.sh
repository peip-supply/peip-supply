#!/usr/bin/env bash

if [ ! $# == 1 ]; then
  echo "Usage: $0 package_name"
  exit
fi

echo "yes | pacman -S $1 --noconfirm"
