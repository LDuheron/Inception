#!/bin/bash

openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=lduheron.42.fr/UID=lduheron"

nginx -g "daemon off;"