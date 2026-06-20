#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

writefile=$1
writestr=$2
dirpath=$(dirname "$writefile")

if [ ! -d "$dirpath" ]; then
    mkdir -p "$dirpath"
    if [ $? -ne 0 ]; then
        echo "Error: Could not create directory $dirpath"
        exit 1
    fi
fi

echo -n "$writestr" > "$writefile"
if [ $? -ne 0 ] || [ ! -f "$writefile" ]; then
    echo "Error: Could not create file $writefile"
    exit 1
fi
