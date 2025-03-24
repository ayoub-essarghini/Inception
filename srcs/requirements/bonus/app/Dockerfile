FROM alpine:3.19

# Install nginx
RUN apk update && apk add --no-cache nginx && \
    mkdir -p /usr/share/nginx/html /run/nginx && \
    rm -rf /var/cache/apk/*

# Copy website files
COPY tools/src /usr/share/nginx/html

# Copy nginx configuration
COPY tools/nginx.conf /etc/nginx/http.d/default.conf

# Expose port 80
EXPOSE 80

# Create startup script
COPY tools/script.sh /script.sh
RUN chmod +x /script.sh

ENTRYPOINT ["/script.sh"]
CMD ["nginx", "-g", "daemon off;"]