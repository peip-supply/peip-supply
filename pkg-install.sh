#!/usr/bin/env bash

# parameter package-name is needed
if [ ! $# == 1 ]; then
  echo "Usage: $0 package_name"
  exit 1
fi

# working dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}")" && pwd )";
source "${DIR}/helpers/install-package.sh"

installPackage ${1};
