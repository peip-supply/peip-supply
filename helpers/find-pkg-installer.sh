#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}")" && pwd )"
source "${DIR}/get-root-dir.sh"

function findPackageInstaller {
    # parameters package-manager and package-name are needed
    if [ ! $# == 2 ]; then
      echo "Usage: $0 package-manager package-name"
      exit
    fi
    MNGR=$1
    PKG=$2
    ROOT_DIR=$(getRootDir);
    MANAGER_DIR="${ROOT_DIR}/managers/${MNGR}"
    expr "$(${MANAGER_DIR}/install.sh ${PKG})"
}
