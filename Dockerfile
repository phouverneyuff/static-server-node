FROM readytalk/nodejs:latest

RUN npm install -g static

VOLUME /public

EXPOSE 8080

CMD ["static"]
