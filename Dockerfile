FROM nginx:1.19.3-alpine
RUN apk add -u brotli-libs
COPY static /usr/share/nginx/html