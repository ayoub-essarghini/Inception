FROM alpine:3.19

RUN apk update && apk add --no-cache redis

EXPOSE 6379

ENTRYPOINT ["redis-server", "--protected-mode no"]