#!/bin/bash

#The purpose of this file is to configure Vim with a set of default options
filepath=~/.vimrc
vimrc[0]='set number'

# Check if vimrc exists
test -e ${filepath}
if [ $? -ne 0 ]; then
    echo "${filepath} not found in user dir. Attempt creation ... "
    touch ${filepath}
    if [ $? -ne 0 ]; then
        echo "${filepath} creation failed. Exit script"
        exit
    fi
    echo "${filepath} successfully created."
fi

echo

test -w ${filepath}
if [ $? -ne 0 ]; then
    echo "${filepath} not writeable. Exit script"
    exit
fi

echo

# Add to vimrc
lineAdded=0
for line in "${vimrc[@]}"
do
    grep "${line}" ${filepath} > /dev/null
    if [ $? -ne 0 ]; then
       echo "${line}" >> ${filepath}
       echo "[OK] '${line}' added to ${filepath}"
       ((lineAdded++))
    else
       echo "[FAIL] ${line} already exists in ${filepath}"
    fi 
done

# This is it
echo
echo "${lineAdded} line(s) added to ${filepath}"
