#!/usr/bin/sh

if [[ $# -lt 2 ]]; then
    echo "ERROR: Invalide number of arguments!! (expected: 2 found: $#)"
    echo "Arg(1): Full path to the file"
    echo "Arg(2): String to be written within this file"
    exit 1
fi

writefile=$1
writestr=$2

if [[ -e $writefile ]]; then
    echo $writestr > $writefile
else
    echo "'$writefile' does not exist!! Creating the file..."
    mkdir -p $(dirname "$writefile") && echo $writestr > $writefile

    if [[ $? -eq 1 ]]; then
        echo "Failed to create the file: '$writefile'"
        exit 1
    fi
fi
