#!/usr/bin/env bash

function sourceAllOtherFiles {
    DIR="$( cd "$( dirname $0)" && pwd )";
    FILE="${DIR}/$(basename $0)"

    # source files
    for F in ${DIR}/*
    do
        if [ ${F} != ${FILE} -a ! -d ${F} ]; then
            source ${F}
        fi
    done
}
