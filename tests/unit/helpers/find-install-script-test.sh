#!/usr/bin/env bash

# setup
TESTED="${HELPER_DIR}/find-install-script.sh"
source ${TESTED}

findScript_testNotNull() {
    RES1=$(findInstallScript "snap" "peip")
    assertEquals "exit code should be 0" 0 $?
    assertNotNull "${RES1}"
    assertTrue "[ -x "${RES1}" ]"
}

findBash_scriptExecutable() {
    RES1=$(findInstallScript "snap" "peip")
    assertTrue "[ -x "${RES1}" ]"
}
