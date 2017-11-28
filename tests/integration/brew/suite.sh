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
    # detect-pkg-manager
    suite_addTest testDetectMngrBrew
}



echo "*****************************************"
echo "* RUNNING BREW TEST SUITE";
echo "*****************************************"

if [ $(command -v "shunit2") ]; then
    source shunit2
else
    . ${SHUNIT}
fi
