#!/bin/sh

CONNECTIONS=$(nmcli device wifi list | awk 'FNR > 1 {print $1 " ~ ( " $7 " )" }' | dmenu -l 5 | awk -F "~" '{print $1}')

echo $CONNECTIONS

PASSWORD=$(dmenu)

echo $PASSWORD

