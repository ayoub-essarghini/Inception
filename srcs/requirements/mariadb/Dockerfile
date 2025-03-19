FROM alpine:3.21.2

RUN apk update && apk upgrade && \
    apk add --no-cache mariadb mariadb-client && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql

COPY /tools/script.sh /script.sh

RUN chmod +x /script.sh

ENTRYPOINT ["/script.sh"]

CMD ["mariadbd-safe"]