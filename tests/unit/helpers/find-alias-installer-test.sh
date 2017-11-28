#!/usr/bin/env bash

# setup
TESTED="${HELPER_DIR}/find-alias-installer.sh"
source ${TESTED}

findAlias_testNotNull() {
    # postive result
    RES1=$(findAliasInstaller "snap" "peip")
    assertNotNull "${RES1}"
}

findAlias_commandValid() {
    # postive result
    RES1=$(findAliasInstaller "snap" "peip")
    assertEquals "snap install peip" "${RES1}"
}

