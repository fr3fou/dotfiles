#!/bin/sh

while read -r line
do
    code=$(curl -I https://soundcloud.com/$line 2>/dev/null | head -n 1 | cut -d ' ' -f2)
    if [[ "$code" -eq "404" ]]
    then
        echo "$line" | tee -a sucessful3
    fi
done < 3words
