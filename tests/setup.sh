#!/usr/bin/env bash

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}")/.." && pwd )";
VENDOR_DIR="${ROOT_DIR}/vendor";
if [ ! -d ${VENDOR_DIR} ]; then
    mkdir ${VENDOR_DIR}
fi
# installing shunit2
if [ ! -d "${VENDOR_DIR}/shunit2" ]; then
    cd ${VENDOR_DIR}
    curl -o shunit2.zip https://codeload.github.com/kward/shunit2/zip/master
    unzip ./shunit2.zip
    mv ./shunit2-master shunit2
    rm ./shunit2.zip
fi
