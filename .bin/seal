#!/usr/bin/env bash
if [ "$1" == "help" ] || [ $# -ne 4 ]; then
    echo "usage: seal production server-secrets DB_PASS 123456";
    echo "            ^ namespace ^ secret name ^ key   ^ value"
    exit 0;
fi

echo -n $4 | kubectl create secret generic $1 -n $2 --dry-run=client --from-file="$3"=/dev/stdin -o json | kubeseal --controller-namespace sealed-secrets --format yaml
