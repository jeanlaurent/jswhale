FROM nginxinc/nginx-unprivileged:1.27.1-alpine@sha256:210cfc5bd0cf396a75962e906f7aa7a23b826855125940ce16abbb17fd018f74
USER root
RUN apk update && \
    apk add --no-cache openssl=3.3.2-r0 && \
    apk add --no-cache libexpat=2.6.3-r0 && \
    rm -rf /var/cache/apk/*
USER nginx
COPY static /usr/share/nginx/html
