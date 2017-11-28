#!/usr/bin/env bash

function installPackage {
    # parameter package-name is needed
    if [ ! $# == 1 ]; then
      echo "Usage: $0 package_name"
      exit 1
    fi

    DIR="$( cd "$( dirname $BASH_SOURCE)" && pwd )";
    THIS="${DIR}/${0##*/}";

    # include helper files
    for F in ${DIR}/*
    do
        if [ ${F} != ${THIS} -a ! -d ${F} ]; then
            source ${F}
        fi
    done

    # package
    PKG=$1
    # check if bash installer exists
    BASH_INSTALLER=$(findBashInstaller ${PKG})
    if [ "${BASH_INSTALLER}"  ]; then
        printMessage "Install '${PKG}' via bash"
        ${BASH_INSTALLER}
        return 0;
    fi
    # did not find a bash installer, so look for the local package manager
    PKG_MNGR=$(detectPackageManager)
    if [ ! "${PKG_MNGR}"  ]; then
        printMessage "Could not package manager. aborting... "
        return 1;
    fi
    # check if package installer script exists
    INSTALLER=$(findInstallScript ${PKG_MNGR} ${PKG})
    if [ "${INSTALLER}"  ]; then
        MSG="Install '${PKG}' via '${PKG_MNGR}' install script"
        echo "${INSTALLER}"
        printMessage "Install '${PKG}' via '${PKG_MNGR}' install script"
        ${INSTALLER}
        return 0;
    fi
    # check if package alias exists
    ALIAS_INSTALLER=$(findAliasInstaller ${PKG_MNGR} ${PKG})
    if [ "${ALIAS_INSTALLER}"  ]; then
    MSG="Install '${PKG} via ${PKG_MNGR}' alias";
    echo ${MSG}
        printMessage "Install '${PKG} via ${PKG_MNGR}' alias"
        ${ALIAS_INSTALLER}
        return 0;
    fi
    printLine "Could not find install strategy for '${PKG}'"
    printLine "Trying native package install for '${PKG}'"
    printMessage "Install '${PKG}' via '${PKG_MNGR}' "
    INSTALLER=$(findPackageInstaller ${PKG_MNGR} ${PKG})
    ${INSTALLER}
    return 0;
}
