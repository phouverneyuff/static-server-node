FROM readytalk/nodejs:latest

RUN npm install -g node-static

VOLUME /public

EXPOSE 8080
