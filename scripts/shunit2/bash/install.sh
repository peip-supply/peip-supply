#!/usr/bin/env bash

if [ ! $(command -v "shunit2") ]; then

    cd ~
    mkdir shunit2
    cd shunit2
    curl -o shunit2.zip https://codeload.github.com/kward/shunit2/zip/master
    unzip -q ./shunit2.zip
    mv ./shunit2-master /usr/local/lib/shunit2
    ln -s /usr/local/lib/shunit2/shunit2 /usr/local/bin/shunit2
    cd ~ 
    rm -f -r ./shunit2
    if [ ! $(command -v "shunit2") ]; then
        echo "Failed to install shunit2"
        exit 1
    fi
fi
