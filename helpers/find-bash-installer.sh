#!/usr/bin/env bash

function findBashInstaller {
    # parameter package-name is needed
    if [ ! $# == 1 ]; then
        return 1
    fi
    PKG=$1
    SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}")/.." && pwd )/scripts"
    INSTALLER="${SCRIPT_DIR}/${PKG}/bash/install.sh"
    if [ -a "${INSTALLER}" ]; then
        expr "${INSTALLER}"
        return 0
    fi
expr "${INSTALLER}"
    return 2
}
