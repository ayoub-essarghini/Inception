FROM alpine:3.19

RUN apk update && apk add --no-cache vsftpd

COPY tools/script.sh /script.sh

RUN chmod +x /script.sh

EXPOSE 21 21100-21110

ENTRYPOINT ["/script.sh"]