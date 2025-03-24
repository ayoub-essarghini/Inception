FROM alpine:3.19

RUN apk update && apk add --no-cache \
    php82 \
    php82-fpm \
    php82-mysqli \
    php82-xml \
    php82-mbstring \
    php82-phar \
    php82-opcache \
    php82-json \
    php82-session \
    wget \
    unzip

RUN mkdir -p /var/www/html

COPY tools/script.sh /script.sh

RUN chmod +x /script.sh

EXPOSE 9000

ENTRYPOINT ["/script.sh"]