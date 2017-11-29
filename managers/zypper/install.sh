#!/usr/bin/env bash

if [ ! $# == 1 ]; then
  echo "Usage: $0 package_name"
  exit
fi

echo "zypper --non-interactive install $1"
