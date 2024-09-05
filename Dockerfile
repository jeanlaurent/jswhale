FROM nginxinc/nginx-unprivileged:1.27.1-alpine
USER root
RUN apk update && \
    apk upgrade openssl=3.3.2-r0 expat=2.6.3-r0 && \
    rm -rf /var/cache/apk/*
USER nginx
COPY static /usr/share/nginx/html
