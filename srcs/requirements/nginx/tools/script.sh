#!/bin/sh

mkdir -p /etc/ssl/private /etc/ssl/certs

openssl req -newkey rsa:2048 -x509 -sha256 -days 7 -nodes \
	-keyout /etc/ssl/private/ssl.key \
	-out /etc/ssl/certs/ssl.crt \
	-subj "/C=MA/ST=BenGuerir/L=BG/O=42/OU=1337BG/CN=aes-sarg"

ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/

exec "$@"