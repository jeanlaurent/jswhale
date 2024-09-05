FROM nginxinc/nginx-unprivileged:1.27.1-alpine
USER root
RUN apk update && \
    apk add --no-cache openssl=3.3.2-r0 && \
    apk add --no-cache libexpat=2.6.3-r0 && \
    rm -rf /var/cache/apk/*
USER nginx
COPY static /usr/share/nginx/html
