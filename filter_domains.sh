#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 in_scope.txt subdomains.txt"
    exit 1
fi

# Assign arguments to variables
IN_SCOPE_FILE=$1
SUBDOMAINS_FILE=$2

# Check if the input files exist
if [ ! -f "$IN_SCOPE_FILE" ]; then
    echo "Error: File $IN_SCOPE_FILE not found!"
    exit 1
fi

if [ ! -f "$SUBDOMAINS_FILE" ]; then
    echo "Error: File $SUBDOMAINS_FILE not found!"
    exit 1
fi

# Read in-scope domains into an array
mapfile -t IN_SCOPE_DOMAINS < "$IN_SCOPE_FILE"

# Loop through each subdomain and check if it matches any in-scope domain
while IFS= read -r SUBDOMAIN; do
    for DOMAIN in "${IN_SCOPE_DOMAINS[@]}"; do
        if [[ "$SUBDOMAIN" == *".$DOMAIN" ]] || [[ "$SUBDOMAIN" == "$DOMAIN" ]]; then
            echo "$SUBDOMAIN"
            break
        fi
    done
done < "$SUBDOMAINS_FILE"
