#!/usr/bin/env bash

# setup
TESTED="${HELPER_DIR}/detect-pkg-mngr.sh"
source ${TESTED}
# managers
MNGRS_FILE1="$( cd "$( dirname $0)" && pwd )/fixtures/valid_managers";
VALID_MANAGERS=( `cat "${MNGRS_FILE1}" `)


detectMngr_testNotNull() {
    # postive result
    RES1=$(detectPackageManager)
    assertNotNull  ${RES1}

    for i in ${VALID_MANAGERS[@]}; do
        if [ "${RES1}" != "${i}" ]; then
            continue;
        fi
        R=${i};
    done
    assertNotNull ${R}
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

