#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}")" && pwd )"
source "${DIR}/find-pkg-dir.sh"

function findInstallScript {
    # parameters package-manager and package-name are needed
    if [ ! $# == 2 ]; then
        return 1
    fi

    PKG_DIR=$(findPackageDir $1 $2)
    if [ ! ${PKG_DIR} ]; then
        return 1
    fi

    INSTALLER="${PKG_DIR}/install.sh"
    if [ -f ${INSTALLER} ]; then
        expr ${INSTALLER}
        return 0
    fi

    return 1
}