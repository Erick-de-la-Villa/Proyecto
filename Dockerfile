# syntax=docker/dockerfile:1

FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY . .
RUN adduser -D appuser && chown -R appuser /app
USER appuser
CMD [ "node", "src/index.js" ]
EXPOSE 3000