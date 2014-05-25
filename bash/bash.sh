#!/bin/bash

echo This script gonna add some aliases to your bashrc file
sleep 2 

# ls
bashrc[0]="alias ll='ls -alF'"
bashrc[1]="alias la='ls -A'"
bashrc[2]="alias l='ls -CF'"
# apt
bashrc[3]="alias apt-get='sudo apt-get'"
# dpkg
bashrc[4]="alias dpkgi='sudo dpkg -i'"

# Add to bashrc
lineAdded=0
for line in "${bashrc[@]}"
do
    grep "${line}" ~/.bashrc > /dev/null
    if [ $? -ne 0 ]; then
       echo "${line}" >> ~/.bashrc
       echo "[OK] ${line} added to your bashrc."
       ((lineAdded++))
    else
       echo "[FAIL] ${line} already exists in bashrc file."
    fi 
done

# source bashrc
echo
echo "${lineAdded} line(s) added to bashrc"
if [ $lineAdded -gt 0 ]; then
    echo "Please run 'source ~/.bashrc' to enable aliases in your current shell"
fi
