#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \ 
    -keyout /etc/ssl/private/aouhadou.key \
    -out /etc/ssl/certs/aouhadou.crt \
    -subj="/C=MA/ST=BM/O=1337/CN=aouhadou.42.fr"

mv ./conf/default /etc/nginx/sites-available/default

exec "$@"