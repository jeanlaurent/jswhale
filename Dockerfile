
FROM node:9.3.0-alpine

WORKDIR /bp

EXPOSE 3000

COPY . .

RUN npm install
CMD ["npm", "start"]
