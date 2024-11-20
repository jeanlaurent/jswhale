FROM nginxinc/nginx-unprivileged:1.27.1-alpine@sha256:380f5fa14ad2400888da70ca5b318759e63cd0bdefa7ee4ffa42fe740d1805e8
USER root
RUN apk update && \
    apk add --no-cache openssl=3.3.2-r0 && \
    apk add --no-cache libexpat=2.6.3-r0 && \
    rm -rf /var/cache/apk/*
USER nginx
COPY static /usr/share/nginx/html
