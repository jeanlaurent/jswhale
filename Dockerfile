FROM nginxinc/nginx-unprivileged:1.27-alpine
COPY static /usr/share/nginx/html
