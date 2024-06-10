#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: $0 in_scope.txt [subdomains.txt]"
    echo "       cat subs.txt | $0 in_scope.txt"
    exit 1
}

# Check if at least one argument is provided
if [ "$#" -lt 1 ]; then
    usage
fi

# Assign arguments to variables
IN_SCOPE_FILE=$1
SUBDOMAINS_FILE=$2

# Check if the in-scope file exists
if [ ! -f "$IN_SCOPE_FILE" ]; then
    echo "Error: File $IN_SCOPE_FILE not found!"
    exit 1
fi

# Read in-scope domains into an array
mapfile -t IN_SCOPE_DOMAINS < "$IN_SCOPE_FILE"

# Function to process subdomains
process_subdomains() {
    while IFS= read -r SUBDOMAIN; do
        for DOMAIN in "${IN_SCOPE_DOMAINS[@]}"; do
            if [[ "$SUBDOMAIN" == *".$DOMAIN" ]] || [[ "$SUBDOMAIN" == "$DOMAIN" ]]; then
                echo "$SUBDOMAIN"
                break
            fi
        done
    done
}

# Check if subdomains file is provided or read from stdin
if [ -n "$SUBDOMAINS_FILE" ]; then
    # Check if the subdomains file exists
    if [ ! -f "$SUBDOMAINS_FILE" ]; then
        echo "Error: File $SUBDOMAINS_FILE not found!"
        exit 1
    fi

    # Read subdomains from file
    process_subdomains < "$SUBDOMAINS_FILE"
else
    # Read subdomains from stdin
    process_subdomains
fi
