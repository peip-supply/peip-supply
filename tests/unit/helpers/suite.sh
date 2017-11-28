#!/usr/bin/env bash

# bootstrap
DIR="$( cd "$( dirname $0)" && pwd )";
THIS="${DIR}/${0##*/}";
ROOT_DIR="$( cd "$( dirname "$0")/../../.." && pwd )";
SHUNIT="${ROOT_DIR}/vendor/shunit2/shunit2";
HELPER_DIR="${ROOT_DIR}/helpers";
SHUNIT="${ROOT_DIR}/vendor/shunit2/shunit2";

# include test files
source "${HELPER_DIR}/source-all-other-files.sh"
sourceAllOtherFiles

# suite
function suite {
    # get-root-dir
    suite_addTest rootDir_testNotNull
    suite_addTest rootDir_testIsDir
    # find-pkg-manager
    suite_addTest detectMngr_testNotNull
    suite_addTest detectMngr_testNotNullWithCustomList
    suite_addTest detectMngr_testWrongManagerFails
    # find-pkg-dir
    suite_addTest detectPkgDir_testNotNull
    suite_addTest detectPkgDir_testInvalidDirExistsWithOne
    # find-alias-installer
    suite_addTest findAlias_testNotNull
    suite_addTest findAlias_commandValid
    # find-bash-installer
    suite_addTest findBash_testNotNull
    suite_addTest findBash_scriptExecutable
    # find-install-script
    suite_addTest findScript_testNotNull
    suite_addTest findBash_scriptExecutable
    # find-pkg-script
    suite_addTest findPkg_testNotNull
    suite_addTest findPkg_commandValid
}



echo "*****************************************"
echo "* RUNNING HELPERS TEST SUITE";
echo "*****************************************"

if [ $(command -v "shunit2") ]; then
    source shunit2
else
    . ${SHUNIT}
fi



