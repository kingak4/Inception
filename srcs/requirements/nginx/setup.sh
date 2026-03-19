#!/bin/bash

mkdir -p /etc/ssl/private /etc/ssl/certs

openssl req -x509 -nodes -days 365 \
-subj "/CN=$DOMAIN_NAME" \
-newkey rsa:2048 \
-keyout /etc/ssl/private/nginx.key \
-out /etc/ssl/certs/nginx.crt

exec nginx -g "daemon off;"