FROM nginxinc/nginx-unprivileged:1.27.1-alpine
COPY static /usr/share/nginx/html
