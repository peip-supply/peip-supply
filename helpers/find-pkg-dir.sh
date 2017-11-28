#!/usr/bin/env bash

function findPackageDir {
    # parameters package-manager and package-name are needed
    if [ ! $# == 2 ]; then
      #echo "Usage: $0 package-manager package-name"
      return 1
    fi
    PM=$1
    PKG=$2
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}")/.." && pwd )/scripts/${PKG}/${PM}"
    if [ -d ${DIR} ]; then
        expr ${DIR}
        return 0
    fi
    return 1
}