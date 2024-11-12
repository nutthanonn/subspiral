#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <domain>"
    echo "Please provide a domain as a parameter."
    exit 1
fi

domain=$1

subfinder -d ${domain} -o domains.txt

curl -s "https://crt.sh/?q=${domain}&output=json" | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u | tee -a crt_domain.txt
