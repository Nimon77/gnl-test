#!/bin/bash

# args
# 1. bufsize: int
# 2. includes folder
# 3. files to compile

CC=gcc
FLAGS=""
BUFFER_SIZE_NAME="BUFFER_SIZE"

if [ $# -lt 2 ]; then
    echo "invalid args"
    exit 1
fi

# get bufsize and includes
bufsize=$1
includes=$2
hasbonus=$3
shift 3

# make compiled folder
if [ ! -d "./compiled" ]; then
    mkdir -p "./compiled"
fi

# actually compiled
$CC $FLAGS -I $includes -o "./compiled/out-buf$bufsize" -D "$BUFFER_SIZE_NAME=$bufsize" -D "BONUS_GNL=$hasbonus" $* test.c
if [ ! $? -eq 0 ]; then
    echo "Failed to compile"
    exit 1
fi
