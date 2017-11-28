#!/usr/bin/env bash


# error code
NOT_FOUND_ERROR=255

function checkPackageManager {
	if [ $(command -v $1) ];then
    exit 0
    fi
    exit 1
}

function detectPackageManager {
    # manager dir
    MNGR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}")/../managers" && pwd )";
    # package manager list
    MNGR_FILE="${MNGR_DIR}/managers"
    if [ $1 ]; then
        if [ ! -f $1 ]; then
            exit 1
        fi
        MNGR_FILE=$1
    fi

    PMs=( `cat "${MNGR_FILE}" `)

    for i in ${PMs[@]}; do
        if(! $(checkPackageManager ${i})); then
            continue
        fi

        expr $i
        exit 0
    done
    exit 1;
}


