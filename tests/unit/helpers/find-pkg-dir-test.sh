#!/usr/bin/env bash

# setup
TESTED="${HELPER_DIR}/find-pkg-dir.sh"
source ${TESTED}

detectPkgDir_testNotNull() {
    DIR=$(findPackageDir "bash" "peip")
    assertEquals "exit code should be 0" 0 $?
    assertNotNull "Result should be not NULL" ${DIR}
}


detectPkgDir_testInvalidDirExistsWithOne() {
    DIR=$(findPackageDir "foo" "bar")
    assertEquals "exit code should be 1" 1 $?
}
