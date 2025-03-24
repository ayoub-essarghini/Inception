#!/bin/sh

# Create necessary directories if they don't exist
mkdir -p /usr/share/nginx/html

# Ensure proper permissions
chown -R nginx:nginx /usr/share/nginx/html

# Execute the command passed to the script
exec "$@"