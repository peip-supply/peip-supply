#!/usr/bin/env bash

# setup
TESTED="${HELPER_DIR}/detect-pkg-mngr.sh"
source ${TESTED}

detectMngr_testNotNull() {
    # postive result
    RES1=$(detectPackageManager)
    assertNotNull "Result should be not NULL" "${RES1}"
    # managers
    MNGRS_FILE1="$( cd "$( dirname $0)/fixtures" && pwd )/valid_managers";
    VALID_MANAGERS=( $(cat "${MNGRS_FILE1}") )
    for i in ${VALID_MANAGERS[@]}; do
        if [ "${RES1}" = "${i}" ]; then
            R=${i};
        fi
    done
    assertNotNull "Package manager should be valid" "${R}"
}

# custom manager list
detectMngr_testNotNullWithCustomList() {
    # postive result
    RES1=$(detectPackageManager)
    RES2=$(detectPackageManager ${MNGRS_FILE1})
    assertNotNull "Result should be not NULL" "${RES2}"
    assertEquals "${RES1}" "${RES2}"
}

# invalid managers
detectMngr_testWrongManagerFails() {
    MNGRS_FILE2="$( cd "$( dirname $0)" && pwd )/fixtures/invalid_managers";
    # negative result
    RES1=$(detectPackageManager ${MNGRS_FILE2})
    assertNull "${RES1}"
}

