#!/bin/sh

/usr/local/bin/ssl.sh\

exec "nginx" "-g" "daemon off;"

echo "nginx started"