FROM alpine:3.19

RUN apk update && apk add --no-cache nginx openssl

COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY conf/default.conf /etc/nginx/http.d/default.conf

COPY utils/ssl.sh /usr/local/bin/ssl.sh

RUN mkdir -p /var/www/html && chmod +x /usr/local/bin/ssl.sh 
  
COPY utils/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
    
EXPOSE 443

ENTRYPOINT ["/entrypoint.sh"]
