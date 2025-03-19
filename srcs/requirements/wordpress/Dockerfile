FROM alpine:3.18

# Install necessary packages
RUN apk update && apk add --no-cache \
    php81 \
    php81-fpm \
    php81-mysqli \
    php81-json \
    php81-session \
    php81-zlib \
    php81-curl \
    php81-mbstring \
    php81-openssl \
    php81-dom \
    php81-xml \
    php81-simplexml \
    php81-tokenizer \
    php81-xmlwriter \
    php81-fileinfo \
    php81-phar \
    php81-ctype \
    php81-gd \
    php81-pdo \
    php81-pdo_mysql \
    curl \
    bash \
    netcat-openbsd \
    && rm -rf /var/cache/apk/*

# Configure PHP-FPM
RUN sed -i "s/listen = 127.0.0.1:9000/listen = 9000/g" /etc/php81/php-fpm.d/www.conf && \
    sed -i "s/;clear_env = no/clear_env = no/g" /etc/php81/php-fpm.d/www.conf

# Create necessary directories
RUN mkdir -p /var/www/html

# Download WordPress
RUN curl -o /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xzf /tmp/wordpress.tar.gz -C /var/www/html --strip-components=1 && \
    rm /tmp/wordpress.tar.gz

# Copy custom scripts
COPY tools/script.sh /script.sh

# Set permissions
RUN chmod +x /script.sh && chown -R nobody:nobody /var/www/html

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Set entrypoint
ENTRYPOINT ["/script.sh"]

# Start PHP-FPM
CMD ["/usr/sbin/php-fpm81", "-F"]