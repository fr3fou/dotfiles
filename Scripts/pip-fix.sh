#!/bin/sh

while read -r line
do
    sudo pip3 uninstall $line
    # pip3 install --user $line
done < backup
