#!/bin/sh

while true; do
    battery=$(acpi);
    result=$(echo $battery | grep -oh '[0-9]*%');
    echo $result;
    sleep 1;
done;
