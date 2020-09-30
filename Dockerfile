FROM nginx:1.19.2-alpine
RUN apk add -u curl
RUN apk add -u libxml2
COPY static /usr/share/nginx/html