#!/bin/bash

PROXY_PROTOCOL="http"
PROXY_HOST="proxy.example.com"
PROXY_PORT="8080"

# get the current user, including the domain name
CURRENT_USER=$(who | awk '{print $1}')

# ask the user for the password
echo -n "Enter the password for $CURRENT_USER: "
read -s CURRENT_USER_PASSWORD

# convert the password to a URL encoded string
ENCODED_USER=$(echo $CURRENT_USER | hexdump -v -e '/1 "%02x"' | sed 's/\(..\)/%\1/g')
ENCODED_PASSWORD=$(echo $CURRENT_USER_PASSWORD | hexdump -v -e '/1 "%02x"' | sed 's/\(..\)/%\1/g')

FULL_PROXY_URL="$PROXY_PROTOCOL://$ENCODED_USER:$ENCODED_PASSWORD@$PROXY_HOST:$PROXY_PORT"

echo $FULL_PROXY_URL