FROM nginxinc/nginx-unprivileged:1.25.3-alpine
COPY static /usr/share/nginx/html
