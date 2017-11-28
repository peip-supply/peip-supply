#!/usr/bin/env bash

# setup
TESTED="${HELPER_DIR}/find-pkg-installer.sh"
source ${TESTED}

findPkg_testNotNull() {
    RES1=$(findPackageInstaller "snap" "peip")
    assertEquals "exit code should be 0" 0 $?
    assertNotNull "${RES1}"
}

findPkg_commandValid() {
    RES1=$(findPackageInstaller "snap" "peip")
    assertEquals "snap install peip" "${RES1}"
}
