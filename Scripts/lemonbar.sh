#!/bin/sh

clock() {
    date +%H:%M:%S
}

battery() {
    battery=$(acpi);
    result=$(echo $battery | grep -oh '[0-9]*%');
    echo $result;
}

while true; do
    BAR_INPUT="%{c}LIFE : $(battery)% TIME : $(clock)"
    echo $BAR_INPUT
    sleep 1
done
