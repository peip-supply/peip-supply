#!/usr/bin/env bash

# setup
TESTED="${HELPER_DIR}/detect-pkg-mngr.sh"
source ${TESTED}

testDetectMngrPacman() {
    # postive result
    RES1=$(detectPackageManager)
    assertNotNull "Result should be not NULL" "${RES1}"
    assertEquals "pacman" "${RES1}"
}
