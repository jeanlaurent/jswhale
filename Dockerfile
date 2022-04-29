FROM nginx:1.19.3-alpine@sha256:5aa44b407756b274a600c7399418bdfb1d02c33317ae27fd5e8a333afb115db1
RUN apk add -u brotli-libs
COPY static /usr/share/nginx/html