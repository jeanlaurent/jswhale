
FROM node:9.11-alpine

# only for HealthCheck
RUN apk add --no-cache curl 
HEALTHCHECK --interval=10s --timeout=3s CMD curl -f http://localhost:3000 || exit 1

WORKDIR /app

EXPOSE 3000

COPY . .
RUN npm install

CMD ["npm", "start"]