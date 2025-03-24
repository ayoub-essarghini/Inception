#!/bin/sh

# Install WP-CLI
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Increase PHP memory limit
echo "memory_limit = 256M" >> /etc/php82/php.ini

# Configure PHP-FPM to listen on the correct address
sed -i 's/listen = 127.0.0.1:9000/listen = 9000/g' /etc/php82/php-fpm.d/www.conf

# Change to the WordPress directory
cd /var/www/html

# Download and configure WordPress if not already installed
if [ ! -f wp-config.php ]; then
  echo "Downloading WordPress..."
  wp core download --locale=en_US --allow-root

  echo "Creating wp-config.php..."
  wp config create --dbhost="${WP_DB_HOST}" --dbname="${MYSQL_DATABASE}" --dbuser="${MYSQL_USER}" --dbpass="${MYSQL_PASSWORD}" --allow-root --extra-php <<EOF
define('WP_REDIS_HOST', '${REDIS_HOST}');
define('WP_REDIS_PORT', ${REDIS_PORT});
EOF

  echo "Installing WordPress..."
  wp core install \
    --url="${DOMAIN_NAME}" \
    --title="${WP_TITLE}" \
    --admin_user="${WP_ADMIN_USR}" \
    --admin_password="${WP_ADMIN_PWD}" \
    --admin_email="${WP_ADMIN_EMAIL}" \
    --skip-email \
    --allow-root

  echo "Creating additional WordPress user..."
  wp user create "${WP_USER}" "${WP_USER_EMAIL}" --role=author --user_pass="${WP_USER_PWD}" --allow-root

  echo "Installing and enabling Redis plugin..."
  wp plugin install redis-cache --activate --allow-root
  wp redis enable --allow-root
else
  echo "WordPress already installed. Skipping installation steps."
  
  # Update Redis configuration in wp-config.php
  if ! grep -q "WP_REDIS_HOST" /var/www/html/wp-config.php; then
    wp config set WP_REDIS_HOST "${REDIS_HOST}" --allow-root
    wp config set WP_REDIS_PORT "${REDIS_PORT}" --allow-root
  fi
  
  wp redis enable --allow-root
fi

# Set proper permissions
chown -R nobody:nobody /var/www

# Start PHP-FPM
exec /usr/sbin/php-fpm82 -F