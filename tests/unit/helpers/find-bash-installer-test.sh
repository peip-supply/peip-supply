#!/usr/bin/env bash

# setup
TESTED="${HELPER_DIR}/find-bash-installer.sh"
source ${TESTED}

findBash_testNotNull() {
    RES1=$(findBashInstaller "peip")
    assertEquals "exit code should be 0" 0 $?
    assertNotNull "${RES1}"
    assertTrue "[ -x "${RES1}" ]"
}

findBash_scriptExecutable() {
    RES1=$(findBashInstaller "peip")
    assertTrue "[ -x "${RES1}" ]"
}
