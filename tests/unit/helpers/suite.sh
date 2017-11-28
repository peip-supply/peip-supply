#!/usr/bin/env bash

# bootstrap
DIR="$( cd "$( dirname $0)" && pwd )";
THIS="${DIR}/${0##*/}";
ROOT_DIR="$( cd "$( dirname "$0")/../../.." && pwd )";
SHUNIT="${ROOT_DIR}/vendor/shunit2/shunit2";
HELPER_DIR="${ROOT_DIR}/helpers";
SHUNIT="${ROOT_DIR}/vendor/shunit2/shunit2";

# include test files
for F in ${DIR}/*
do
    if [ $F != $THIS ]; then
        if [ ! -d $F ]; then
            . ${F}
        fi
    fi
done

# suite
function suite {
    # get-root-dir
    suite_addTest rootDir_testNotNull
    suite_addTest rootDir_testIsDir
    # find-pkg-manager
    suite_addTest findMngr_testNotNull
    suite_addTest findMngr_testNotNullWithCustomList
    suite_addTest findMngr_testWrongManagerFails
    # find-pkg-dir
    suite_addTest detectPkgDir_testNotNull
    suite_addTest detectPkgDir_testInvalidDirExistsWithOne
}



echo "*****************************************"
echo "* RUNNING HELPERS TEST SUITE";
echo "*****************************************"

. ${SHUNIT}