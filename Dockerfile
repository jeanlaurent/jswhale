FROM nginx:1.21.4-alpine
RUN apk add -u brotli-libs
COPY static /usr/share/nginx/html