FROM nginxinc/nginx-unprivileged:1.26.1-alpine
COPY static /usr/share/nginx/html
