#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}")" && pwd )"
source "${DIR}/find-pkg-dir.sh"
source "${DIR}/get-native-installer.sh"

function findAliasInstaller {
    # parameters package-manager and package-name are needed
    if [ ! $# == 2 ]; then
        return 1
    fi
    MNGR=$1
    PKG=$2
    PKG_DIR=$(findPackageDir ${MNGR} ${PKG})
    if [ ! ${PKG_DIR} ]; then
        return 1
    fi

    ALIAS_FILE="${PKG_DIR}/alias"
    if [ -f ${ALIAS_FILE} ]; then
        ALIAS=$(head -n 1 ${ALIAS_FILE})
        INSTALLER=$(getNativeInstaller ${MNGR} ${ALIAS})
        expr "${INSTALLER}"
        return 0
    fi

    return 1
}
