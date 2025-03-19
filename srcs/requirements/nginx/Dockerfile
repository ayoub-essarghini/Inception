FROM alpine:3.21.2

RUN apk update \
    && apk upgrade \
    && apk add --no-cache \
    nginx \
    openssl \
    && mkdir -p /var/www/html/ \
    && mkdir -p /etc/nginx/sites-enabled/ \
    && rm /var/cache/apk/* 

COPY /tools/script.sh /
COPY /conf /etc/nginx
COPY /index.html /var/www/html

RUN chmod 777 /script.sh

ENTRYPOINT [ "/script.sh" ]
CMD [ "nginx", "-g", "daemon off;"]
