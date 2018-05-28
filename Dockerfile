
FROM node:9.3.0-alpine

# only for HealthCheck
RUN apk add --no-cache curl 

WORKDIR /bp

EXPOSE 3000

COPY . .

RUN npm install
CMD ["npm", "start"]

HEALTHCHECK --interval=10s --timeout=3s CMD curl -f http://localhost:3000 || exit 1