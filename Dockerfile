FROM nginxinc/nginx-unprivileged:1.27.1-alpine
USER root
RUN apk update && \
    apk upgrade openssl expat && \
    rm -rf /var/cache/apk/*
USER nginx
COPY static /usr/share/nginx/html
