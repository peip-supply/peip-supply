#!/usr/bin/env bash


# setup
TESTED="${HELPER_DIR}/get-root-dir.sh"
source ${TESTED}

rootDir_testNotNull() {
    assertNotNull "result should be not NULL" $(getRootDir)
}

rootDir_testIsDir() {
    RES=$(getRootDir)
    assertTrue "result should be a directory" "[ -d ${RES} ]"
}
